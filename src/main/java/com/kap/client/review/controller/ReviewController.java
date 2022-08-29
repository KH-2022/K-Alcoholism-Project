package com.kap.client.review.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.client.review.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
public class ReviewController {
	
	private ReviewService reviewService;
	
	/* ��ǰ�ı� ��� ��ȸ */
	@GetMapping(value = "/pdReview/{pd_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReplyVO>> pdReviewList(@PathVariable("pd_id") Integer pd_id) {
		log.info("pdReviewList ȣ�� ����");
		
		ResponseEntity<List<ReplyVO>> entity = null;
		entity = new ResponseEntity<>(reviewService.pdReviewList(pd_id), HttpStatus.OK);
				
		return entity;
	}
	
	/* �������ı� ��� ��ȸ */
	@GetMapping(value = "/brReview/{br_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<BreplyVO>> brReviewList(@PathVariable("br_id") Integer br_id) {
		log.info("brReviewList ȣ�� ����");
		
		ResponseEntity<List<BreplyVO>> entity = null;
		entity = new ResponseEntity<>(reviewService.brReviewList(br_id), HttpStatus.OK);
				
		return entity;
	}
	
	/* ���������� ��ǰ�ı� ��ȸ */
	@GetMapping(value = "/pdReview/main", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReplyVO>> mainPdReview() {
		log.info("mainPdReview ȣ�� ����");
		
		ResponseEntity<List<ReplyVO>> entity = null;
		entity = new ResponseEntity<>(reviewService.pdReviewMain(), HttpStatus.OK);
				
		return entity;
	}
	
	/* ���������� �������ı� ��ȸ */
	@GetMapping(value = "/brReview/main", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<BreplyVO>> mainBrReview() {
		log.info("mainBrReview ȣ�� ����");
		
		ResponseEntity<List<BreplyVO>> entity = null;
		entity = new ResponseEntity<>(reviewService.brReviewMain(), HttpStatus.OK);
				
		return entity;
	}
}