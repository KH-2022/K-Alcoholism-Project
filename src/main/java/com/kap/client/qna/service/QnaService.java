package com.kap.client.qna.service;

import java.util.List;

import com.kap.client.qna.vo.QnaVO;

public interface QnaService {
	
	public List<QnaVO> qnaList(QnaVO qvo);
	public int qnaListCnt(QnaVO qvo);
	public QnaVO qnaDetail(QnaVO qvo);
	public int qnaReplycnt(int qna_no);
	public int qnaInsert(QnaVO qvo) throws Exception;
	public int qnaDelete(QnaVO qvo) throws Exception;
	public int qnaUpdate(QnaVO qvo) throws Exception;
	public QnaVO updateForm(QnaVO qvo);
}
