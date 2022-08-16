package com.kap.client.qna.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.qna.service.QnaService;
import com.kap.client.qna.vo.QnaVO;
import com.kap.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna")
@AllArgsConstructor
public class QnaController {
	
	private QnaService qnaService;

	/***************************************************
	 * 글 목록 구현하기(페이징 처리 목록 조회)
	 ***************************************************/
	@RequestMapping(value="/qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaList 호출 성공");
		// 전체 레코드 조회
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		// 전체 레코드 수 구현
		int total = qnaService.qnaListCnt(qvo);
		
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(total, qvo));
		
		return "qna/qnaList";
	}
	
	/***************************************************
	 * 글 상세보기 구현
	 ***************************************************/
	@RequestMapping(value="/qnaDetail", method=RequestMethod.GET)
	public String qnaDetail(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("qnaDetail 호출 성공");
		
		QnaVO detail = qnaService.qnaDetail(qvo);
		model.addAttribute("detail", detail);
		
		return "qna/qnaDetail";
	}
	
	/***************************************************
	 * 글쓰기 폼 출력
	 ***************************************************/
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		log.info("writeForm 호출 성공");
		
		return "qna/writeForm";
	}
	
	/***************************************************
	 * 글쓰기 구현
	 ***************************************************/
	@RequestMapping(value="/qnaInsert", method=RequestMethod.POST)
	public String qnaInsert(@SessionAttribute("login") MemberVO loginMember, QnaVO qvo, Model model) throws Exception {
		log.info("qnaInsert 호출 성공");
		
		qvo.setUser_no(loginMember.getUser_no());
		
		int result = 0;
		String url = "";
		
		result = qnaService.qnaInsert(qvo);
		if(result == 1) {
			url = "/qna/qnaList";
		} else {
			url = "/qna/writeForm";
		}
		
		return "redirect:" + url;
	}
	
	/***************************************************
	 * 글수정 폼 출력
	 ***************************************************/
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("updateForm 호출 성공");
		log.info("qna_no = " + qvo.getQna_no());
		
		QnaVO updateData = qnaService.updateForm(qvo);
		
		model.addAttribute("updateData", updateData);
		return "qna/updateForm";
	}
	
	
	/***************************************************
	 * 글수정 구현
	 ***************************************************/
	@RequestMapping(value="/qnaUpdate", method=RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaVO qvo, RedirectAttributes ras) throws Exception {
		log.info("qnaUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = qnaService.qnaUpdate(qvo);
		ras.addFlashAttribute("data", qvo);
		
		if(result == 1) {
			url="/qna/qnaDetail";
		} else {
			url="/qna/updateForm";
		}
		
		return "redirect:" + url;
	}
	
	
	/***************************************************
	 * 글삭제 구현
	 ***************************************************/
	@RequestMapping(value="/qnaDelete")
	public String qnaDelete(@ModelAttribute QnaVO qvo, RedirectAttributes ras) throws Exception {
		log.info("qnaDelete 호출 성공");
		
		// 아래 변수에는 입력 성공에 대한 상태 값을 담는다. (1 or 0)
		int result = 0;
		String url = "";
		
		result = qnaService.qnaDelete(qvo);
		ras.addFlashAttribute("QnaVO", qvo);
		
		if(result == 1) {
			url = "/qna/qnaList";
		} else {
			url = "/qna/qnaDetail";
		}
		return "redirect:" + url; 
	}
	
	
	/***************************************************
	 * 글 삭제 전 댓글 개수 구현
	 ***************************************************/
	@ResponseBody
	@RequestMapping(value="/qnaReplyCnt")
	public String qnaReplyCnt(@RequestParam("qna_no") int qna_no) {
		log.info("qnaReplyCnt 호출 성공");
		
		int result = 0;
		result = qnaService.qnaReplycnt(qna_no);
		
		return String.valueOf(result);
	}
}