package com.kap.client.signUp.service;

import com.kap.admin.member.vo.MemberVO;

public interface SignUpService {

	int signUpInsert(MemberVO mvo);

	int idCheck(MemberVO mvo);

	int emailCheck(MemberVO mvo);
	
}
