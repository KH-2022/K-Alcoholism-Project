package com.kap.client.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kap.client.product.service.ProductService;
import com.kap.client.product.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
@AllArgsConstructor
public class ProductController {
	private ProductService productService;
	
	/*******************************************************
	 * 상품 리스트 구현하기
	 *******************************************************/
	@GetMapping("/productList")
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		log.info("productList 호출 성공");
		
		//전체 레코드 조회
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList",productList);
		
		return "product/productList";
	}
	
	/*******************************************************
	 * 상품 상세보기
	 *******************************************************/
	@GetMapping("/productDetail")
	public String productDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productDetail 호출 성공");
		
		ProductVO detail = productService.productDetail(pvo);
		model.addAttribute("detail",detail);
		
		return "product/productDetail";
	}
	
}
