package com.kap.client.order.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.order.dao.OrderDao;
import com.kap.client.order.vo.OrderDetailVO;
import com.kap.client.order.vo.OrderVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao;

	@Override
	public List<OrderVO> orderList(OrderVO order) {
		List<OrderVO> list= null;
		list = orderDao.orderList(order);
		return list;
	}

	@Override
	public String save(HttpServletRequest request, List<OrderDetailVO> orderDetailList) {
		String result = "";
		
		int totalAmount = 0;
		for (int i=0; i<orderDetailList.size(); i++) {
			OrderDetailVO tempOrderDetailVO = orderDetailList.get(i);
			totalAmount += tempOrderDetailVO.getPd_price() * tempOrderDetailVO.getCart_count();
		}
		
		OrderVO orderVO = new OrderVO();
		orderVO.setUser_no(((MemberVO)request.getSession().getAttribute("login")).getUser_no());
		orderVO.setOrder_amount(totalAmount);
		orderDao.insertOrder(orderVO);
		
		String order_no = orderVO.getOrder_no();
		
		int resultCnt = 0;
		
		for (int i=0; i<orderDetailList.size(); i++) {
			OrderDetailVO tempOrderDetailVO = orderDetailList.get(i);
			tempOrderDetailVO.setOrder_no(order_no);
			resultCnt += orderDao.insertOrderDetail(tempOrderDetailVO);
		}
		
		if (resultCnt > 0) {
			result = "SUCCESS";
		}
		
		return result;
	}

}
