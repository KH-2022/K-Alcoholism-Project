package com.kap.client.cart.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kap.client.cart.service.CartService;
import com.kap.client.cart.vo.CartVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j
@AllArgsConstructor
public class CartController {

	private CartService cartService;
	/*
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String findCartGoods(@RequestBody CartVO cvo, Model model) {
		log.info("insertCart ȣ�⼺��");
		log.info("cvo" +cvo);
		
		int result = 0;
		cvo.setUser_no(1); //���߿� ���ǰ����� ��ü
		
		result = cartService.findCartGoods(cvo);
		
		return (result==1) ? "already_existed" :"add_success";
		
	}*/
	
	//��ٱ����߰�
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String insertCart(@RequestBody CartVO cvo, Model model) {
		log.info("insertCart ȣ�⼺��");
		log.info("cvo" +cvo);
		
		int result = 0;
		cvo.setUser_no(1); //���߿� ���ǰ����� ��ü
	
		result = cartService.insertCart(cvo);
	
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
	//��ٱ�����ȸ
	@GetMapping(value="/cartList")
	public String cartList(CartVO cvo, Model model) {
		log.info("cartList ȣ�⼺��");
		
		cvo.setUser_no(1); //���߿� ���ǰ����� ��ü
		List<CartVO> cartList = cartService.cartList(cvo);
		model.addAttribute("cartList",cartList);
		
		log.info("cartList" +cartList.size());
		
		return "cart/cartList";
	}
	
	
	//��������
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String updateCart(@RequestBody CartVO cvo, Model model) {
		log.info("updateCart ȣ�⼺��");
		
		log.info("cvo" +cvo);
		
		int result = 0;
		
		result = cartService.updateCart(cvo);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
	//��ǰ����
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String deleteCart(@RequestBody CartVO cvo, Model model) {
		log.info("deleteCart ȣ�⼺��");
		
		log.info("cvo" +cvo);
		
		int result = 0;
		
		result = cartService.deleteCart(cvo);
		log.info("result" +result);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
}