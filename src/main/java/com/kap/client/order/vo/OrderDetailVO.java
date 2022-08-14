package com.kap.client.order.vo;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int orderDetail_no;
	private String order_no;
	private int pd_id;
	private int pd_price;
	private int cart_count;
	
	private String pd_name;
}
