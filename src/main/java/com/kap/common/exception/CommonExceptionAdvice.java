package com.kap.common.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/error")
@AllArgsConstructor
public class CommonExceptionAdvice {
	
	@RequestMapping(value = "/400")
	public String errorPage400(Model model, HttpServletRequest request, RedirectAttributes reAttr) {
		model.addAttribute("error400", model);
		log.info("400 ���� ������ ȣ��");
		
		HttpSession session = request.getSession();
		MemberVO clientLogin = (MemberVO) session.getAttribute("login");
		
		if (clientLogin == null) { //�α���üũ
			reAttr.addFlashAttribute("errorMsg", "�α����� �ʿ��մϴ�.");
			return "redirect:/login/login";
		}
		
		return "error/error_page";
	}
	
	@RequestMapping(value = "/403")
	public String errorPage403(Model model) {
		model.addAttribute("error403", model);
		log.info("403 ���� ������ ȣ��");
		return "error/error_page";
	}
	
	@RequestMapping(value = "/404")
	public String errorPage404(Model model, HttpServletRequest request, RedirectAttributes reAttr) {
		model.addAttribute("error404", model);
		log.info("404 ���� ������ ȣ��");
		
		HttpSession session = request.getSession();
		MemberVO clientLogin = (MemberVO) session.getAttribute("login");
		
		if (clientLogin == null) { //�α���üũ
			reAttr.addFlashAttribute("errorMsg", "�α����� �ʿ��մϴ�.");
			return "redirect:/login/login";
		}
		
		return "error/error_page";
	}
	
	@RequestMapping(value = "/405")
	public String errorPage405(Model model) {
		model.addAttribute("error405", model);
		log.info("405 ���� ������ ȣ��");
		return "error/error_page";
	}
	
	@RequestMapping(value = "/500")
	public String errorPage500(Model model) {
		model.addAttribute("error500", model);
		log.info("500 ���� ������ ȣ��");
		return "error/error_page";
	}
}