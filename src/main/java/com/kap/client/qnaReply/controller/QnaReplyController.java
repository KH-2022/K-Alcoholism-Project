package com.kap.client.qnaReply.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kap.client.qnaReply.service.QnaReplyService;
import com.kap.client.qnaReply.vo.QnaReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value="/qnaReply")
@Log4j
@AllArgsConstructor
public class QnaReplyController {
	
	private QnaReplyService qnaReplyService;
	
	/***************************************************************************************
	 * 댓글 목록 구현하기
	 ***************************************************************************************/
	@GetMapping(value = "/all/{qna_no}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<QnaReplyVO> qnaReplyList(@PathVariable("qna_no") Integer qna_no) {
		log.info("qna reply list 호출 성공");
		
		List<QnaReplyVO> entity = null;
		entity = qnaReplyService.qnaReplyList(qna_no);
		return entity;
	}
	
	/***************************************************************************************
	 * 댓글 등록 구현하기
	 **************************************************************************************/
	@PostMapping(value = "/qnaReplyInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String qnaReplyInsert(@RequestBody QnaReplyVO qrvo) {
		log.info("qnaReplyInsert 호출 성공");
		log.info("QnaReplyVO : " + qrvo);
		int result = 0;
		
		result = qnaReplyService.qnaReplyInsert(qrvo);
		return(result==1) ? "SUCCESS" : "FAILURE";
	}
	
	/***************************************************************************************
	 * 댓글 수정 구현하기
	 ***************************************************************************************/
	@PutMapping(value = "/{qna_re_no}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String qnaReplyUpdate(@PathVariable("qna_re_no") int qna_re_no, @RequestBody QnaReplyVO qrvo) {
		log.info("qnaReplyUpdate 호출 성공");
		
		qrvo.setQna_re_no(qna_re_no);
		int result = qnaReplyService.qnaReplyUpdate(qrvo);
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}
	
	/***************************************************************************************
	 * 댓글 삭제 구현하기
	 ***************************************************************************************/
	@DeleteMapping(value = "/{qna_re_no}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String qnaReplyDelete(@PathVariable("qna_re_no") int qna_re_no) {
		log.info("qnaReplyDelete 호출 성공");
		log.info("qna_re_no = " + qna_re_no);
		
		int result = qnaReplyService.qnaReplyDelete(qna_re_no);
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}
}