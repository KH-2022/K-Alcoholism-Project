package com.kap.client.reply.service;

import java.util.List;

import com.kap.client.brewery.vo.BreweryVO;
import com.kap.client.myPage.vo.MyPageOrderVO;
import com.kap.client.product.vo.ProductVO;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.client.reserve.vo.ReserveVO;

public interface ReplyService {

	public int replyInsert(ReplyVO rvo) throws Exception;
	
	public List<ReplyVO> replyList(ReplyVO rvo);
	
	public int replyUpdate(ReplyVO rvo) throws Exception;

	public int replyDelete(ReplyVO rvo) throws Exception;

	public ReplyVO replyUpdateForm(ReplyVO rvo);
	
	public int bReplyInsert(BreplyVO bvo) throws Exception;

	public List<BreplyVO> reserveList(BreplyVO bvo);

	public BreplyVO bReplyUpdateForm(BreplyVO bvo);

	public int bReplyUpdate(BreplyVO bvo) throws Exception;

	public int bReplyDelete(BreplyVO bvo) throws Exception;

	public BreweryVO brReplyForm(BreweryVO bvo);

	public void reserveUpdate(ReserveVO rvo) throws Exception;

	public List<ReserveVO> reserveManage(ReserveVO rvo);

	public List<MyPageOrderVO> orderManage(MyPageOrderVO ovo);

	public MyPageOrderVO pdReplyForm(MyPageOrderVO ovo);

	public void orderdetailUpdate(MyPageOrderVO ovo);

}
