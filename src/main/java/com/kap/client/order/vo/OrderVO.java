package com.kap.client.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private String order_no;
	private int user_no;
	private int order_amount;
	private String order_date;
	
	private String user_id; 
	private String order_state;
}
