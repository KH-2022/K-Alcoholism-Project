package com.kap.client.login.dao;

import com.kap.admin.member.vo.MemberVO;

public interface LoginDao {
	
	public MemberVO loginProcess(MemberVO login);

}