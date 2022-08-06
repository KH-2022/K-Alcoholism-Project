package com.kap.client.signUp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kap.client.signUp.service.SignUpService;
import com.kap.client.signUp.vo.SignUpVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/signUp/*")
@AllArgsConstructor
public class SignUpController {
	private SignUpService signUpService;
	
	@RequestMapping(value="/signUpForm")
	public String signUpForm(@ModelAttribute("data") SignUpVO svo) {
		log.info("signUpForm ȣ�� ����");
		return "signUp/signUpForm";
	}
	
	@ResponseBody
	@PostMapping(value="/idCheck", produces="application/json")
	public int idCheck(@RequestBody SignUpVO svo){
		log.info("idCheck ȣ�� ����");
		
		int result = signUpService.idCheck(svo);
		return result;
	}
	
	@ResponseBody
	@PostMapping(value="/emailCheck", produces="application/json")
	public int emailCheck(@RequestBody SignUpVO svo){
		log.info("emailCheck ȣ�� ����");
		
		int result = signUpService.emailCheck(svo);
		return result;
	}
	
	@RequestMapping(value="/signUpInsert", method = RequestMethod.POST)
	public String signUpInsert(SignUpVO svo, Model model) {
		log.info("signUpInsert ȣ�� ����");
		
		int result = 0;
		String url = "";
		
		result = signUpService.signUpInsert(svo);
		if(result ==1) {
			url = "/signUp/signUpForm";
		} else {
			url = "/signUp/signUpForm";
		}
		
		return "redirect:"+url;
	}
	
}