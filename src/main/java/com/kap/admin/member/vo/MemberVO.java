package com.kap.admin.member.vo;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberVO extends CommonVO{
	private int user_no;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_email;
	private String user_tel;
	private String user_add;
	private String user_birth;
	private String user_postcode;
	private String user_detailAdd;
	private String user_extraAdd;
	private String user_date;
	private String delete_YN;
}
