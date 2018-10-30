package cn.edu.store.service;

import java.util.List;

import cn.edu.store.bean.dict.Area;
import cn.edu.store.bean.dict.City;
import cn.edu.store.bean.dict.Province;

public interface DictService {

	List<Province> getProvinceList();

	List<City> getCityList(String provinceCode);

	List<Area> getAreaList(String cityCode);

	String getProvinceNameByCode(String provinceCode);

	String getCityNameByCode(String cityCode);

	String getAreaNameByCode(String areaCode);

}
