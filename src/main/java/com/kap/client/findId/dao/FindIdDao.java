package com.kap.client.findId.dao;

import com.kap.admin.member.vo.MemberVO;

public interface FindIdDao {
	
	public String findId(MemberVO mvo);

	public String idCheck(String user_id) throws Exception;

	public void updatePw(MemberVO mvo) throws Exception;

	public MemberVO readClient(String user_id) throws Exception;
}