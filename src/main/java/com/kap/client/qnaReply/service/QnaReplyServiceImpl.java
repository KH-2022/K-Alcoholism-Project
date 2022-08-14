package com.kap.client.qnaReply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.qnaReply.dao.QnaReplyDao;
import com.kap.client.qnaReply.vo.QnaReplyVO;

import lombok.Setter;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private QnaReplyDao qnaReplyDao;
	
	// 댓글목록 구현
	@Override
	public List<QnaReplyVO> qnaReplyList(Integer qna_no) {
		List<QnaReplyVO> list = null;
		list = qnaReplyDao.qnaReplyList(qna_no);
		return list;
	}

	// 댓글입력 구현
	@Override
	public int qnaReplyInsert(QnaReplyVO qrvo) {
		int result = 0;
		result = qnaReplyDao.qnaReplyInsert(qrvo);
		return result;
	}

	// 댓글수정 구현
	public int qnaReplyUpdate(QnaReplyVO qrvo) {
		int result = 0;
		result = qnaReplyDao.qnaReplyUpdate(qrvo);
		
		return result;
	}
	
	// 댓글삭제 구현
	@Override
	public int qnaReplyDelete(int qna_re_no) {
		int result = 0;
		result = qnaReplyDao.qnaReplyDelete(qna_re_no);
		return result;
	}
}
