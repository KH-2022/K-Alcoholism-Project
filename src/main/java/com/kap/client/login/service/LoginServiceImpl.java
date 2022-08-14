package com.kap.client.login.service;

import org.springframework.stereotype.Service;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.login.dao.LoginDao;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {

	private LoginDao loginDao;
	
	@Override
	public MemberVO loginProcess(MemberVO login) {
		MemberVO clientLogin = loginDao.loginProcess(login);
		
		return clientLogin;
	}

}