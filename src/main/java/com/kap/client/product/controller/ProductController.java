package com.kap.client.product.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	 * ��ǰ ��� �����ϱ�(����¡ ó�� ��� ��ȸ)
	 * ��û URL : http://localhost:8080/product/productList
	 ***************************************************/
	@RequestMapping(value="/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute ProductVO pvo, Model model) {
		log.info("productList ȣ�� ����");
		pvo.setAmount(16);
		
		// ��ü ���ڵ� ��ȸ
		List<ProductVO> productList = productService.productList(pvo);
		model.addAttribute("productList", productList);
		
		// ��ü ���ڵ� �� ����
		int total = productService.productListCnt(pvo);
		
		// ����¡ ó��
		model.addAttribute("pageMaker", new PageDTO(total, pvo));
		
		return "product/productList";
	}
	
	/*******************************************************
	 * ��ǰ �� ����
	 *******************************************************/
	@GetMapping("/productDetail")
	public String productDetail(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productDetail ȣ�� ����");
		
		ProductVO detail = productService.productDetail(pvo);
		model.addAttribute("detail",detail);
		
		return "product/productDetail";
	}
	
}