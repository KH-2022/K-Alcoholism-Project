package com.kap.admin.product.service;

import java.util.List;

import com.kap.client.product.vo.ProductVO;

public interface AdminProductService {
	
	public List<ProductVO> productList(ProductVO pvo);
	
	public int productInsert(ProductVO pvo) throws Exception;
	
	public ProductVO productDetail(ProductVO pvo);
	
	public int productListCnt(ProductVO pvo);
	
	public ProductVO updateForm(ProductVO pvo);
	
	public int productDelete(ProductVO pvo) throws Exception;
	
	public int productUpdate(ProductVO pvo) throws Exception;

}
