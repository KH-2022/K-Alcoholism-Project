package com.kap.admin.brewery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.brewery.dao.BreweryDao;
import com.kap.client.brewery.vo.BreweryVO;
import com.kap.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class AdminBreweryServiceImpl implements AdminBreweryService {

	@Setter(onMethod_ = @Autowired)
	private BreweryDao breweryDao;
	
	//글목록구현
	@Override
	public List<BreweryVO> breweryList(BreweryVO bvo) {
		List<BreweryVO> aList = null;
		aList = breweryDao.breweryList(bvo);
		return aList;
	}
	
	//글입력구현
	@Override
	public int breweryInsert(BreweryVO bvo) throws Exception{
		int result = 0;
		if(bvo.getFile().getSize() > 0 ) {
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "brewery");
			bvo.setBr_image(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setBr_thumb(thumbName);
		}
		result = breweryDao.breweryInsert(bvo);
		return result;
	}	
	//글상세구현
	@Override
	public BreweryVO breweryDetail(BreweryVO bvo) {
		BreweryVO detail = null;
		
		detail = breweryDao.breweryDetail(bvo);
		
		return detail;
	}
	
	//글수정폼구현
	@Override
	public BreweryVO updateForm(BreweryVO bvo) {
		BreweryVO updateData = null;
		updateData = breweryDao.breweryDetail(bvo);
		return updateData;
	}
	
	//글수정 구현
	@Override
	public int breweryUpdate(BreweryVO bvo) throws Exception{
		int result = 0;
		if(!bvo.getFile().isEmpty()) {
			if(!bvo.getBr_image().isEmpty()) {
				FileUploadUtil.fileDelete(bvo.getBr_image());
				FileUploadUtil.fileDelete(bvo.getBr_thumb());
			}
			
			String fileName = FileUploadUtil.fileUpload(bvo.getFile(), "brewery");
			bvo.setBr_image(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			bvo.setBr_thumb(thumbName);
		}
		result = breweryDao.breweryUpdate(bvo);
		return result;
	}
	
	//글삭제구현
	@Override
	public int breweryDelete(BreweryVO bvo) throws Exception{
		int result = 0;
		if(!bvo.getBr_image().isEmpty()) {
			FileUploadUtil.fileDelete(bvo.getBr_image());
			FileUploadUtil.fileDelete(bvo.getBr_thumb());
		}
		result = breweryDao.breweryDelete(bvo.getBr_id());
		return result;
	}

	
	

	


}