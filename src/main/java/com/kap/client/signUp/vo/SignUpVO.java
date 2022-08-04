package com.kap.client.signUp.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SignUpVO {
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
}
