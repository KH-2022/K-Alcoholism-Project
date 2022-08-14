package com.kap.client.reserve.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.client.login.vo.LoginVO;
import com.kap.client.reserve.service.ReserveService;
import com.kap.client.reserve.vo.ReserveVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@SessionAttributes("login")
@AllArgsConstructor
public class ReserveController {
	
	private ReserveService reserveService;
	
	/*******************************************************
	 * 예약 처리 구현 (미완성)
	 *******************************************************/
	@RequestMapping(value = "/breweryReserve", method = RequestMethod.POST)
	public String breweryReserve(@ModelAttribute ReserveVO rvo, HttpServletRequest request, Model model, RedirectAttributes reAttr) throws Exception {
		log.info("breweryReserve 호출 성공");
		
		HttpSession session = request.getSession();
		LoginVO clientLogin = (LoginVO) session.getAttribute("login");
		rvo.setUser_no(clientLogin.getUser_no()); 
		
		int result = 0;
		String url = "";
		result = reserveService.breweryReserve(rvo);
		
		if (result == 1) {
			ReserveVO detail = reserveService.reserveDetail(rvo);
			model.addAttribute("detail", detail);
			url = "brewery/reserve";
		} else {
			url = "redirect:/brewery/reserveForm";
		}
		
		return url;
	}
}
