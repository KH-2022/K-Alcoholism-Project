package com.kap.client.reserve.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.reserve.service.ReserveService;
import com.kap.client.reserve.vo.ReserveVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/reserve")
@AllArgsConstructor
public class ReserveController {
	
	private ReserveService reserveService;
	
	/*******************************************************
	 * ���� ó�� ����
	 *******************************************************/
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String reserveInsert(@ModelAttribute ReserveVO rvo, @SessionAttribute("login") MemberVO loginMember, Model model, RedirectAttributes reAttr) throws Exception {
		log.info("reserveInsert ȣ�� ����");
		
		if (loginMember == null) {
			reAttr.addFlashAttribute("errorMsg", "�α����� �ʿ��մϴ�.");
			return "redirect:/login/login";
		}
		model.addAttribute("loginMember", loginMember);
		rvo.setUser_no(loginMember.getUser_no());
		
		int result = 0;
		String url = "";
		result = reserveService.reserveInsert(rvo);
		reAttr.addFlashAttribute("data", rvo);
		
		if (result == 1) {
			url = "/reserve/detail";
		} else {
			url = "/brewery/reserveForm";
		}
		
		return "redirect:" + url;
	}
	
	/*******************************************************
	 * ���೻�� ��ȸ
	 *******************************************************/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String reserveDetail(@ModelAttribute("data") ReserveVO rvo, Model model) {
		log.info("reserveDetail ȣ�� ����");
		
		ReserveVO detail = reserveService.reserveDetail(rvo);
		model.addAttribute("detail", detail);
		
		return "brewery/reserve";
	}
	
	/* ���� ��� ���� */
	@RequestMapping(value = "/cancel")
	public String reserveCancel(@ModelAttribute ReserveVO rvo, RedirectAttributes reAttr) throws Exception {
		log.info("reserveCancel ȣ�� ����");
		
		int result = 0;
		result = reserveService.reserveCancel(rvo);
		reAttr.addFlashAttribute("data", rvo);
		
		if (result != 1) {
			reAttr.addFlashAttribute("sendMsg", "���� ��Ұ� �Ұ��մϴ�. �����ڿ��� �����ϼ���.");
		}
		
		return "redirect:/myPage/reserve";
	}
}