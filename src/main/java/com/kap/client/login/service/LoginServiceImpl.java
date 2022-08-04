package com.kap.client.login.service;

import org.springframework.stereotype.Service;

import com.kap.client.login.dao.LoginDao;
import com.kap.client.login.vo.LoginVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class LoginServiceImpl implements LoginService {

	private LoginDao loginDao;
	
	@Override
	public LoginVO loginProcess(LoginVO login) {
		LoginVO clientLogin = loginDao.loginProcess(login);
		
		return clientLogin;
	}

}
