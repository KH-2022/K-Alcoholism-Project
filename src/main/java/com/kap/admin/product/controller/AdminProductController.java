package com.kap.admin.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.kap.admin.product.service.AdminProductService;
import com.kap.client.product.vo.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping(value="/admin")
@Log4j
public class AdminProductController {

	@Setter(onMethod_ = @Autowired)
	private AdminProductService adminProductService;
	
	
	/****************************************************
	 * 상품목록 구현하기
	 ****************************************************/
	
	@RequestMapping(value="/product/productList", method=RequestMethod.GET)
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		log.info("admin proudctList 호출 성공");
		List<ProductVO> productList = adminProductService.productList(pvo);
		model.addAttribute("productList",productList);
		
		return "admin/product/productList";
	}
	
	/******************************************************
	 * 상품등록 폼 출력하기
	 ******************************************************/
	@RequestMapping(value="/product/writeForm")
	public String writeForm(@ModelAttribute("data") ProductVO pvo) {
		log.info("admin writeForm 호출 성공");
		
		return "admin/product/writeForm";
	}
	
	/******************************************************
	 * 글쓰기 구현하기
	 ******************************************************/
	@RequestMapping(value="/product/productInsert", method=RequestMethod.POST)
	public String productInsert(ProductVO pvo, Model model) {
		log.info("admin productInsert 호출 성공");
		
		int result=0;
		String url="";
		
		result = adminProductService.productInsert(pvo);
		if(result == 1) {
			url = "/admin/product/productList";
		}else {
			url = "/admin/product/writeForm";
		}
		
		return "redirect:"+url;
	}
	
	/******************************************************
	 * 글상세보기 구현
	 ******************************************************/
	@RequestMapping(value="/product/productDetail", method=RequestMethod.GET)
	public String productDetail(@ModelAttribute ProductVO pvo, Model model) {
		log.info("admin productDetail 호출성공");
		
		ProductVO detail = adminProductService.productDetail(pvo);
		model.addAttribute("detail",detail);
		
		return "admin/product/productDetail";
	}
}
