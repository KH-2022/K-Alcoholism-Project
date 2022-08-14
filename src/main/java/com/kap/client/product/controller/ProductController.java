package com.kap.client.product.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kap.client.product.service.ProductService;
import com.kap.client.product.vo.ProductVO;
import com.kap.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
	private ProductService productService;
	
	/***************************************************
	 * 상품 목록 구현하기(페이징 처리 목록 조회)
	 * 요청 URL : http://localhost:8080/product/productList
	 ***************************************************/
	@RequestMapping(value="/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productList 호출 성공");
		pvo.setAmount(9);
		
		// 전체 레코드 조회
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		// 전체 레코드 수 구현
		int total = productService.productListCnt(pvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(total, pvo));
		
		return "product/productList";
	}
	
	/*******************************************************
	 * 상품 상세 보기
	 *******************************************************/
	@GetMapping("/productDetail")
	public String productDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productDetail 호출 성공");
		
		ProductVO detail = productService.productDetail(pvo);
		model.addAttribute("detail",detail);
		
		return "product/productDetail";
	}
	
	/*******************************************************
	 * 메인페이지 상품 목록 구현
	 *******************************************************/
	@ResponseBody
	@GetMapping(value = "/all", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<ProductVO> mainProduct() {
		log.info("mainProduct 호출 성공");
		ProductVO pvo = new ProductVO();
		pvo.setAmount(9);
		List<ProductVO> entity = productService.productList(pvo);
		return entity;
	}
}