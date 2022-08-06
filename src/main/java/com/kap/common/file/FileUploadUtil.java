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
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name; //board_1658205347977_dog.jpg
			
			String docRoot = "/Library/UploadStorage/" + fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name);
			log.info("���ε��� ����: " + fileAdd);
			
			file.transferTo(fileAdd); //�� �޼��忡 ���� ���������� ��ο� ���� ����
		}
		
		return real_name; //������ ����� ���ϸ� ��ȯ -> board_1658205347977_dog.jpg
	}
	
	/***** ���� ���� �޼��� *****
	 * ��� �� ���ϸ�: board/board_1658205347977_dog.jpg
	 * ����� ��� �� ���ϸ�: board/thumbnail/thumbnail_board_1658205347977_dog.jpg
	 * */
	public static void fileDelete(String fileName) throws IOException {
		log.info("fileDelete() ȣ�� ����");
		boolean result = false;
		String startDirName = "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_")); //���ϸ� thumbnail_board_1658205347977_dog.jpg -> "thumbnail"
		
		if (dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length() + 1, fileName.indexOf("_", dirName.length()+1)); //���ϸ� thumbnail_board_1658205347977_dog.jpg -> "board"
			docRoot = "/Library/UploadStorage/" + startDirName + "/" + dirName; //docRoot = /Library/UploadStorage/board/thumbnail
		} else {
			docRoot = "/Library/UploadStorage/" + dirName; //docRoot = /Library/UploadStorage/board
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
		String dirName = fileName.substring(0, fileName.indexOf("_")); //���ϸ� board_1658205347977_dog.jpg -> "board"
		// ����� ������ ���� ���(������ ��ġ)
		String imgPath = "/Library/UploadStorage/" + dirName;
		
		File fileAdd = new File(imgPath, fileName); //fileAdd = /Library/UploadStorage/board/board_1658205347977_dog.jpg
		log.info("���� �̹��� ����(fileAdd):" + fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd); //fileAdd�� �ش��ϴ� �̹��� ������ �о�ͼ� �����ͷ� ����
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133); //ũ�⸦ �����Ͽ� �̹��� ������ ����
									//resize(BufferedImage Ÿ�� ���� �̹���, ���� ���μ��� ����, ���� �Ǵ� �ʺ�, ũ��)
		
		String thumbnailName = "thumbnail_" + fileName; //thumbnailName = thumbnail_board_1658205347977_dog.jpg
		String docRoot = imgPath + "/thumbnail"; //docRoot = /Library/UploadStorage/board/thumbnail
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName); //newFile = /Library/UploadStorage/board/thumbnail/thumbnail_board_1658205347977_dog.jpg
		log.info("���ε��� ����: " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); //������ .�� ��ġ �������� ������ �ڸ� -> "jpg"
		log.info("Ȯ����: " + formatName);
		
		ImageIO.write(destImg, formatName, newFile); //����Ͽ����� ������ �̹��� �����͸� ������ ���Ͽ� ����
		return thumbnailName; //������ ����� ���ϸ� ��ȯ -> thumbnail_board_1658205347977_dog.jpg
	}
}