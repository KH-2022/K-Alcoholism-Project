package com.kap.client.qnaReply.service;

import java.util.List;

import com.kap.client.qnaReply.vo.QnaReplyVO;

public interface QnaReplyService {
	public List<QnaReplyVO> qnaReplyList(Integer qna_no);
	public int qnaReplyInsert(QnaReplyVO qrvo);
	public int qnaReplyDelete(int qna_re_no);
	public int qnaReplyUpdate(QnaReplyVO qrvo);
}
