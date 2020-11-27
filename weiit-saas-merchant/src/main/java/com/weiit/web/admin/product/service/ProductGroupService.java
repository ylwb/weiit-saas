package com.weiit.web.admin.product.service;

import com.weiit.core.entity.E;
import com.weiit.core.entity.FormMap;
import com.weiit.core.service.BaseService;

import java.util.List;


/**
 * 商品分组Service
 * @author hezhiying
 * @date 2017年2月14日 上午2:12:48
 * @version 1.0
 * @company http://www.wei-it.com
 */
public interface ProductGroupService extends BaseService {
	List<E> selectDetailList(FormMap param);
	
	/**
	 * 插入 
	 */
	void insertDetail(FormMap param);
	
	/**
	 * 删除 
	 */ 
	void removeDetail(FormMap param);


	List<E> productGroupList(FormMap param);


	List<E> getProductByGroupId(FormMap param);


}
