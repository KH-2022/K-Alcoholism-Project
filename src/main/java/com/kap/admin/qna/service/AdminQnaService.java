package com.kap.admin.qna.service;

import java.util.List;

import com.kap.client.qna.vo.QnaVO;

public interface AdminQnaService {
	public List<QnaVO> qnaList(QnaVO qvo);
	public int qnaListCnt(QnaVO qvo);
	public QnaVO qnaDetail(QnaVO qvo);
}
