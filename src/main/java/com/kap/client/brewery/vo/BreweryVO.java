package com.kap.client.brewery.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BreweryVO extends CommonVO {
	private int br_id;
	private String br_name;
	private String br_region;
	private String br_addr;
	private String br_tel;
	private String br_site;
	private String br_info;
	private String br_type;
	private String br_program;
	private int br_time;
	private int br_price;
	private String br_date;
	
	private MultipartFile file; //파일 업로드를 위한 필드
	private String br_thumb = ""; //실제 서버에 저장할 썸네일 이미지 파일명
	private String br_image = ""; //실제 서버에 저장할 파일명
}
