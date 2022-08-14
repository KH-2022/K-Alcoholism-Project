package com.kap.admin.order.service;

import java.util.List;

import com.kap.client.order.vo.OrderDetailVO;
import com.kap.client.order.vo.OrderVO;

public interface AdminOrderService {

	public List<OrderVO> orderList(OrderVO order);

	public List<OrderDetailVO> orderDetail(OrderDetailVO dvo);

}
