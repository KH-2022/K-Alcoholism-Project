package com.kap.client.cart.dao;

import java.util.List;

import com.kap.client.cart.vo.CartVO;

public interface CartDao {

	public int insertCart(CartVO cvo);

	public int updateCart(CartVO cvo);
	
	public int deleteCart(CartVO cvo);

	public List<CartVO> cartList(CartVO cvo);

	public CartVO checkCart(CartVO cvo);

}
