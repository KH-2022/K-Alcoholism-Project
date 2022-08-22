package com.kap.client.reply.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReplyVO extends CommonVO {
	private int		pd_review_no		=0;
	private int		user_no				=0;
	private int		pd_id				=0;
	private String	user_id				="";
	private String	pd_review_content 	="";
	private String	pd_review_date;
	private String 	pd_name 			="";
	private String 	pd_thumb 			="";
	
	private MultipartFile file;		
	private String pd_review_thumb		="";	
	private String pd_review_file 		="";	
}
