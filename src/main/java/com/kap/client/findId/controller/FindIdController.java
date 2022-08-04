package com.kap.client.findId.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kap.client.findId.service.FindIdService;
import com.kap.client.findId.vo.FindIdVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/findId/*")
@AllArgsConstructor
public class FindIdController {
	private FindIdService findIdService;
	
	@RequestMapping(value="/findIdForm")
	public String findIdForm(FindIdVO fvo) {
		log.info("findIdForm 호출 성공");
		return "findId/findIdForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/findId",method=RequestMethod.POST)
	public String findId(FindIdVO fvo, Model model) throws Exception{
		log.info("findId 호출 성공");
		
		String result = findIdService.findId(fvo);
		return result;
	}
	
}
