package com.kap.client.review.service;

import java.util.List;

import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;

public interface ReviewService {

	public List<ReplyVO> pdReviewList(Integer pd_id);
	
	public List<BreplyVO> brReviewList(Integer br_id);
	
}
