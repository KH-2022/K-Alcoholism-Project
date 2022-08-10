package com.kap.client.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.client.myPage.service.MypageService;
import com.kap.client.signUp.vo.SignUpVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@SessionAttributes("login")
@RequestMapping("/myPage")
@RequiredArgsConstructor
public class MypageController {
	
	private final MypageService mypageService;
	
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String mypageForm(SignUpVO svo) {
		return "client/myPage";
	}
	
	@RequestMapping(value="/rez", method = RequestMethod.GET)
	public String rezForm(SignUpVO svo) {
		return "client/rez";
	}
	@RequestMapping(value="/qna", method = RequestMethod.GET)
	public String qnaForm(SignUpVO svo) {
		return "client/qna";
	}
	@RequestMapping(value="/withdrawal", method = RequestMethod.GET)
	public String withdrawalForm(SignUpVO svo) {
		return "client/withdrawal";
	}
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addForm(SignUpVO svo) {
		return "client/add";
	}
	
	@RequestMapping(value="/account", method = RequestMethod.GET)
	public String accountForm(@ModelAttribute SignUpVO svo, Model model) {
		return "client/account";
	}
	
	@RequestMapping(value="/userUpdate", method = RequestMethod.POST)
	public String userUpdate(@ModelAttribute SignUpVO svo,Model model, RedirectAttributes ras ) throws Exception{
		log.info("userUpdate 호출 성공");
		String url = "";
		int result = mypageService.userUpdate(svo);
		
		if(result == 1) {
			ras.addFlashAttribute("updateMsg", "회원정보 수정이 완료되었습니다.");
			url = "/myPage/account";
		} else {
			ras.addFlashAttribute("errorMsg", "회원정보 수정에 실패하였습니다. 관리자에게 문의하세요.");
			url = "/";
		}
		
		SignUpVO updateLogin = mypageService.getUser(svo);
	      log.info("loginSessionUpdate : " + updateLogin);
		
	      if(updateLogin != null) 
	         model.addAttribute("login", updateLogin);
		
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/editAdd", method = RequestMethod.POST)
	public String editAdd(SignUpVO svo, RedirectAttributes ras) throws Exception{
		log.info("editAdd 호출 성공");
		
		String url = "";
		int result = mypageService.editAdd(svo);
		if(result == 1) {
			ras.addFlashAttribute("updateMsg", "기본 배송지가 수정 되었습니다.");
			url = "/myPage/myPage";
		} else {
			ras.addFlashAttribute("errorMsg", "회원정보 수정에 실패하였습니다. 관리자에게 문의하세요.");
			url = "/";
		}
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/userWithdrawal", method=RequestMethod.POST)
	public String userWithdrawal(SignUpVO svo, RedirectAttributes ras, SessionStatus sessionStatus) throws Exception{
		log.info("userWithdrawal 호출 성공");
		String url = "";
		
		int result = mypageService.userWithdrawal(svo);
		if(result == 1) {
			ras.addFlashAttribute("WithdrawalMsg", "회원탈퇴가 완료되었습니다. 감사합니다.");
			sessionStatus.setComplete();
			url = "/";
		} else {
			ras.addFlashAttribute("errorMsg", "회원탈퇴에 실패하였습니다. 관리자에게 문의하세요.");
			url = "/";
		}

		return "redirect:"+url;
	}
}