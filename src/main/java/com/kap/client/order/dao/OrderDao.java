package com.kap.client.order.dao;

import java.util.List;

import com.kap.client.order.vo.OrderDetailVO;
import com.kap.client.order.vo.OrderVO;

public interface OrderDao {

	public List<OrderVO> orderList(OrderVO order);
	
	public int insertOrder(OrderVO order);
	
	public int insertOrderDetail(OrderDetailVO order);

	public List<OrderDetailVO> orderDetail(OrderDetailVO dvo);

	public int deleteOrder(OrderDetailVO dvo);

}
