package com.kap.client.myPage.vo;

import com.kap.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MyPageOrderVO extends CommonVO{
	private int order_no;
	private int user_no;
	private int order_amount;
	private String order_date;
	private String order_state;
	private int orderdetail_no;
	private int pd_id;
	private int cart_count;
	private int pd_price;
	
	private int order_count;
	private String pd_name;
	private String pd_thumb;
	private String user_name;
	private String user_tel;
	private String user_postcode;
	private String user_add;
	private String user_detailadd;
}
