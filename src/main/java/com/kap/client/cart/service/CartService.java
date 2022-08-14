package com.kap.client.cart.service;

import java.util.List;

import com.kap.client.cart.vo.CartVO;

public interface CartService {

	public int insertCart(CartVO cvo);

	public int updateCart(CartVO cvo);
	
	public int deleteCart(CartVO cvo);

	public List<CartVO> cartList(CartVO cvo);

}
