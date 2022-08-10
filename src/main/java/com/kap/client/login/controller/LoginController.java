package com.kap.client.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.client.login.service.LoginService;
import com.kap.client.login.vo.LoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes("login")
@Log4j
@RequestMapping("/login/*")
@AllArgsConstructor
public class LoginController {
	private LoginService loginService;
	
	@ModelAttribute
	   public LoginVO login() {
	      return new LoginVO();
	   }
	   
	   /* �α��� ȭ�� ���� */
	   @GetMapping("/login")
	   public String loginForm() {
	      log.info("�α��� ȭ�� ȣ��");
	      
	      return "login/login";
	   }
	   
	   /* �α��� ó�� �޼��� */
	   @PostMapping("/login")
	   public String loginProcess(LoginVO login, Model model, RedirectAttributes ras) {
	      String url = "";
	      LoginVO clientLogin = loginService.loginProcess(login);
	      
	      if(clientLogin != null) {
	         model.addAttribute("login", clientLogin);
	         url = "/";
	      } else {
	         ras.addFlashAttribute("errorMsg", "�α��� ����");
	         url = "/login/login";
	      }
	      return "redirect:"+url;
	   }
	   
	   /* �α׾ƿ� ó�� �޼��� */
	   @RequestMapping("/logout")
	   public String logout(SessionStatus sessionStatus) {
	      log.info("�α׾ƿ� ó��");
	      sessionStatus.setComplete();
	      return "redirect:/login/login";
	   }
}