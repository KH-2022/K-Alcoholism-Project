package com.kap.client.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.myPage.dao.MypageDao;
import com.kap.client.signUp.vo.SignUpVO;

import lombok.Setter;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Setter(onMethod_ = @Autowired)
	private MypageDao mypageDao;
	
	@Override
	public int userUpdate(SignUpVO svo) throws Exception {
		int result = 0;
		result = mypageDao.userUpdate(svo);
		return result;
	}

	@Override
	public SignUpVO getUser(SignUpVO svo) {
		return mypageDao.getUser(svo);
	}

	@Override
	public int userWithdrawal(SignUpVO svo) throws Exception {
			// 새 비밀번호 생성
			int index = 0;
			char[] charSet = new char[] {
	                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
	                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
	                '!', '@', '#', '$', '%', '^', '&' };
			StringBuffer pw = new StringBuffer();
			for (int i=0; i<12; i++) {
				index = (int)(charSet.length * Math.random());
				pw.append(charSet[index]);
			}
			String user_pwd = pw.toString();
			
			// 비밀번호 변경
			svo.setUser_pwd(user_pwd);
			
			// 새 아이디 생성
			index = 0;
			char[] charIdSet = new char[] {
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
					};
			StringBuffer id = new StringBuffer();
			for (int i=0; i<12; i++) {
				index = (int)(charIdSet.length * Math.random());
				id.append(charIdSet[index]);
			}
			String user_id = id.toString();
			
			// 아이디 변경
			svo.setUser_id(user_id);
			
			
		return mypageDao.userWithdrawal(svo);
	}

	@Override
	public int editAdd(SignUpVO svo) {
		return mypageDao.editAdd(svo);
	}

}
