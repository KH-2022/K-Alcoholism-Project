package com.kap.client.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import com.kap.client.cart.vo.CartVO;

import com.kap.client.order.service.OrderService;
import com.kap.client.order.vo.OrderDetailVO;
import com.kap.client.order.vo.OrderVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {
	
	private OrderService orderService;
	
	@ResponseBody
	@RequestMapping(value="/order", method=RequestMethod.POST)
	public String orderList(HttpServletRequest request, @RequestBody List<CartVO> cvoList, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("cvoList", cvoList);
		
		return "SUCCESS";
	}
	
	@RequestMapping(value="/orderList", method=RequestMethod.GET)
	public String orderList(HttpServletRequest request, OrderVO order, Model model) {
		HttpSession session = request.getSession();
		model.addAttribute("orderList", session.getAttribute("cvoList"));
		
		return "cart/orderList";
	}
	
	@ResponseBody
	@RequestMapping(value="/save", method=RequestMethod.POST)
	public String orderSave(HttpServletRequest request, @RequestBody List<OrderDetailVO> orderDetailList, Model model) {
		return orderService.save(request, orderDetailList);
	}
	
	@RequestMapping(value="/complete", method=RequestMethod.GET)
	public String orderComplete() {	
		return "cart/orderComplete";
	}

}
