package com.kap.client.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.client.review.dao.ReviewDao;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Setter(onMethod_ = @Autowired)
	private ReviewDao reviewDao;
	
	/* 상품후기 목록 */
	@Override
	public List<ReplyVO> pdReviewList(Integer pd_id) {
		List<ReplyVO> list = null;
		list = reviewDao.pdReviewList(pd_id);
		return list;
	}

	/* 체험후기 목록 */
	@Override
	public List<BreplyVO> brReviewList(Integer br_id) {
		List<BreplyVO> list = null;
		list = reviewDao.brReviewList(br_id);
		return list;
	}

	@Override
	public List<ReplyVO> pdReviewMain() {
		List<ReplyVO> list = null;
		list = reviewDao.pdReviewMain();
		return list;
	}

	@Override
	public List<BreplyVO> brReviewMain() {
		List<BreplyVO> list = null;
		list = reviewDao.brReviewMain();
		return list;
	}

}
