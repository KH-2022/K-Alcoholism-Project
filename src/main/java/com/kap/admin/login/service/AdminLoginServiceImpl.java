package com.kap.admin.login.service;

import org.springframework.stereotype.Service;

import com.kap.admin.login.dao.AdminLoginDao;
import com.kap.admin.login.vo.AdminLoginVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminLoginServiceImpl implements AdminLoginService {
	
	private AdminLoginDao adminLoginDao;

	/* 관리자 로그인 */
	@Override
	public AdminLoginVO loginProcess(AdminLoginVO login) {
		AdminLoginVO adminLogin = adminLoginDao.loginProcess(login);
		return adminLogin;
	}
}