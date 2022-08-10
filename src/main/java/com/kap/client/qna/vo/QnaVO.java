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
	
	private MultipartFile file;		// ���� ���ε带 ���� �ʵ�
	private String qna_thumb = "";	// ���� ������ ������ ����� �̹��� ���ϸ�
	private String qna_file = "";	// ���� ������ ������ �̹��� ���ϸ�
}