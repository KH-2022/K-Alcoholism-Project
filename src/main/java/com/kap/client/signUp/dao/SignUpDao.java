package com.kap.client.signUp.dao;

import com.kap.admin.member.vo.MemberVO;

public interface SignUpDao {

	int idCheck(MemberVO mvo);

	int signUpInsert(MemberVO mvo);

	int emailCheck(MemberVO mvo);
}
