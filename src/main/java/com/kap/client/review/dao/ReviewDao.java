package com.kap.client.review.dao;

import java.util.List;

import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;

public interface ReviewDao {
	
	public List<ReplyVO> pdReviewList(Integer pd_id);
	
	public int pdReviewInsert(ReplyVO rvo);

	public int pdReviewDelete(Integer pd_review_no);

	public int pdReviewUpdate(ReplyVO rvo);
	
	public int pdReviewCnt(int pd_id);
	
	public List<BreplyVO> brReviewList(Integer br_id);
	
	public int brReviewInsert(BreplyVO bvo);

	public int brReviewDelete(Integer br_review_no);

	public int brReviewUpdate(BreplyVO bvo);
	
	public int brReviewCnt(int br_id);

	public List<ReplyVO> pdReviewMain();

	public List<BreplyVO> brReviewMain();
	
}
