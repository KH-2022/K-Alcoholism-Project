package com.kap.client.qna.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kap.client.qna.service.QnaService;
import com.kap.client.qna.vo.QnaVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna")
@AllArgsConstructor
public class QnaController {
	
	private QnaService qnaService;

	/***************************************************
	 * �� ��� �����ϱ�(����¡ ó���κ� ���� ��� ��ȸ)
	 ***************************************************/
	@RequestMapping(value="/qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaList ȣ�� ����");
		
		// ��ü ���ڵ� ��ȸ
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		return "qna/qnaList";
	} 

}