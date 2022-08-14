package com.kap.admin.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.product.service.AdminProductService;
import com.kap.client.product.vo.ProductVO;
import com.kap.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminProductController {

	@Setter(onMethod_ = @Autowired)
	private AdminProductService adminProductService;
	
	/****************************************************
	 * 상품목록 구현하기 (페이징 처리)
	 ****************************************************/
	@RequestMapping(value="product/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productList 호출 성공");
		
		// 전체 레코드 조회
		List<ProductVO> productList = adminProductService.productList(pvo);
		model.addAttribute("productList", productList);
		
		// 전체 레코드 수 구현
		int total = adminProductService.productListCnt(pvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(total, pvo));
		
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
	public String productInsert(ProductVO pvo, Model model) throws Exception {
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
		log.info("admin productDetail 호출 성공");
		
		ProductVO detail = adminProductService.productDetail(pvo);
		model.addAttribute("detail",detail);
		
		return "admin/product/productDetail";
	}
	
	
	/****************************************************
	 * 글수정 폼 출력하기
	 ****************************************************/
	@RequestMapping(value="/product/updateForm")
	public String updateForm(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("admin writeForm 호출 성공");
		log.info("pd_id = " + pvo.getPd_id());
		
		ProductVO updateData = adminProductService.updateForm(pvo);
		
		model.addAttribute("updateData", updateData);
		
		return "admin/product/updateForm";
	}
	
	/****************************************************
	 * 글수정 구현하기
	 ****************************************************/
	@RequestMapping(value="/product/productUpdate", method=RequestMethod.POST)
	public String productUpdate(@ModelAttribute ProductVO pvo, RedirectAttributes ras) throws Exception {
		log.info("admin productUpdate 호출 성공");
		
		int result = 0;
		String url="";
		
		result = adminProductService.productUpdate(pvo);
		ras.addFlashAttribute("data", pvo);
		
		if(result == 1) {
			url = "/admin/product/productDetail?pd_id=" + pvo.getPd_id();
		}else {
			url = "/admin/product/updateForm";
		}
		
		return "redirect:" + url;
	}
	
	/****************************************************
	 * 글삭제 구현하기
	 ****************************************************/
	@RequestMapping(value="/product/productDelete")
	public String productDelete(@ModelAttribute ProductVO pvo, RedirectAttributes ras) throws Exception {
		log.info("admin productDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = adminProductService.productDelete(pvo);
		ras.addFlashAttribute("productVO", pvo);
		
		if(result == 1) {
			url = "/admin/product/productList";
		} else {
			url = "/admin/product/productDetail";
		}
		return "redirect:" + url;
	}
}
