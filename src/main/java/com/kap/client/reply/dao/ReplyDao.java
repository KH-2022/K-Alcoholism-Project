package com.kap.client.reply.dao;

import java.util.List;

import com.kap.client.brewery.vo.BreweryVO;
import com.kap.client.myPage.vo.MyPageOrderVO;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.client.reserve.vo.ReserveVO;

public interface ReplyDao {

	public int replyInsert(ReplyVO rvo);
	
	public List<ReplyVO> replyList(ReplyVO rvo);
	
	public int replyUpdate(ReplyVO rvo);

	public int replyDelete(int pd_review_no);
	
	public ReplyVO replyUpdateForm(ReplyVO rvo);
	
	public int bReplyInsert(BreplyVO bvo);

	public List<BreplyVO> reserveList(BreplyVO bvo);

	public BreplyVO bReplyUpdateForm(BreplyVO bvo);

	public int bReplyUpdate(BreplyVO bvo);

	public int bReplyDelete(int br_review_no);

	public BreweryVO brReplyForm(BreweryVO bvo);

	public void reserveUpdate(ReserveVO rvo);

	public List<ReserveVO> reserveManage(ReserveVO rvo);

	public List<MyPageOrderVO> orderManage(MyPageOrderVO ovo);

	public MyPageOrderVO pdReplyForm(MyPageOrderVO ovo);

	public void orderdetailUpdate(MyPageOrderVO ovo);
	
}
