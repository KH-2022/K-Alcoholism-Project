package com.kap.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.brewery.vo.BreweryVO;
import com.kap.client.myPage.vo.MyPageOrderVO;
import com.kap.client.product.vo.ProductVO;
import com.kap.client.reply.dao.ReplyDao;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
import com.kap.client.reserve.vo.ReserveVO;
import com.kap.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyDao replyDao;
	
	@Override
	public int replyInsert(ReplyVO rvo) throws Exception {
		int result = 0;
		
		if(rvo.getFile().getSize() > 0)  { //MultipartFile File
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "pdReview");
			rvo.setPd_review_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			rvo.setPd_review_thumb(thumbName);;
		}
		
		result = replyDao.replyInsert(rvo);
		return result;
	}
	
	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		List<ReplyVO> list = replyDao.replyList(rvo);
		return list;
	}
	
	@Override
	public ReplyVO replyUpdateForm(ReplyVO rvo) {
		ReplyVO updateReply = replyDao.replyUpdateForm(rvo);
		return updateReply;
	}
	
	@Override
	public int replyUpdate(ReplyVO rvo) throws Exception {
		int result = 0;
		if(!rvo.getFile().isEmpty()) {
			if(!rvo.getPd_review_file().isEmpty()) {
				FileUploadUtil.fileDelete(rvo.getPd_review_file());
				FileUploadUtil.fileDelete(rvo.getPd_review_thumb());
			}
			
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "pdReview");
			rvo.setPd_review_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			rvo.setPd_review_thumb(thumbName);
		}
		result = replyDao.replyUpdate(rvo);
		return result;
	}
	
	@Override
	public int replyDelete(ReplyVO rvo) throws Exception{
		int delete = 0;
		if(!rvo.getPd_review_file().isEmpty()) {
			FileUploadUtil.fileDelete(rvo.getPd_review_file());
			FileUploadUtil.fileDelete(rvo.getPd_review_thumb());
		}
		
		delete = replyDao.replyDelete(rvo.getPd_review_no());
		return delete;
	}
	
	@Override
	public int bReplyInsert(BreplyVO bvo) throws Exception {
		int result = 0;
		
		if(bvo.getFile().getSize() > 0)  { //MultipartFile File
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "brReview");
			bvo.setBr_review_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setBr_review_thumb(thumbName);;
		}
		
		result = replyDao.bReplyInsert(bvo);
		return result;
	}

	@Override
	public List<BreplyVO> reserveList(BreplyVO bvo) {
		List<BreplyVO> list = replyDao.reserveList(bvo);
		return list;
	}
	
	@Override
	public BreplyVO bReplyUpdateForm(BreplyVO bvo) {
		BreplyVO updateBreply = replyDao.bReplyUpdateForm(bvo);
		return updateBreply;
	}

	@Override
	public int bReplyUpdate(BreplyVO bvo) throws Exception{
		int result = 0;
		if(!bvo.getFile().isEmpty()) {
			if(!bvo.getBr_review_file().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getBr_review_file());
				FileUploadUtil.fileDelete(bvo.getBr_review_thumb());
			}
			
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "brReview");
			bvo.setBr_review_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setBr_review_thumb(thumbName);
		}
		result = replyDao.bReplyUpdate(bvo);
		return result;
	}

	@Override
	public int bReplyDelete(BreplyVO bvo) throws Exception {
		int delete = 0;
		if(!bvo.getBr_review_file().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getBr_review_file());
			FileUploadUtil.fileDelete(bvo.getBr_review_thumb());
		}
		
		delete = replyDao.bReplyDelete(bvo.getBr_review_no());
		return delete;
	}

	@Override
	public BreweryVO brReplyForm(BreweryVO bvo) {
		BreweryVO brReplyForm = replyDao.brReplyForm(bvo);
		return brReplyForm;
	}

	@Override
	public void reserveUpdate(ReserveVO rvo) throws Exception {
		replyDao.reserveUpdate(rvo);
	}

	@Override
	public List<ReserveVO> reserveManage(ReserveVO rvo) {
		List<ReserveVO> reserveManage = replyDao.reserveManage(rvo);
		return reserveManage;
	}

	@Override
	public List<MyPageOrderVO> orderManage(MyPageOrderVO ovo) {
		List<MyPageOrderVO> orderManage = replyDao.orderManage(ovo);
		return orderManage;
	}

	@Override
	public MyPageOrderVO pdReplyForm(MyPageOrderVO ovo) {
		MyPageOrderVO pdReplyForm = replyDao.pdReplyForm(ovo);
		return pdReplyForm;
	}

	@Override
	public void orderdetailUpdate(MyPageOrderVO ovo) {
		replyDao.orderdetailUpdate(ovo);
		
	}

}
