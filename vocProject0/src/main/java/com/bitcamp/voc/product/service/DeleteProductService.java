package com.bitcamp.voc.product.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.voc.product.dao.ProductDao;

public class DeleteProductService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProductDao dao;
	
	@Transactional
	public int delete(int id) {
		dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		return dao.delete(id);
	}
}