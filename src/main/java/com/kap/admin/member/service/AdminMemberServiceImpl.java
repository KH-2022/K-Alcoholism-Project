package com.kap.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.admin.member.dao.AdminMemberDao;
import com.kap.admin.member.vo.MemberVO;

import lombok.Setter;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMemberDao adminMemberDao;
	
	@Override
	public List<MemberVO> memberList(MemberVO mvo) {
		List<MemberVO> mlist = null;
		mlist = adminMemberDao.memberList(mvo);
		return mlist;
	}
	
	@Override
	public int memberListCnt(MemberVO mvo) {
		int countNum = 0;
		countNum = adminMemberDao.memberListCnt(mvo);
		return countNum;
	}

	@Override
	public void memberDelete(MemberVO mvo) {
		adminMemberDao.memberDelete(mvo);
	}

}
