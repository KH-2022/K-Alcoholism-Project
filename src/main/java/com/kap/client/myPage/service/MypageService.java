package com.kap.client.myPage.service;

import com.kap.client.signUp.vo.SignUpVO;

public interface MypageService {

	int userUpdate(SignUpVO svo) throws Exception;

	SignUpVO getUser(SignUpVO svo);

	int userWithdrawal(SignUpVO svo) throws Exception;

	int editAdd(SignUpVO svo);

}
