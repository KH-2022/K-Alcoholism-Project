package com.kap.client.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.myPage.dao.MypageDao;
import com.kap.client.myPage.vo.MyPageOrderVO;
import com.kap.client.qna.vo.QnaVO;
import com.kap.client.reserve.vo.ReserveVO;

import lombok.Setter;

@Service
public class MypageServiceImpl implements MypageService {
	@Setter(onMethod_ = @Autowired)
	MypageDao mypageDao;
	
	@Override
	public int userUpdate(MemberVO mvo) throws Exception {
		int result = 0;
		result = mypageDao.userUpdate(mvo);
		return result;
		
	}

	@Override
	public MemberVO getUser(MemberVO mvo) {
		return mypageDao.getUser(mvo);
	}

	@Override
	public int userWithdrawal(MemberVO mvo) throws Exception {
			// 새 비밀번호 생성
			int index = 0;
			char[] charSet = new char[] {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	                '!', '@', '#', '$', '%', '^', '&' };
			StringBuffer pw = new StringBuffer();
			for (int i=0; i<12; i++) {
				index = (int)(charSet.length * Math.random());
				pw.append(charSet[index]);
			}
			String user_pwd = pw.toString();
			
			// 비밀번호 변경
			mvo.setUser_pwd(user_pwd);
			
			// 새 아이디 생성
			index = 0;
			char[] charIdSet = new char[] {
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
					'!', '@', '#', '$', '%', '^', '&'
					};
			StringBuffer id = new StringBuffer();
			for (int i=0; i<12; i++) {
				index = (int)(charIdSet.length * Math.random());
				id.append(charIdSet[index]);
			}
			String user_id = id.toString();
			
			// 아이디 변경
			mvo.setUser_id(user_id);
			
			
		return mypageDao.userWithdrawal(mvo);
	}

	@Override
	public int editAdd(MemberVO mvo) {
		return mypageDao.editAdd(mvo);
	}

	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> qnaList = mypageDao.qnaList(qvo);
		return qnaList;
	}
	
	@Override
	public List<ReserveVO> reserveList(ReserveVO rvo) {
		List<ReserveVO> reserveList = mypageDao.reserveList(rvo);
		return reserveList;
	}

	@Override
	public int reserveListCnt(ReserveVO rvo) {
		int countNum = mypageDao.reserveListCnt(rvo);
		return countNum;
	}

	@Override
	public List<MyPageOrderVO> orderList(MyPageOrderVO ovo) {
		List<MyPageOrderVO> orderList = mypageDao.orderList(ovo);
		return orderList;
	}

	@Override
	public int orderListCnt(MyPageOrderVO ovo) {
		int countNum = mypageDao.orderListCnt(ovo);
		return countNum;
	}

	@Override
	public List<MyPageOrderVO> orderCount(MyPageOrderVO ovo) {
		List<MyPageOrderVO> orderCount = mypageDao.orderCount(ovo);
		return orderCount;
	}

	@Override
	public List<MyPageOrderVO> orderDetail(MyPageOrderVO ovo) {
		List<MyPageOrderVO> orderDetail = mypageDao.orderDetail(ovo);
		return orderDetail;
	}

	@Override
	public List<Integer> getOrderNo(MyPageOrderVO ovo) {
		List<Integer> getOrderNo = mypageDao.getOrderNo(ovo);
		return getOrderNo;
	}

}