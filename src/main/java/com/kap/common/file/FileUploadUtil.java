package com.kap.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadUtil {
	/***** ������ ���ε��� ���� ���� *****/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if (fileDir.exists()) {
			return;
		}
		fileDir.mkdirs(); //������ �������� ���� ��쿡�� ���� ����
	}
	
	/***** ���� ���ε� �޼��� *****
	 * ���ϸ� �ߺ� �� �ذ���
	 * System.currentTimeMillis()�� ����ϰų� 128��Ʈ�� ���� UUID ���
	 * ǥ�� ���Ŀ��� UUID�� 32���� 16������ ǥ���Ǹ� �� 36�� ����(32�� ���ڿ� 4���� ������)�� �� 8-4-4-4-12��� 5���� �׷��� ���������� �����Ѵ�.
	 * �̶� UUID.randomUUID().toString()�� �̿��ؼ� ��´�.
	 * ����) 50e8400-e29b-41d4-a716-446655440000
	 * */
	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		log.info("fileUpload() ȣ�� ����");
		String real_name = "";
		
		// MultipartFile Ŭ������ getFile() �޼���� Ŭ���̾�Ʈ�� ���ε��� ����
		String org_name = file.getOriginalFilename();
		log.info("���ε� ���ϸ�: " + org_name);
		
		// �ߺ����� �ʵ��� ���ϸ� ����
		if (org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
			
			/* Windows */
			String docRoot = "C://uploadStorage//" + fileName;
			/* MacOS
			String docRoot = "/Library/uploadStorage/" + fileName; */
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name);
			log.info("���ε��� ����: " + fileAdd);
			
			file.transferTo(fileAdd); //�� �޼��忡 ���� ���������� ��ο� ���� ����
		}
		
		return real_name; //������ ����� ���ϸ� ��ȯ
	}
	
	/***** ���� ���� �޼��� *****/
	public static void fileDelete(String fileName) throws IOException {
		log.info("fileDelete() ȣ�� ����");
		boolean result = false;
		String startDirName = "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		if (dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length() + 1, fileName.indexOf("_", dirName.length()+1));
			/* Windows */
			docRoot = "C://uploadStorage//" + startDirName + "//" + dirName;
			/* MacOS
			docRoot = "/Library/uploadStorage/" + startDirName + "/" + dirName; */
		} else {
			/* Windows */
			docRoot = "C://uploadStorage//" + dirName;
			/* MacOS
			docRoot = "/Library/uploadStorage/" + dirName; */
		}
		
		File fileDelete = new File(docRoot + "/" + fileName);
		if (fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		
		log.info("���� ���� ����: " + result);
	}
	
	/***** ����� ���� �޼��� *****/
	public static String makeThumbnail(String fileName) throws Exception {
		// �̹����� �����ϴ� ���� ����
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		// ����� ������ ���� ���(������ ��ġ)
		/* Windows */
		String imgPath = "C://uploadStorage//" + dirName;
		/* MacOS
		String imgPath = "/Library/uploadStorage/" + dirName; */
		
		File fileAdd = new File(imgPath, fileName);
		log.info("���� �̹��� ����(fileAdd):" + fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd); //fileAdd�� �ش��ϴ� �̹��� ������ �о�ͼ� �����ͷ� ����
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133); //ũ�⸦ �����Ͽ� �̹��� ������ ����
									//resize(BufferedImage Ÿ�� ���� �̹���, ���� ���μ��� ����, ���� �Ǵ� �ʺ�, ũ��)
		
		String thumbnailName = "thumbnail_" + fileName;
		String docRoot = imgPath + "/thumbnail";
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName);
		log.info("���ε��� ����: " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); //������ .�� ��ġ �������� ������ �ڸ�
		log.info("Ȯ����: " + formatName);
		
		ImageIO.write(destImg, formatName, newFile); //����Ͽ����� ������ �̹��� �����͸� ������ ���Ͽ� ����
		return thumbnailName; //������ ����� ���ϸ� ��ȯ
	}
}
