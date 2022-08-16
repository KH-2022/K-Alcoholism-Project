package com.kap.client.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.login.service.LoginService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes("login")
@Log4j
@RequestMapping("/login/*")
@RequiredArgsConstructor
public class LoginController {
	
	private final LoginService loginService;
	
	@ModelAttribute
	   public MemberVO login() {
	      return new MemberVO();
	   }
	   
	   /* �α��� ȭ�� ���� */
	   @GetMapping("/login")
	   public String loginForm() {
	      log.info("�α��� ȭ�� ȣ��");
	      
	      return "login/login";
	   }
	   
	   /* �α��� ó�� �޼��� */
	   @PostMapping("/login")
	   public String loginProcess(HttpServletRequest request, MemberVO login, Model model, RedirectAttributes ras) {
		  HttpSession session = request.getSession();
		  String url = "";
		  MemberVO clientLogin = loginService.loginProcess(login);
	      log.info("clientlogin:" + clientLogin);
	      
	      if(clientLogin != null) {
	    	 session.setAttribute("login",clientLogin);
	         url = "/";
	      } else {
	         ras.addFlashAttribute("errorMsg", "�α��� ����");
	         url = "/login/login";
	      }
	      return "redirect:"+url;
	   }
	   
	   /* �α׾ƿ� ó�� �޼��� */
	   @RequestMapping("/logout")
	   public String logout(HttpServletRequest request, SessionStatus sessionStatus) {
			/*
			 * HttpSession session = request.getSession(); session.invalidate();
			 */
	      log.info("�α׾ƿ� ó��");
	      sessionStatus.setComplete();
	      return "redirect:/login/login";
	   }
}