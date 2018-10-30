package cn.edu.store.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.store.bean.ResponseResult;
import cn.edu.store.bean.dict.Area;
import cn.edu.store.bean.dict.City;
import cn.edu.store.bean.dict.Province;
import cn.edu.store.service.DictService;

@Controller
@RequestMapping("/dict")
public class DictController extends BaseController {

	@Resource
	private DictService dictService;

	@ResponseBody
	@RequestMapping("/get_province_list.do")
	public ResponseResult<List<Province>> getProvinceList() {
		List<Province> data = dictService.getProvinceList();

		ResponseResult<List<Province>> rr = new ResponseResult<List<Province>>();
		rr.setState(ResponseResult.STATE_OK);
		rr.setData(data);

		return rr;
	}

	@ResponseBody
	@RequestMapping("/get_city_list.do")
	public ResponseResult<List<City>> getCityList(String provinceCode) {
		List<City> data = dictService.getCityList(provinceCode);

		ResponseResult<List<City>> rr = new ResponseResult<List<City>>();
		rr.setState(ResponseResult.STATE_OK);
		rr.setData(data);

		return rr;
	}

	@ResponseBody
	@RequestMapping("/get_area_list.do")
	public ResponseResult<List<Area>> getAreaList(String cityCode) {
		List<Area> data = dictService.getAreaList(cityCode);

		ResponseResult<List<Area>> rr = new ResponseResult<List<Area>>();
		rr.setState(ResponseResult.STATE_OK);
		rr.setData(data);

		return rr;
	}

}
