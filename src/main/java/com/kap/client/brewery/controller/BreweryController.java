package com.kap.client.brewery.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.member.vo.MemberVO;
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
		bvo.setAmount(9); //페이지 수 설정
		
		// 전체 레코드 조회
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
	public String reserveForm(@ModelAttribute("data") BreweryVO bvo, @SessionAttribute("login") MemberVO loginMember, Model model, RedirectAttributes reAttr) {
		log.info("reserveForm 호출 성공");
		
		if (loginMember == null) {
			reAttr.addFlashAttribute("errorMsg", "로그인이 필요합니다.");
			return "redirect:/login/login";
		}
		model.addAttribute("loginMember", loginMember);
		
		BreweryVO breweryData = breweryService.reserveForm(bvo);
		model.addAttribute("breweryData", breweryData);
		
		return "brewery/reserveForm";
	}
	
}
