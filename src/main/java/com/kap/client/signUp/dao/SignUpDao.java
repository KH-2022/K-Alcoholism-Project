package com.kap.client.signUp.dao;

import com.kap.client.signUp.vo.SignUpVO;

public interface SignUpDao {

	int idCheck(SignUpVO svo);

	int signUpInsert(SignUpVO svo);

	int emailCheck(SignUpVO svo);
}
