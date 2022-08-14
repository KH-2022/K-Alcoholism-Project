package com.kap.client.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kap.client.cart.service.CartService;
import com.kap.client.cart.vo.CartVO;
import com.kap.client.login.vo.LoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cart")
@Log4j
@AllArgsConstructor
public class CartController {

	private CartService cartService;

	@ResponseBody
	@RequestMapping(value="/insert", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String insertCart(@RequestBody CartVO cvo, HttpServletRequest request, Model model) {
		log.info("insertCart 성공");
		log.info("cvo" +cvo);
		
		HttpSession session = request.getSession();
		LoginVO clientLogin = (LoginVO) session.getAttribute("login");
		
		if (clientLogin == null) { //로그인체크
			return "5";
		}

		int result = 0;
		cvo.setUser_no(clientLogin.getUser_no()); 
	
		result = cartService.insertCart(cvo);
	
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	

	@GetMapping(value="/cartList")
	public String cartList(CartVO cvo, HttpServletRequest request, Model model) {
		log.info("cartList 성공");
		
		HttpSession session = request.getSession();
		LoginVO clientLogin = (LoginVO) session.getAttribute("login");
		 
		if (clientLogin == null) { //로그인체크
				return "5";
		}
		 
		cvo.setUser_no(clientLogin.getUser_no()); 
		 
		List<CartVO> cartList = cartService.cartList(cvo);
		model.addAttribute("cartList",cartList);
		
		log.info("cartList" +cartList.size());
		
		return "cart/cartList";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/update", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String updateCart(@RequestBody CartVO cvo, HttpServletRequest request, Model model) {
		log.info("updateCart 성공");
		
		HttpSession session = request.getSession();
		LoginVO clientLogin = (LoginVO) session.getAttribute("login");
		
		cvo.setUser_no(clientLogin.getUser_no()); 
		
		int result = 0;
		
		result = cartService.updateCart(cvo);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	

	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String deleteCart(@RequestBody CartVO cvo, HttpServletRequest request, Model model) {
		log.info("deleteCart 성공");
		
		log.info("cvo" +cvo);
		
		HttpSession session = request.getSession();
		LoginVO clientLogin = (LoginVO) session.getAttribute("login");
		
		cvo.setUser_no(clientLogin.getUser_no()); 
		 
		int result = 0;
		
		result = cartService.deleteCart(cvo);
		log.info("result" +result);
		return (result==1) ? "SUCCESS" : "FAILURE";
	}
	
}
