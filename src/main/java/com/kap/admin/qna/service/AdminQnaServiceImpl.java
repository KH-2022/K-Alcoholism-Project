package com.kap.admin.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.qna.dao.QnaDao;
import com.kap.client.qna.vo.QnaVO;

import lombok.Setter;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	@Setter(onMethod_ = @Autowired)
	private QnaDao qnaDao;
	
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> aList = null;
		aList = qnaDao.qnaList(qvo);
		return aList;
	}
	
	@Override
	public int qnaListCnt(QnaVO qvo) {
		int countNum = 0;
		countNum = qnaDao.qnaListCnt(qvo);
		return countNum;
	}
	
	// 글상세 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;

		detail = qnaDao.qnaDetail(qvo);
		if(detail != null) {
			detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}
}
