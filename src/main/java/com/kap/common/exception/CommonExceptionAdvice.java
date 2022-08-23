package com.kap.common.exception;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/error")
@AllArgsConstructor
public class CommonExceptionAdvice {
	
	@RequestMapping(value = "/400")
	public String errorPage400(Model model) {
		model.addAttribute("error400",model);
		log.info("400 에러 페이지 호출");
		return "error/error_page";
	}
	
	@RequestMapping(value = "/403")
	public String errorPage403(Model model) {
		model.addAttribute("error403",model);
		log.info("403 에러 페이지 호출");
		return "error/error_page";
	}
	
	@RequestMapping(value = "/404")
	public String errorPage404(Model model) {
		model.addAttribute("error404",model);
		log.info("404 에러 페이지 호출");
		return "error/error_page";
	}
	
	@RequestMapping(value = "/405")
	public String errorPage405(Model model) {
		model.addAttribute("error405",model);
		log.info("405 에러 페이지 호출");
		return "error/error_page";
	}
	
	@RequestMapping(value = "/500")
	public String errorPage500(Model model) {
		model.addAttribute("error500",model);
		log.info("500 에러 페이지 호출");
		return "error/error_page";
	}
}
