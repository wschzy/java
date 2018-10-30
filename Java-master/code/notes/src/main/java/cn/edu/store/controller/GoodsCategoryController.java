package cn.edu.store.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.store.bean.GoodsCategory;
import cn.edu.store.service.GoodsCategoryService;

@Controller
@RequestMapping("/goods_category")
public class GoodsCategoryController {

	@Resource
	private GoodsCategoryService goodsCategoryService;
	
	@SuppressWarnings("deprecation")
	@RequestMapping("/list.do")
	public String showGoodsCategoryList(Integer page, ModelMap modelMap) {
		List<GoodsCategory> data;
		if (page == null || page < 0) {
			page = 1;
		}
		data = goodsCategoryService.getGoodsCategoryList(page);
		modelMap.addAttribute("data", data);
		return "goods_category_list";
	}

}
