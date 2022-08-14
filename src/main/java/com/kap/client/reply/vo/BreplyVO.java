package com.kap.client.reply.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BreplyVO extends CommonVO {
	private int 	br_review_no 		=0;
	private int 	user_no 			=0;
	private int 	br_id 				=0;
	private String	user_id				="";
	private String 	br_review_content 	="";
	private String 	br_review_date;
	private String 	br_name 			="";
	
	private MultipartFile file;
	private String br_review_file 		="";
	private String br_review_thumb 		="";
}
