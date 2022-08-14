package com.kap.client.signUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.admin.member.vo.MemberVO;
import com.kap.client.signUp.dao.SignUpDao;

import lombok.Setter;

@Service
public class SignUpServiceImpl implements SignUpService {
	
	@Setter(onMethod_= @Autowired)
	private SignUpDao signUpDao;
	
	@Override
	public int signUpInsert(MemberVO mvo) {
		return signUpDao.signUpInsert(mvo);
	}

	@Override
	public int idCheck(MemberVO mvo) {
		return signUpDao.idCheck(mvo);
	}

	@Override
	public int emailCheck(MemberVO mvo) {
		return signUpDao.emailCheck(mvo);
	}

}
