package com.kap.client.reply.dao;

import java.util.List;

import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;

public interface ReplyDao {

	public int replyInsert(ReplyVO rvo);

	public int bReplyInsert(BreplyVO vvo);
	
	public List<ReplyVO> replyList(ReplyVO rvo);

	public List<BreplyVO> reserveList(BreplyVO vvo);

	public int replyUpdate(ReplyVO rvo);

	public int replyDelete(int pd_review_no);

	public ReplyVO replyUpdateForm(ReplyVO rvo);

	public BreplyVO bReplyUpdateForm(BreplyVO vvo);

	public int bReplyUpdate(BreplyVO vvo);

	public int bReplyDelete(int br_review_no);

}
