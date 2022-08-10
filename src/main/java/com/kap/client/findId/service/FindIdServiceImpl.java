package com.kap.client.findId.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.findId.dao.FindIdDao;
import com.kap.client.findId.vo.FindIdVO;

import lombok.Setter;

@Service
public class FindIdServiceImpl implements FindIdService {
	
	@Setter(onMethod_= @Autowired)
	private FindIdDao findIdDao;
	
	@Override
	public String findId(FindIdVO fvo) {
		return findIdDao.findId(fvo);
	}

}