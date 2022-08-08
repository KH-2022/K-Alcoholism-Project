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
	   
	   /* 로그인 화면 구현 */
	   @GetMapping("/login")
	   public String loginForm() {
	      log.info("로그인 화면 호출");
	      
	      return "login/login";
	   }
	   
	   /* 로그인 처리 메서드 */
	   @PostMapping("/login")
	   public String loginProcess(LoginVO login, Model model, RedirectAttributes ras) {
	      String url = "";
	      LoginVO clientLogin = loginService.loginProcess(login);
	      log.info("clientlogin:" + clientLogin);
	      
	      if(clientLogin != null) {
	         model.addAttribute("login",clientLogin);
	         url = "/";
	      } else {
	         ras.addFlashAttribute("errorMsg", "로그인 실패");
	         url = "/login/login";
	      }
	      return "redirect:"+url;
	   }
	   
	   /* 로그아웃 처리 메서드 */
	   @RequestMapping("/logout")
	   public String logout(SessionStatus sessionStatus) {
	      log.info("로그아웃 처리");
	      sessionStatus.setComplete();
	      return "redirect:/login/login";
	   }
}