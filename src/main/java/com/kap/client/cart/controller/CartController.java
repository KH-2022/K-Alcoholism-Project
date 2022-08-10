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
		log.info("insertCart 호출성공");
		log.info("cvo" +cvo);
		
		int result = 0;
		cvo.setUser_no(1); //나중에 세션값으로 대체
		
		result = cartService.findCartGoods(cvo);
		
		return (result==1) ? "already_existed" :"add_success";
		
	}*/
	
	//장바구니추가
	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String insertCart(@RequestBody CartVO cvo, Model model) {
		log.info("insertCart 호출성공");
		log.info("cvo" +cvo);
		
		int result = 0;
		cvo.setUser_no(1); //나중에 세션값으로 대체
	
		result = cartService.insertCart(cvo);
	
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
	//장바구니조회
	@GetMapping(value="/cartList")
	public String cartList(CartVO cvo, Model model) {
		log.info("cartList 호출성공");
		
		cvo.setUser_no(1); //나중에 세션값으로 대체
		List<CartVO> cartList = cartService.cartList(cvo);
		model.addAttribute("cartList",cartList);
		
		log.info("cartList" +cartList.size());
		
		return "cart/cartList";
	}
	
	
	//수량변경
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String updateCart(@RequestBody CartVO cvo, Model model) {
		log.info("updateCart 호출성공");
		
		log.info("cvo" +cvo);
		
		int result = 0;
		
		result = cartService.updateCart(cvo);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
	//상품삭제
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String deleteCart(@RequestBody CartVO cvo, Model model) {
		log.info("deleteCart 호출성공");
		
		log.info("cvo" +cvo);
		
		int result = 0;
		
		result = cartService.deleteCart(cvo);
		log.info("result" +result);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
}