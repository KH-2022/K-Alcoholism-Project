package com.kap.admin.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.product.dao.ProductDao;
import com.kap.client.product.vo.ProductVO;

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
	//입력
	@Override
	public int productInsert(ProductVO pvo) {
		int result = 0;
		result = productDao.productInsert(pvo);
		return result;
	}
	
	//상세조회
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail =null;
		
		detail = productDao.productDetail(pvo);
		return detail;
	}

	

}
