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
	 * �� ��� �����ϱ�(����¡ ó�� ��� ��ȸ)
	 ***************************************************/
	@RequestMapping(value="/qna/qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaList ȣ�� ����");
		// ��ü ���ڵ� ��ȸ
		List<QnaVO> qnaList = adminQnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		// ��ü ���ڵ� �� ����
		int total = adminQnaService.qnaListCnt(qvo);
		
		// ����¡ ó��
		model.addAttribute("pageMaker", new PageDTO(total, qvo));
		
		return "admin/qna/qnaList";
	}
	
	/***************************************************
	 * �� �󼼺��� ����
	 ***************************************************/
	@RequestMapping(value="/qna/qnaDetail", method=RequestMethod.GET)
	public String qnaDetail(@ModelAttribute QnaVO qvo, Model model) {
		log.info("admin qnaDetail ȣ�� ����");
		
		QnaVO detail = adminQnaService.qnaDetail(qvo);
		model.addAttribute("detail", detail);
		
		return "admin/qna/qnaDetail";
	}
}