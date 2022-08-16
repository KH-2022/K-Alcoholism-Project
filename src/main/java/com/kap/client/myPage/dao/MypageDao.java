package com.kap.client.myPage.dao;

import java.util.List;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.myPage.vo.MyPageOrderVO;
import com.kap.client.qna.vo.QnaVO;
import com.kap.client.reserve.vo.ReserveVO;

public interface MypageDao {

	int userUpdate(MemberVO mvo);

	MemberVO getUser(MemberVO mvo);

	int userWithdrawal(MemberVO mvo) throws Exception;

	int editAdd(MemberVO mvo);

	List<QnaVO> qnaList(QnaVO qvo);
	
	List<ReserveVO> reserveList(ReserveVO rvo);

	int reserveListCnt(ReserveVO rvo);

	List<MyPageOrderVO> orderList(MyPageOrderVO ovo);

	int orderListCnt(MyPageOrderVO ovo);

	List<MyPageOrderVO> orderCount(MyPageOrderVO ovo);

	List<MyPageOrderVO> orderDetail(MyPageOrderVO ovo);

	List<Integer> getOrderNo(MyPageOrderVO ovo);


}