package com.kap.admin.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kap.admin.qna.service.AdminQnaService;
import com.kap.client.qna.vo.QnaVO;
import com.kap.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/admin")
@Log4j
public class AdminQnaController {

	@Setter(onMethod_ = @Autowired)
	private AdminQnaService adminQnaService;
	
	/***************************************************
	 * 글 목록 구현하기(페이징 처리 목록 조회)
	 ***************************************************/
	@RequestMapping(value="/qna/qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaList 호출 성공");
		// 전체 레코드 조회
		List<QnaVO> qnaList = adminQnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		// 전체 레코드 수 구현
		int total = adminQnaService.qnaListCnt(qvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(total, qvo));
		
		return "admin/qna/qnaList";
	}
	
	/***************************************************
	 * 글 상세보기 구현
	 ***************************************************/
	@RequestMapping(value="/qna/qnaDetail", method=RequestMethod.GET)
	public String qnaDetail(@ModelAttribute QnaVO qvo, Model model) {
		log.info("admin qnaDetail 호출 성공");
		
		QnaVO detail = adminQnaService.qnaDetail(qvo);
		model.addAttribute("detail", detail);
		
		return "admin/qna/qnaDetail";
	}
}