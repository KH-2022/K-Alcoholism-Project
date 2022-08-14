package com.kap.client.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kap.client.cart.dao.CartDao;
import com.kap.client.cart.vo.CartVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	
	private CartDao cartDao;

	@Override
	public int insertCart(CartVO cvo) {
		
		CartVO checkCart = cartDao.checkCart(cvo);
		
		if(checkCart != null) {
			return 2;
		}
		
		try {
			int result = 0;
			result = cartDao.insertCart(cvo);
			return result;
		}catch(Exception e) {
			return 0;
		}
	}

	@Override
	public int updateCart(CartVO cvo) {
		int result = 0;
		result = cartDao.updateCart(cvo);
		return result;
	}
	
	@Override
	public int deleteCart(CartVO cvo) {
		int result = 0;
		result = cartDao.deleteCart(cvo);
		return result;
	}

	@Override
	public List<CartVO> cartList(CartVO cvo) {
		List<CartVO> list= null;
		list=cartDao.cartList(cvo);
		return list;
	}

}
