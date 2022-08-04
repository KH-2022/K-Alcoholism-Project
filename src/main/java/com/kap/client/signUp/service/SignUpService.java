package com.kap.client.signUp.service;

import com.kap.client.signUp.vo.SignUpVO;

public interface SignUpService {

	int signUpInsert(SignUpVO svo);

	int idCheck(SignUpVO svo);

	int emailCheck(SignUpVO svo);
	

}
