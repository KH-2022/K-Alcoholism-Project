package com.kap.client.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kap.client.brewery.service.BreweryService;
import com.kap.client.brewery.vo.BreweryVO;
import com.kap.client.product.service.ProductService;
import com.kap.client.product.vo.ProductVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/tab")
@AllArgsConstructor
public class TabController {
	
	private ProductService productService;
	private BreweryService breweryService;

	/* 상품 정보 include */
	@GetMapping("/pdInfo")
	public String tabPdInfo(@RequestParam("pd_id") int pd_id, Model model) {
		ProductVO pvo = new ProductVO();
		pvo.setPd_id(pd_id);
		ProductVO detail = productService.productDetail(pvo);
		model.addAttribute("detail", detail);
		return "tab/pdInfo";
	}
	
	/* 상품 배송안내 include */
	@GetMapping("/pdNotice")
	public String tabPdNotice() {
		return "tab/pdNotice";
	}
	
	/* 상품 후기 include */
	@GetMapping("/pdReview")
	public String tabPdReview(@RequestParam("pd_id") int pd_id, Model model) {
		model.addAttribute("pd_id", pd_id);
		return "tab/pdReview";
	}
	
	/* 상품 정보 include */
	@GetMapping("/brInfo")
	public String tabBrInfo(@RequestParam("br_id") int br_id, Model model) {
		BreweryVO bvo = new BreweryVO();
		bvo.setBr_id(br_id);
		BreweryVO detail = breweryService.breweryDetail(bvo);
		model.addAttribute("detail", detail);
		return "tab/brInfo";
	}
	
	/* 상품 배송안내 include */
	@GetMapping("/brNotice")
	public String tabBrNotice() {
		return "tab/brNotice";
	}
	
	/* 상품 후기 include */
	@GetMapping("/brReview")
	public String tabBrReview(@RequestParam("br_id") int br_id, Model model) {
		model.addAttribute("br_id", br_id);
		return "tab/brReview";
	}
}