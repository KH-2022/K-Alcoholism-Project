package com.kap.client.signUp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.signUp.service.SignUpService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/signUp/*")
@RequiredArgsConstructor
public class SignUpController {
	private final SignUpService signUpService;
	
	@RequestMapping(value="/signUpForm")
	public String signUpForm(@ModelAttribute("data") MemberVO mvo) {
		log.info("signUpForm 호출성공");
		return "signUp/signUpForm";
	}
	
	@ResponseBody
	@PostMapping(value="/idCheck", produces="application/json")
	public int idCheck(@RequestBody MemberVO mvo){
		log.info("idCheck 호출성공");
		
		int result = signUpService.idCheck(mvo);
		return result;
	}
	
	@ResponseBody
	@PostMapping(value="/emailCheck", produces="application/json")
	public int emailCheck(@RequestBody MemberVO mvo){
		log.info("emailCheck 호출성공");
		
		int result = signUpService.emailCheck(mvo);
		return result;
	}
	
	@RequestMapping(value="/signUpInsert", method = RequestMethod.POST)
	public String signUpInsert(MemberVO mvo, Model model) {
		log.info("signUpInsert 호출성공");
		
		int result = 0;
		String url = "";
		
		result = signUpService.signUpInsert(mvo);
		if(result ==1) {
			url = "/";
		} else {
			url = "/signUp/signUpForm";
		}
		
		return "redirect:"+url;
	}
	
}