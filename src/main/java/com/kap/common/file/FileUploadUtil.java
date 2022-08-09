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
	/***** 파일을 업로드할 폴더 생성 *****/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if (fileDir.exists()) {
			return;
		}
		fileDir.mkdirs(); //폴더가 존재하지 않을 경우에만 새로 생성
	}
	
	/***** 파일 업로드 메서드 *****
	 * 파일명 중복 시 해결방법
	 * System.currentTimeMillis()를 사용하거나 128비트의 수인 UUID 사용
	 * 표준 형식에서 UUID는 32개의 16진수로 표현되며 총 36개 문자(32개 문자와 4개의 하이픈)로 된 8-4-4-4-12라는 5개의 그룹을 하이픈으로 구분한다.
	 * 이때 UUID.randomUUID().toString()을 이용해서 얻는다.
	 * 예시) 50e8400-e29b-41d4-a716-446655440000
	 * */
	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		log.info("fileUpload() 호출 성공");
		String real_name = "";
		
		// MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일
		String org_name = file.getOriginalFilename();
		log.info("업로드 파일명: " + org_name);
		
		// 중복되지 않도록 파일명 변경
		if (org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
			
			/* Windows
			String docRoot = "C://uploadStorage//" + fileName; */
			/* MacOS */
			String docRoot = "/Library/uploadStorage/" + fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name);
			log.info("업로드할 파일: " + fileAdd);
			
			file.transferTo(fileAdd); //이 메서드에 의해 실질적으로 경로에 파일 생성
		}
		
		return real_name; //서버에 저장된 파일명 반환
	}
	
	/***** 파일 삭제 메서드 *****/
	public static void fileDelete(String fileName) throws IOException {
		log.info("fileDelete() 호출 성공");
		boolean result = false;
		String startDirName = "", docRoot = "";
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		
		if (dirName.equals("thumbnail")) {
			startDirName = fileName.substring(dirName.length() + 1, fileName.indexOf("_", dirName.length()+1));
			/* Windows
			docRoot = "C://uploadStorage//" + startDirName + "//" + dirName; */
			/* MacOS */
			docRoot = "/Library/uploadStorage/" + startDirName + "/" + dirName;
		} else {
			/* Windows
			docRoot = "C://uploadStorage//" + dirName; */
			/* MacOS */
			docRoot = "/Library/uploadStorage/" + dirName;
		}
		
		File fileDelete = new File(docRoot + "/" + fileName);
		if (fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		
		log.info("파일 삭제 여부: " + result);
	}
	
	/***** 썸네일 생성 메서드 *****/
	public static String makeThumbnail(String fileName) throws Exception {
		// 이미지가 존재하는 폴더 추출
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		// 추출된 폴더의 실제 경로(물리적 위치)
		/* Windows
		String imgPath = "C://uploadStorage//" + dirName; */
		/* MacOS */
		String imgPath = "/Library/uploadStorage/" + dirName;
		
		File fileAdd = new File(imgPath, fileName);
		log.info("원본 이미지 파일(fileAdd):" + fileAdd);
		
		BufferedImage sourceImg = ImageIO.read(fileAdd); //fileAdd에 해당하는 이미지 파일을 읽어와서 데이터로 저장
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 133); //크기를 조정하여 이미지 데이터 저장
									//resize(BufferedImage 타입 원본 이미지, 원본 가로세로 비율, 높이 또는 너비, 크기)
		
		String thumbnailName = "thumbnail_" + fileName;
		String docRoot = imgPath + "/thumbnail";
		makeDir(docRoot);
		
		File newFile = new File(docRoot, thumbnailName);
		log.info("업로드할 파일: " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); //마지막 .의 위치 다음부터 끝까지 자름
		log.info("확장자: " + formatName);
		
		ImageIO.write(destImg, formatName, newFile); //썸네일용으로 조정한 이미지 데이터를 생성한 파일에 저장
		return thumbnailName; //서버에 저장된 파일명 반환
	}
}
