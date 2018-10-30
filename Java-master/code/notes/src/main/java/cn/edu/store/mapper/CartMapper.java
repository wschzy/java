package cn.edu.store.mapper;

import java.util.List;

import cn.edu.store.bean.Cart;

public interface CartMapper {

	void add(Cart cart);

	List<Cart> getCartList(Integer uid);
}
