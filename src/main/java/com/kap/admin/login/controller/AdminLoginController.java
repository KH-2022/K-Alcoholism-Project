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
@SessionAttributes("adminLogin") //Model 정보를 HTTP 세션에 저장해주는 어노테이션
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class AdminLoginController {

	private AdminLoginService adminLoginService;
	
	/* @SessionAttributes의 파라미터와 같은 이름이 @ModelAttribute에 있을 경우
	 * 세션에 있는 객체를 가져온 후, 클라이언트로 전송받은 값을 설정한다. */
	@ModelAttribute
	public AdminLoginVO adminLogin() {
		return new AdminLoginVO();
	}
	
	
	/***************************************************************
	 * 로그인 화면 구현 메서드
	 * 요청 URL : http://localhost:8080/admin/login으로 요청
	 ***************************************************************/
	@GetMapping("/login")
	public String loginForm() {
		log.info("admin 로그인 화면 호출");
		
		return "admin/main"; // /WEB-INF/views/admin/main.jsp 로 포워드. (관리자 시작페이지로 구분)
	}
	
	
	/***************************************************************
	 * 로그인 처리 메서드
	 * 참고 : 자바단에서 세션의 값을 사용할 경우 Controller 내 메서드에 
	 * @SessionAttributes("adminLogin") 명시해 준 이름을
	 * public 반환형 메서드명(@SessionAtrribute("adminLogin") VO클래스명 참조변수)로
	 * 정의하고 사용하면 된다.
	 ***************************************************************/
	@PostMapping("/login")
	public String loginProcess(AdminLoginVO login, Model model, RedirectAttributes ras) {
		String url = "";
		AdminLoginVO adminLogin = adminLoginService.loginProcess(login);
		
		if(adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);
			url = "/admin/member/memberList";
		} else {
			ras.addFlashAttribute("errorMsg", "로그인 실패");
			url = "/admin/login";
		}
		return "redirect:" + url;
	}
	
	
	/***************************************************************
	 * 로그아웃 처리 메서드
	 ***************************************************************/
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("admin 로그아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
}