package com.kap.admin.member.service;

import java.util.List;

import com.kap.admin.member.vo.MemberVO;

public interface AdminMemberService {

	int memberListCnt(MemberVO mvo);

	List<MemberVO> memberList(MemberVO mvo);

	void memberDelete(MemberVO mvo);

}
