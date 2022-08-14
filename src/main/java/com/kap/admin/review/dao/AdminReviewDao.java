package com.kap.admin.review.dao;

import java.util.List;

import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;

public interface AdminReviewDao {

	List<ReplyVO> pdReplyList(ReplyVO rvo);

	List<BreplyVO> brReplyList(BreplyVO bvo);

	int pdReplyListCnt(ReplyVO rvo);

	int brReplyListCnt(BreplyVO bvo);

	ReplyVO pdReplyDetail(ReplyVO rvo);

	void pdReplyDelete(int pd_review_no);

	BreplyVO brReplyDetail(BreplyVO bvo);

	void brReplyDelete(int br_review_no);
	
}
