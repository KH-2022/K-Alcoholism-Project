package com.kap.common.exception;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/et")
@AllArgsConstructor

public class error {
	
	@GetMapping("/divide")
	public String probelm(Model model) {
		int result = 1/0;
		
		model.addAttribute("serverTime", result);
		return "/";
	}
	
	@PostMapping("/method")
	public String method(Model model) {
		return "/";
	}


}
