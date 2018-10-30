package cn.edu.store.service;

import java.util.List;

import cn.edu.store.bean.GoodsCategory;

public interface GoodsCategoryService {

	@Deprecated
	List<GoodsCategory> getGoodsCategoryList(Integer page);

	GoodsCategory getGoodsCategroyById(Integer id);

	List<GoodsCategory> getGoodsCategoryListByParentId(Integer parentId, Integer offset, Integer pageCount);
}
