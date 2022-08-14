package com.kap.client.qna.dao;

import java.util.List;

import com.kap.client.qna.vo.QnaVO;

public interface QnaDao {
	
	public List<QnaVO> qnaList(QnaVO qvo);
	public int qnaListCnt(QnaVO qvo);
	public QnaVO qnaDetail(QnaVO qvo);
	public void readCntUpdate(QnaVO qvo);
	public int qnaInsert(QnaVO qvo);
	public int qnaDelete(int qna_no);
	public int qnaUpdate(QnaVO qvo);
}
