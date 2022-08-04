package com.kap.client.signUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.signUp.dao.SignUpDao;
import com.kap.client.signUp.vo.SignUpVO;

import lombok.Setter;

@Service
public class SignUpServiceImpl implements SignUpService {
	
	@Setter(onMethod_= @Autowired)
	private SignUpDao signUpDao;
	
	@Override
	public int signUpInsert(SignUpVO svo) {
		return signUpDao.signUpInsert(svo);
	}

	@Override
	public int idCheck(SignUpVO svo) {
		return signUpDao.idCheck(svo);
	}

	@Override
	public int emailCheck(SignUpVO svo) {
		return signUpDao.emailCheck(svo);
	}

}
