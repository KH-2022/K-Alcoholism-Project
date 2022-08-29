package com.kap.admin.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.login.service.AdminLoginService;
import com.kap.admin.login.vo.AdminLoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes("adminLogin") //Model ������ HTTP ���ǿ� �������ִ� ������̼�
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminLoginController {

	private AdminLoginService adminLoginService;
	
	/* @SessionAttributes�� �Ķ���Ϳ� ���� �̸��� @ModelAttribute�� ���� ���
	 * ���ǿ� �ִ� ��ü�� ������ ��, Ŭ���̾�Ʈ�� ���۹��� ���� �����Ѵ�. */
	@ModelAttribute
	public AdminLoginVO adminLogin() {
		return new AdminLoginVO();
	}
	
	
	/***************************************************************
	 * �α��� ȭ�� ���� �޼���
	 * ��û URL : http://localhost:8080/admin/login���� ��û
	 ***************************************************************/
	@GetMapping("/login")
	public String loginForm() {
		log.info("admin �α��� ȭ�� ȣ��");
		
		return "admin/main"; // /WEB-INF/views/admin/main.jsp �� ������. (������ ������������ ����)
	}
	
	
	/***************************************************************
	 * �α��� ó�� �޼���
	 * ���� : �ڹٴܿ��� ������ ���� ����� ��� Controller �� �޼��忡 
	 * @SessionAttributes("adminLogin") ����� �� �̸���
	 * public ��ȯ�� �޼����(@SessionAtrribute("adminLogin") VOŬ������ ��������)��
	 * �����ϰ� ����ϸ� �ȴ�.
	 ***************************************************************/
	@PostMapping("/login")
	public String loginProcess(AdminLoginVO login, Model model, RedirectAttributes ras) {
		String url = "";
		AdminLoginVO adminLogin = adminLoginService.loginProcess(login);
		
		if(adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);
			url = "/admin/member/memberList";
		} else {
			ras.addFlashAttribute("errorMsg", "�α��� ����");
			url = "/admin/login";
		}
		return "redirect:" + url;
	}
	
	
	/***************************************************************
	 * �α׾ƿ� ó�� �޼���
	 ***************************************************************/
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("admin �α׾ƿ� ó��");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
}