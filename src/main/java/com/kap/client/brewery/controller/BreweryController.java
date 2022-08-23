package com.kap.client.brewery.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
	 * ������ ����Ʈ ����
	 *******************************************************/
	@GetMapping("/breweryList")
	public String breweryList(@ModelAttribute("data") BreweryVO bvo, Model model) {
		log.info("breweryList ȣ�� ����");
		bvo.setAmount(9); //������ �� ����
		
		// ��ü ���ڵ� ��ȸ
		List<BreweryVO> breweryList = breweryService.breweryList(bvo);
		model.addAttribute("breweryList", breweryList);
		
		// ��ü ���ڵ� �� ���ϱ�
		int total = breweryService.breweryListCnt(bvo);
		model.addAttribute("pageMaker", new PageDTO(total, bvo));
		
		return "brewery/breweryList";
	}
	
	/*******************************************************
	 * ������ ������ ����
	 *******************************************************/
	@GetMapping("/breweryDetail")
	public String breweryDetail(@ModelAttribute("data") BreweryVO bvo, Model model) {
		log.info("breweryDetail ȣ�� ����");
		
		BreweryVO detail = breweryService.breweryDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "brewery/breweryDetail";
	}
	
	/*******************************************************
	 * ü�� ���� �� ȣ��
	 *******************************************************/
	@PostMapping(value = "/reserveForm")
	public String reserveForm(@ModelAttribute("data") BreweryVO bvo, @SessionAttribute("login") MemberVO loginMember, Model model, RedirectAttributes reAttr) {
		log.info("reserveForm ȣ�� ����");
		
		if (loginMember == null) {
			reAttr.addFlashAttribute("errorMsg", "�α����� �ʿ��մϴ�.");
			return "redirect:/login/login";
		}
		model.addAttribute("loginMember", loginMember);
		
		BreweryVO breweryData = breweryService.reserveForm(bvo);
		model.addAttribute("breweryData", breweryData);
		
		return "brewery/reserveForm";
	}
	
}