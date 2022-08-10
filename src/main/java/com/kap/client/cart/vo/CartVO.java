package com.kap.client.cart.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cart_no;        //��ٱ��Ϲ�ȣ
	private int user_no;        //ȸ����ȣ
	private String user_name;   //ȸ���̸�
	private int pd_id;          //��ǰID
	private String pd_name;     //��ǰ��
	private int pd_price;       //��ǰ ����
	private int cart_count;     //��ǰ ����
	private int cart_amount;    //��ǰ �ݾ�(pd_price*cart_count)
	private String cart_date;   //��������
	
	public void setUser(int user_no, String user_name) {
		this.user_no = user_no;
		this.user_name = user_name;
	}
}