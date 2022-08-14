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
	
	/* 상품후기 목록 조회 */
	@GetMapping(value = "/pdReview/{pd_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReplyVO>> pdReviewList(@PathVariable("pd_id") Integer pd_id) {
		log.info("pdReviewList 호출 성공");
		
		ResponseEntity<List<ReplyVO>> entity = null;
		entity = new ResponseEntity<>(reviewService.pdReviewList(pd_id), HttpStatus.OK);
				
		return entity;
	}
	
	/* 양조장후기 목록 조회 */
	@GetMapping(value = "/brReview/{br_id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<BreplyVO>> brReviewList(@PathVariable("br_id") Integer br_id) {
		log.info("brReviewList 호출 성공");
		
		ResponseEntity<List<BreplyVO>> entity = null;
		entity = new ResponseEntity<>(reviewService.brReviewList(br_id), HttpStatus.OK);
				
		return entity;
	}
	
}
