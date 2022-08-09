package com.kap.client.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.reply.dao.ReplyDao;
import com.kap.client.reply.vo.BreplyVO;
import com.kap.client.reply.vo.ReplyVO;
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
	public int bReplyInsert(BreplyVO vvo) throws Exception {
		int result = 0;
		
		if(vvo.getFile().getSize() > 0)  { //MultipartFile File
			String fileName = FileUploadUtil.fileUpload(vvo.getFile(), "brReview");
			vvo.setBr_review_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			vvo.setBr_review_thumb(thumbName);;
		}
		
		result = replyDao.bReplyInsert(vvo);
		return result;
	}
	
	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		List<ReplyVO> list = replyDao.replyList(rvo);
		return list;
	}

	@Override
	public List<BreplyVO> reserveList(BreplyVO vvo) {
		List<BreplyVO> list = replyDao.reserveList(vvo);
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
	public BreplyVO bReplyUpdateForm(BreplyVO vvo) {
		BreplyVO updateBreply = replyDao.bReplyUpdateForm(vvo);
		return updateBreply;
	}

	@Override
	public int bReplyUpdate(BreplyVO vvo) throws Exception{
		int result = 0;
		if(!vvo.getFile().isEmpty()) {
			if(!vvo.getBr_review_file().isEmpty()) {
				FileUploadUtil.fileDelete(vvo.getBr_review_file());
				FileUploadUtil.fileDelete(vvo.getBr_review_thumb());
			}
			
			String fileName = FileUploadUtil.fileUpload(vvo.getFile(), "brReview");
			vvo.setBr_review_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			vvo.setBr_review_thumb(thumbName);
		}
		result = replyDao.bReplyUpdate(vvo);
		return result;
	}

	@Override
	public int bReplyDelete(BreplyVO vvo) throws Exception {
		int delete = 0;
		if(!vvo.getBr_review_file().isEmpty()) {
			FileUploadUtil.fileDelete(vvo.getBr_review_file());
			FileUploadUtil.fileDelete(vvo.getBr_review_thumb());
		}
		
		delete = replyDao.bReplyDelete(vvo.getBr_review_no());
		return delete;
	}

}
