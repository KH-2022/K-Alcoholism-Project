package com.kap.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.product.dao.ProductDao;
import com.kap.client.product.vo.ProductVO;
import com.kap.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class AdminProductServiceImpl implements AdminProductService {

	@Setter(onMethod_ = @Autowired)
	private ProductDao productDao;
	
	//목록조회
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> aList = null;
		aList = productDao.productList(pvo);
		return aList;
	}
	
	//전체 레코드 수 표현
	@Override
	public int productListCnt(ProductVO pvo) {
		int countNum = 0;
		countNum = productDao.productListCnt(pvo);
		return countNum;
	}
	
	//입력
	@Override
	public int productInsert(ProductVO pvo) throws Exception {
		int result = 0;

		if(pvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(pvo.getFile(), "product");
			pvo.setPd_image(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName); 
			pvo.setPd_thumb(thumbName);
		}
		result = productDao.productInsert(pvo);
		return result;
	}
	
	//상세조회
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
		detail = productDao.productDetail(pvo);
		if (detail != null) {
			detail.setPd_info(detail.getPd_info().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}
	
	//글수정폼구현
	@Override
	public ProductVO updateForm(ProductVO pvo) {
		ProductVO updateData = null;
		updateData = productDao.productDetail(pvo);
		return updateData;
	}
	
	//글수정구현
	@Override
	public int productUpdate(ProductVO pvo) throws Exception {
		int result = 0;
		if(!pvo.getFile().isEmpty()) {
			if(!pvo.getPd_image().isEmpty()) {
				FileUploadUtil.fileDelete(pvo.getPd_image());
				FileUploadUtil.fileDelete(pvo.getPd_thumb());
			}
			
			String fileName = FileUploadUtil.fileUpload(pvo.getFile(), "product");
			pvo.setPd_image(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName);
			pvo.setPd_thumb(thumbName);
		}
		result = productDao.productUpdate(pvo);
		return result;
	}
	
	//글삭제구현
	@Override
	public int productDelete(ProductVO pvo) throws Exception {
		int result = 0;
		if(!pvo.getPd_image().isEmpty()) {
			FileUploadUtil.fileDelete(pvo.getPd_image());
			FileUploadUtil.fileDelete(pvo.getPd_thumb());
		}
		result = productDao.productDelete(pvo.getPd_id());
		return result;
	}
}
