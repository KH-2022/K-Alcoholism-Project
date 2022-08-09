package com.kap.client.qna.dao;

import java.util.List;

import com.kap.client.qna.vo.QnaVO;

public interface QnaDao {
	
	public List<QnaVO> qnaList(QnaVO qvo);

}
