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
	 * ��ǰ��� �����ϱ� (����¡ ó��)
	 ****************************************************/
	@RequestMapping(value="product/productList", method = RequestMethod.GET)
	public String productList(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("productList ȣ�� ����");
		
		// ��ü ���ڵ� ��ȸ
		List<ProductVO> productList = adminProductService.productList(pvo);
		model.addAttribute("productList", productList);
		
		// ��ü ���ڵ� �� ����
		int total = adminProductService.productListCnt(pvo);
		
		// ����¡ ó��
		model.addAttribute("pageMaker", new PageDTO(total, pvo));
		
		return "admin/product/productList"; 
	} 
	
	/******************************************************
	 * ��ǰ ��� �� ����ϱ�
	 ******************************************************/
	@RequestMapping(value="/product/writeForm")
	public String writeForm(@ModelAttribute("data") ProductVO pvo) {
		log.info("admin writeForm ȣ�� ����");
		
		return "admin/product/writeForm";
	}
	
	/******************************************************
	 * ��ǰ ��� �����ϱ�
	 ******************************************************/
	@RequestMapping(value="/product/productInsert", method=RequestMethod.POST)
	public String productInsert(ProductVO pvo, Model model) throws Exception {
		log.info("admin productInsert ȣ�� ����");
		
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
	 * ��ǰ �� ����
	 ******************************************************/
	@RequestMapping(value="/product/productDetail", method=RequestMethod.GET)
	public String productDetail(@ModelAttribute ProductVO pvo, Model model) {
		log.info("admin productDetail ȣ�� ����");
		
		ProductVO detail = adminProductService.productDetail(pvo);
		model.addAttribute("detail",detail);
		
		return "admin/product/productDetail";
	}
	
	
	/****************************************************
	 * ��ǰ ���� �� ����ϱ�
	 ****************************************************/
	@RequestMapping(value="/product/updateForm")
	public String updateForm(@ModelAttribute("data") ProductVO pvo, Model model) {
		log.info("admin writeForm ȣ�� ����");
		log.info("pd_id = " + pvo.getPd_id());
		
		ProductVO updateData = adminProductService.updateForm(pvo);
		
		model.addAttribute("updateData", updateData);
		
		return "admin/product/updateForm";
	}
	
	/****************************************************
	 * ��ǰ ���� �����ϱ�
	 ****************************************************/
	@RequestMapping(value="/product/productUpdate", method=RequestMethod.POST)
	public String productUpdate(@ModelAttribute ProductVO pvo, RedirectAttributes ras) throws Exception {
		log.info("admin productUpdate ȣ�� ����");
		
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
	 * ��ǰ ���� �����ϱ�
	 ****************************************************/
	@RequestMapping(value="/product/productDelete")
	public String productDelete(@ModelAttribute ProductVO pvo, RedirectAttributes ras) throws Exception {
		log.info("admin productDelete ȣ�� ����");
		
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