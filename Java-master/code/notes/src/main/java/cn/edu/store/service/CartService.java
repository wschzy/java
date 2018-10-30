package cn.edu.store.service;

import java.util.List;

import cn.edu.store.bean.Cart;

public interface CartService {

	void add(Cart cart);
	
	List<Cart> getCartList(Integer uid);
}
