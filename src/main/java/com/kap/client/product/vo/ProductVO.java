package com.kap.client.product.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProductVO extends CommonVO {
	private int pd_id;
	private int br_id;
	private String pd_name;
	private int pd_price;
	private String pd_sort;
	private int pd_degree;
	private int pd_volume;
	private String pd_info;
	private String pd_date;
	private String pd_update;
	
	private MultipartFile file; //파일 업로드를 위한 필드
	private String pd_thumb = ""; //실제 서버에 저장할 썸네일 이미지 파일명
	private String pd_image = ""; //실제 서버에 저장할 파일명
}