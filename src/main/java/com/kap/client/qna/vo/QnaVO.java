package com.kap.client.qna.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class QnaVO extends CommonVO {
	private int qna_no;
	private int user_no;
	private String qna_title;
	private String qna_content;
	private int qna_readcnt;
	private String qna_date;
	
	private String user_id; 		// 회원번호로 받아온 회원 아이디
	private int qna_replycnt;		// 댓글 수
	
	private MultipartFile file;		// 파일 업로드를 위한 필드
	private String qna_thumb = "";	// 실제 서버에 저장할 썸네일 이미지 파일명
	private String qna_file = "";	// 실제 서버에 저장할 이미지 파일명
}