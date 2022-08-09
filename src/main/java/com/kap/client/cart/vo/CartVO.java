package com.kap.client.cart.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_no;        //장바구니번호
	private int user_no;        //회원번호
	private String user_name;   //회원이름
	private int pd_id;          //상품ID
	private String pd_name;     //상품명
	private int pd_price;       //상품 가격
	private int cart_count;     //상품 수량
	private int cart_amount;    //상품 금액(pd_price*cart_count)
	private String cart_date;   //생성일자
	
	public void setUser(int user_no, String user_name) {
		this.user_no = user_no;
		this.user_name = user_name;
	}
}
