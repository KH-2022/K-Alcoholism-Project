package com.kap.client.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.qna.dao.QnaDao;
import com.kap.client.qna.vo.QnaVO;
import com.kap.client.qnaReply.dao.QnaReplyDao;
import com.kap.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Setter(onMethod_ = @Autowired)
	private QnaDao qnaDao;
	
	@Setter(onMethod_ =@Autowired)
	private QnaReplyDao qnaReplyDao;
	
	// 글목록 구현
	@Override
	public List<QnaVO> qnaList(QnaVO qvo) {
		List<QnaVO> list = null;
		list = qnaDao.qnaList(qvo);
		return list;
	}
	
	// 전체 레코드 수 구현
	@Override
	public int qnaListCnt(QnaVO qvo) {
		return qnaDao.qnaListCnt(qvo);
	}
	
	// 글상세 구현
	@Override
	public QnaVO qnaDetail(QnaVO qvo) {
		QnaVO detail = null;
		
		qnaDao.readCntUpdate(qvo);	// 조회수 증가 메서드 호출
		
		detail = qnaDao.qnaDetail(qvo);
		if(detail != null) {
			detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}
	
	// 글입력 구현
	@Override
	public int qnaInsert(QnaVO qvo) throws Exception {
		int result = 0;

		if(qvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "qna");
			qvo.setQna_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			qvo.setQna_thumb(thumbName);
		}
		result = qnaDao.qnaInsert(qvo);
		return result;
	}
	
	// 글수정 폼 구현
	@Override
	public QnaVO updateForm(QnaVO qvo) {
		QnaVO updateData = null;
		updateData = qnaDao.qnaDetail(qvo);
		return updateData;
	}
	
	// 글수정 구현
	@Override
	public int qnaUpdate(QnaVO qvo) throws Exception {
		int result = 0;
		if(!qvo.getFile().isEmpty()) {			
			if(!qvo.getQna_file().isEmpty()) {
				FileUploadUtil.fileDelete(qvo.getQna_file());
				FileUploadUtil.fileDelete(qvo.getQna_thumb());
			}
			
			String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "qna");
			qvo.setQna_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			qvo.setQna_thumb(thumbName);
		}
		result = qnaDao.qnaUpdate(qvo);
		return result;
	}
	
	/* 글삭제 구현 */
	@Override
	public int qnaDelete(QnaVO qvo) throws Exception {
		int result = 0;
		if(!qvo.getQna_file().isEmpty()) {
			FileUploadUtil.fileDelete(qvo.getQna_file());
			FileUploadUtil.fileDelete(qvo.getQna_thumb());
		}
		result = qnaDao.qnaDelete(qvo.getQna_no());
		return result;
	}
	
	/* 해당 게시물의 댓글 존재 여부 확인
	 * 댓글이 존재하면 댓글 수를 반환하고 존재하지 않으면 0을 반환 */
	@Override
	public int qnaReplycnt(int qna_no) {
		int result = 0;
		result = qnaReplyDao.qnaReplyCnt(qna_no);
		return result;
	}
}