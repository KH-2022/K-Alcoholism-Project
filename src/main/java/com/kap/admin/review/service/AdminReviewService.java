package com.kap.admin.review.service;

import java.util.List;

import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;

public interface AdminReviewService {

	List<ReplyVO> pdReplyList(ReplyVO rvo);

	List<BreplyVO> brReplyList(BreplyVO bvo);

	int pdRelyListCnt(ReplyVO rvo);
	
	int brRelyListCnt(BreplyVO bvo);

	ReplyVO pdReplyDetail(ReplyVO rvo);

	void pdReplyDelete(ReplyVO rvo) throws Exception;

	BreplyVO brReplyDetail(BreplyVO bvo);
	
	void brReplyDelete(BreplyVO bvo) throws Exception;

}
