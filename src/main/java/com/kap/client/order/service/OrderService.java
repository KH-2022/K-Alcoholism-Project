package com.kap.client.order.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.kap.client.order.vo.OrderDetailVO;
import com.kap.client.order.vo.OrderVO;

public interface OrderService {

	public List<OrderVO> orderList(OrderVO order);

	public String save(HttpServletRequest request, List<OrderDetailVO> orderDetailList);

}
