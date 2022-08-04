package com.kap.admin.product.service;

import java.util.List;

import com.kap.client.product.vo.ProductVO;

public interface AdminProductService {

	public List<ProductVO> productList(ProductVO pvo);

	public int productInsert(ProductVO pvo);

	public ProductVO productDetail(ProductVO pvo);

}
