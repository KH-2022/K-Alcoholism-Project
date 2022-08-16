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
	 * �� ��� �����ϱ�(����¡ ó�� ��� ��ȸ)
	 ***************************************************/
	@RequestMapping(value="/qnaList", method = RequestMethod.GET)
	public String qnaList(@ModelAttribute QnaVO qvo, Model model) {
		log.info("qnaList ȣ�� ����");
		// ��ü ���ڵ� ��ȸ
		List<QnaVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		// ��ü ���ڵ� �� ����
		int total = qnaService.qnaListCnt(qvo);
		
		// ����¡ ó��
		model.addAttribute("pageMaker", new PageDTO(total, qvo));
		
		return "qna/qnaList";
	}
	
	/***************************************************
	 * �� �󼼺��� ����
	 ***************************************************/
	@RequestMapping(value="/qnaDetail", method=RequestMethod.GET)
	public String qnaDetail(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("qnaDetail ȣ�� ����");
		
		QnaVO detail = qnaService.qnaDetail(qvo);
		model.addAttribute("detail", detail);
		
		return "qna/qnaDetail";
	}
	
	/***************************************************
	 * �۾��� �� ���
	 ***************************************************/
	@RequestMapping(value="/writeForm")
	public String writeForm() {
		log.info("writeForm ȣ�� ����");
		
		return "qna/writeForm";
	}
	
	/***************************************************
	 * �۾��� ����
	 ***************************************************/
	@RequestMapping(value="/qnaInsert", method=RequestMethod.POST)
	public String qnaInsert(@SessionAttribute("login") MemberVO loginMember, QnaVO qvo, Model model) throws Exception {
		log.info("qnaInsert ȣ�� ����");
		
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
	 * �ۼ��� �� ���
	 ***************************************************/
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute("data") QnaVO qvo, Model model) {
		log.info("updateForm ȣ�� ����");
		log.info("qna_no = " + qvo.getQna_no());
		
		QnaVO updateData = qnaService.updateForm(qvo);
		
		model.addAttribute("updateData", updateData);
		return "qna/updateForm";
	}
	
	
	/***************************************************
	 * �ۼ��� ����
	 ***************************************************/
	@RequestMapping(value="/qnaUpdate", method=RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaVO qvo, RedirectAttributes ras) throws Exception {
		log.info("qnaUpdate ȣ�� ����");
		
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
	 * �ۻ��� ����
	 ***************************************************/
	@RequestMapping(value="/qnaDelete")
	public String qnaDelete(@ModelAttribute QnaVO qvo, RedirectAttributes ras) throws Exception {
		log.info("qnaDelete ȣ�� ����");
		
		// �Ʒ� �������� �Է� ������ ���� ���� ���� ��´�. (1 or 0)
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
	 * �� ���� �� ��� ���� ����
	 ***************************************************/
	@ResponseBody
	@RequestMapping(value="/qnaReplyCnt")
	public String qnaReplyCnt(@RequestParam("qna_no") int qna_no) {
		log.info("qnaReplyCnt ȣ�� ����");
		
		int result = 0;
		result = qnaService.qnaReplycnt(qna_no);
		
		return String.valueOf(result);
	}
}