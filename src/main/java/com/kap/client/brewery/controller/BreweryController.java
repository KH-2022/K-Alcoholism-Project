package com.kap.client.brewery.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kap.client.brewery.service.BreweryService;
import com.kap.client.brewery.vo.BreweryVO;
import com.kap.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brewery")
@AllArgsConstructor
public class BreweryController {
	
	private BreweryService breweryService;
	
	/*******************************************************
	 * 양조장 리스트 구현
	 *******************************************************/
	@GetMapping("/breweryList")
	public String breweryList(@ModelAttribute("data") BreweryVO bvo, Model model) {
		log.info("breweryList 호출 성공");
		
		bvo.setAmount(9);
		List<BreweryVO> breweryList = breweryService.breweryList(bvo);
		model.addAttribute("breweryList", breweryList);
		
		// 전체 레코드 수 구하기
		int total = breweryService.breweryListCnt(bvo);
		model.addAttribute("pageMaker", new PageDTO(total, bvo));
		
		return "brewery/breweryList";
	}
	
	/*******************************************************
	 * 양조장 상세정보 구현
	 *******************************************************/
	@GetMapping("/breweryDetail")
	public String breweryDetail(@ModelAttribute("data") BreweryVO bvo, Model model) {
		log.info("breweryDetail 호출 성공");
		
		BreweryVO detail = breweryService.breweryDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "brewery/breweryDetail";
	}
	
	/*******************************************************
	 * 체험 예약 폼 호출
	 *******************************************************/
	@RequestMapping(value = "/reserveForm")
	public String reserveForm(@ModelAttribute BreweryVO bvo, Model model) {
		log.info("reserveForm 호출 성공");
		
		BreweryVO breweryData = breweryService.reserveForm(bvo);
		model.addAttribute("breweryData", breweryData);
		
		return "brewery/reserveForm";
	}
	
}
