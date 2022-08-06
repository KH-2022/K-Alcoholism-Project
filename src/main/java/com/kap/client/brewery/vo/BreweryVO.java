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
	
	private MultipartFile file; //���� ���ε带 ���� �ʵ�
	private String br_thumb = ""; //���� ������ ������ ����� �̹��� ���ϸ�
	private String br_image = ""; //���� ������ ������ ���ϸ�
}