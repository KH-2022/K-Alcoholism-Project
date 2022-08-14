package com.kap.admin.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kap.client.order.dao.OrderDao;
import com.kap.client.order.vo.OrderDetailVO;
import com.kap.client.order.vo.OrderVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminOrderServiceImpl implements AdminOrderService {

	private OrderDao orderDao;
	
	@Override
	public List<OrderVO> orderList(OrderVO order) {
		List<OrderVO> aList = null;
		aList = orderDao.orderList(order);
		return aList;
	}

	@Override
	public List<OrderDetailVO> orderDetail(OrderDetailVO dvo) {
		List<OrderDetailVO> detail = null;
		detail = orderDao.orderDetail(dvo);
		return detail;
	}

}
