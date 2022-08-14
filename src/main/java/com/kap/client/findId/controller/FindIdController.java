package com.kap.client.findId.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.findId.service.FindIdService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/findId/*")
@AllArgsConstructor
public class FindIdController {
	private FindIdService findIdService;
	
	@RequestMapping(value="/findIdForm")
	public String findIdForm(MemberVO mvo) {
		log.info("findIdForm 호출 성공");
		return "findId/findIdForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/findId",method=RequestMethod.POST)
	public String findId(MemberVO mvo, Model model) throws Exception{
		log.info("findId 호출 성공");
		
		String result = findIdService.findId(mvo);
		log.info("findId 실행 성공");
		return result;
	}
	
	@RequestMapping(value="/findPw",method=RequestMethod.POST)
	public void findPw(@ModelAttribute MemberVO mvo, HttpServletResponse response) throws Exception{
		log.info("findPw 호출 성공");
		
		findIdService.findPw(response, mvo);	
	}
	
}