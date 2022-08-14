package com.kap.client.myPage.service;

import java.util.List;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.myPage.vo.MyPageOrderVO;
import com.kap.client.qna.vo.QnaVO;
import com.kap.client.reserve.vo.ReserveVO;

public interface MypageService {

	int userUpdate(MemberVO mvo) throws Exception;

	MemberVO getUser(MemberVO mvo);

	int userWithdrawal(MemberVO mvo) throws Exception;

	int editAdd(MemberVO mvo);

	List<ReserveVO> reserveList(ReserveVO rvo);

	int reserveListCnt(ReserveVO rvo);

	List<QnaVO> qnaList(QnaVO qvo);

	List<MyPageOrderVO> orderList(MyPageOrderVO ovo);

	int orderListCnt(MyPageOrderVO ovo);

	int orderCount(MyPageOrderVO ovo);
	
}