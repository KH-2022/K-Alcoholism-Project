package com.kap.client.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.qna.dao.QnaDao;
import com.kap.client.qna.vo.QnaVO;

import lombok.Setter;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Setter(onMethod_ = @Autowired)
	private QnaDao qnaDao;
	
	// 글목록 구현
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> list = null;
		list = qnaDao.qnaList(qvo);
		return list;
	}
}