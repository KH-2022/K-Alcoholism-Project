package com.kap.client.findId.service;

import javax.servlet.http.HttpServletResponse;

import com.kap.admin.member.vo.MemberVO;

public interface FindIdService {

	public String findId(MemberVO mvo);
	
	public void sendEmail(MemberVO mvo, String div);

	public void findPw(HttpServletResponse response, MemberVO mvo) throws Exception;
}