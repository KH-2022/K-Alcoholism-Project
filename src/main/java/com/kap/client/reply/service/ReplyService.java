package com.kap.client.reply.service;

import java.util.List;

import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;

public interface ReplyService {

	public int replyInsert(ReplyVO rvo) throws Exception;

	public int bReplyInsert(BreplyVO vvo) throws Exception ;
	
	public List<ReplyVO> replyList(ReplyVO rvo);

	public List<BreplyVO> reserveList(BreplyVO vvo);

	public int replyUpdate(ReplyVO rvo) throws Exception;

	public int replyDelete(ReplyVO rvo) throws Exception;

	public ReplyVO replyUpdateForm(ReplyVO rvo);

	public BreplyVO bReplyUpdateForm(BreplyVO vvo);

	public int bReplyUpdate(BreplyVO vvo) throws Exception;

	public int bReplyDelete(BreplyVO vvo) throws Exception;

}
