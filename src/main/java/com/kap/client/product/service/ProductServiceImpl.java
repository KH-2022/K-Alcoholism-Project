package com.kap.client.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kap.client.product.dao.ProductDao;
import com.kap.client.product.vo.ProductVO;

import lombok.Setter;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Setter(onMethod_ = @Autowired)
	private ProductDao productDao;

	//상품리스트 구현
	@Override
	public List<ProductVO> productList(ProductVO pvo) {
		List<ProductVO> list = null;
		list = productDao.productList(pvo);
		return list;
	}
	
	//전체 레코드 수 구현
	@Override
	public int productListCnt(ProductVO pvo) {
		int count = 0;
		count = productDao.productListCnt(pvo);
		return count;
	}
	
	//상품리스트 상세 구현
	@Override
	public ProductVO productDetail(ProductVO pvo) {
		ProductVO detail = null;
		detail = productDao.productDetail(pvo);
		if (detail != null) {
			detail.setPd_info(detail.getPd_info().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}
	
}