package com.kap.client.login.service;

import com.kap.admin.member.vo.MemberVO;

public interface LoginService {

	MemberVO loginProcess(MemberVO login);

}