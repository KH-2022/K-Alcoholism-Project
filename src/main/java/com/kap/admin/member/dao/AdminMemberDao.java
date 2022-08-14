package com.kap.admin.member.dao;

import java.util.List;

import com.kap.admin.member.vo.MemberVO;

public interface AdminMemberDao {

	List<MemberVO> memberList(MemberVO mvo);

	int memberListCnt(MemberVO mvo);

	void memberDelete(MemberVO mvo);

}
