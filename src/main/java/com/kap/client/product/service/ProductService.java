package com.kap.client.product.service;

import java.util.List;

import com.kap.client.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productList(ProductVO pvo);
	
	public ProductVO productDetail(ProductVO pvo);
	
	public int productListCnt(ProductVO pvo); 
}
