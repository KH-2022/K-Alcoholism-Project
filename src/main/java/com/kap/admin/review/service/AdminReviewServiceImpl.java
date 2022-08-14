package com.kap.admin.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.admin.review.dao.AdminReviewDao;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminReviewDao adminReviewDao;
	
	@Override
	public List<ReplyVO> pdReplyList(ReplyVO rvo) {
		List<ReplyVO> pdReplylist = null;
		pdReplylist = adminReviewDao.pdReplyList(rvo);
		return pdReplylist;
	}

	@Override
	public List<BreplyVO> brReplyList(BreplyVO bvo) {
		List<BreplyVO> brReplyList = null;
		brReplyList = adminReviewDao.brReplyList(bvo);
		return brReplyList;
	}

	@Override
	public int pdRelyListCnt(ReplyVO rvo) {
		int pdReplyListCnt = adminReviewDao.pdReplyListCnt(rvo);
		return pdReplyListCnt;
	}

	@Override
	public int brRelyListCnt(BreplyVO bvo) {
		int brReplyListCnt = adminReviewDao.brReplyListCnt(bvo);
		return brReplyListCnt;
	}

	@Override
	public ReplyVO pdReplyDetail(ReplyVO rvo) {
		ReplyVO detail = adminReviewDao.pdReplyDetail(rvo);
		
		return detail;
	}

	@Override
	public void pdReplyDelete(ReplyVO rvo) throws Exception{
		if(!rvo.getPd_review_file().isEmpty()) {
			FileUploadUtil.fileDelete(rvo.getPd_review_file());
			FileUploadUtil.fileDelete(rvo.getPd_review_thumb());
		}
		
		adminReviewDao.pdReplyDelete(rvo.getPd_review_no());
	}

	@Override
	public BreplyVO brReplyDetail(BreplyVO bvo) {
		BreplyVO detail = adminReviewDao.brReplyDetail(bvo);
		
		return detail;
	}

	@Override
	public void brReplyDelete(BreplyVO bvo) throws Exception {
		if(!bvo.getBr_review_file().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getBr_review_file());
			FileUploadUtil.fileDelete(bvo.getBr_review_thumb());
		}
		
		adminReviewDao.brReplyDelete(bvo.getBr_review_no());
		
	}

}
