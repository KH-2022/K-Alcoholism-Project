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
	 * 예약 처리 구현
	 *******************************************************/
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String reserveInsert(@ModelAttribute ReserveVO rvo, @SessionAttribute("login") MemberVO loginMember, Model model, RedirectAttributes reAttr) throws Exception {
		log.info("reserveInsert 호출 성공");
		
		if (loginMember == null) {
			reAttr.addFlashAttribute("errorMsg", "로그인이 필요합니다.");
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
	 * 예약내역 조회
	 *******************************************************/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String reserveDetail(@ModelAttribute("data") ReserveVO rvo, Model model) {
		log.info("reserveDetail 호출 성공");
		
		ReserveVO detail = reserveService.reserveDetail(rvo);
		model.addAttribute("detail", detail);
		
		return "brewery/reserve";
	}
	
	/* 예약 취소 구현 */
	@RequestMapping(value = "/cancel")
	public String reserveCancel(@ModelAttribute ReserveVO rvo, RedirectAttributes reAttr) throws Exception {
		log.info("reserveCancel 호출 성공");
		
		int result = 0;
		result = reserveService.reserveCancel(rvo);
		reAttr.addFlashAttribute("data", rvo);
		
		if (result != 1) {
			reAttr.addFlashAttribute("sendMsg", "예약 취소가 불가합니다. 관리자에게 문의하세요.");
		}
		
		return "redirect:/myPage/reserve";
	}
}
