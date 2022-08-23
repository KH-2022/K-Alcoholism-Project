package com.kap.admin.order.controller;

import java.util.List;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.kap.admin.order.service.AdminOrderService;

import com.kap.client.order.vo.OrderDetailVO;
import com.kap.client.order.vo.OrderVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/admin/*")
@Log4j
@AllArgsConstructor
public class AdminOrderController {
	
	private AdminOrderService adminOrderService;
	
	//주문목록
	@RequestMapping(value="/order/orderList", method = RequestMethod.GET)
	public String orderList(@ModelAttribute("data") OrderVO order, Model model) {
		log.info("admin orderList 호출 성공");
		
		List<OrderVO> orderList = adminOrderService.orderList(order);
		model.addAttribute("orderList",orderList);
		
		return "admin/order/orderList";
	}
	
	//주문상세목록
	@RequestMapping(value="/order/orderDetail", method = RequestMethod.GET)
	public String orderDetail(@ModelAttribute("data") OrderDetailVO dvo, Model model) {
		log.info("admin orderDetail 호출 성공");
		
		List<OrderDetailVO> orderDetail = adminOrderService.orderDetail(dvo);
		model.addAttribute("orderDetail",orderDetail);
		
		return "admin/order/orderDetail";
	
	}
	
}
