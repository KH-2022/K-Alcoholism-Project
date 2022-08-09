package com.kap.client.product.dao;

import java.util.List;

import com.kap.client.product.vo.ProductVO;

public interface ProductDao {
	
	public List<ProductVO> productList(ProductVO pvo);
	
	public ProductVO productDetail(ProductVO pvo);
	
	public int productInsert(ProductVO pvo);
	
	public int productListCnt(ProductVO pvo);
	
	public int productUpdate(ProductVO pvo);
	
	public int productDelete(int pd_id);
		
}
