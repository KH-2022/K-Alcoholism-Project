package com.kap.admin.brewery.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.brewery.service.AdminBreweryService;
import com.kap.client.brewery.vo.BreweryVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
public class AdminBreweryController {

	private AdminBreweryService adminBreweryService;
	
	/****************************************************
	 * 양조장 목록 구현하기
	 ****************************************************/
	@RequestMapping(value="/brewery/breweryList",method=RequestMethod.GET)
	public String breweryList(@ModelAttribute("data") BreweryVO bvo, Model model) {
		log.info("admin breweryList 호출 성공");
		List<BreweryVO> breweryList = adminBreweryService.breweryList(bvo);
		model.addAttribute("breweryList",breweryList);
		
		return "admin/brewery/breweryList";
	}
	
	/******************************************************
	 * 글쓰기 폼 출력하기
	 ******************************************************/
	@RequestMapping(value="/brewery/writeForm")
	public String writeForm(@ModelAttribute("data") BreweryVO bvo) {
		log.info("admin writeForm 호출성공");
		
		return "admin/brewery/writeForm";
	}
	
	/******************************************************
	 * 글쓰기 구현하기
	 ******************************************************/	
	@RequestMapping(value="/brewery/breweryInsert", method=RequestMethod.POST)
	public String breweryInsert(BreweryVO bvo, Model model) throws Exception{
		log.info("admin breweryInsert 호출성공");
		
		int result = 0;
		String url = "";
		
		result = adminBreweryService.breweryInsert(bvo);
		if(result == 1) {
			url = "/admin/brewery/breweryList";
		}else {
			url = "/admin/brewery/writeForm";
		}
		return "redirect:"+url;
	}
	
	/****************************************************
	 * 양조장 상세보기 구현
	 ****************************************************/
	@RequestMapping(value="/brewery/breweryDetail",method=RequestMethod.GET)
	public String breweryDetail(@ModelAttribute BreweryVO bvo, Model model) {
		log.info("admin breweryDetail호출성공");
		
		BreweryVO detail = adminBreweryService.breweryDetail(bvo);
		model.addAttribute("detail",detail);
		
		return "admin/brewery/breweryDetail";
	}
	
	/****************************************************
	 * 글수정 폼 출력하기
	 ****************************************************/
	@RequestMapping(value="/brewery/updateForm")
	public String updateForm(@ModelAttribute("data") BreweryVO bvo, Model model) {
		log.info("admin writeForm 호출성공");
		log.info("br_id = " + bvo.getBr_id());
		
		BreweryVO updateData = adminBreweryService.updateForm(bvo);
		
		model.addAttribute("updateData",updateData);
		
		return "admin/brewery/updateForm";
	}
	
	/****************************************************
	 * 글수정 구현하기
	 ****************************************************/
	@RequestMapping(value="/brewery/breweryUpdate", method=RequestMethod.POST)
	public String breweryUpdate(@ModelAttribute BreweryVO bvo, RedirectAttributes ras) throws Exception{
		log.info("admin breweryUpdate 호출 성공");
		
		int result = 0;
		String url="";
		
		result = adminBreweryService.breweryUpdate(bvo);
		ras.addFlashAttribute("data",bvo);
		
		if(result == 1) {
			url="/admin/brewery/breweryDetail?br_id="+bvo.getBr_id();
		}else {
			url="/admin/brewery/updateForm";
		}
		
		return "redirect:"+url;
	}
	
	/****************************************************
	 * 글삭제 구현하기
	 ****************************************************/
	@RequestMapping(value="/brewery/breweryDelete")
	public String boardDelete(@ModelAttribute BreweryVO bvo, RedirectAttributes ras)throws Exception{
		log.info("admin boardDelete 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = adminBreweryService.breweryDelete(bvo);
		ras.addFlashAttribute("breweryVO",bvo);
		
		if(result == 1) {
			url ="/admin/brewery/breweryList";
		}else {
			url = "/admin/brewery/breweryDetail";
		}
		return "redirect:"+url;
	}
	
}
