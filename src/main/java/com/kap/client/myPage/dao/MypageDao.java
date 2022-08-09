package com.kap.client.myPage.dao;

import com.kap.client.signUp.vo.SignUpVO;

public interface MypageDao {

	int userUpdate(SignUpVO svo);

	SignUpVO getUser(SignUpVO svo);

	int userWithdrawal(SignUpVO svo) throws Exception;

	int editAdd(SignUpVO svo);

}
