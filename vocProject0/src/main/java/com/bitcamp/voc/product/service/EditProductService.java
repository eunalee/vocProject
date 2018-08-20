package com.bitcamp.voc.product.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.bitcamp.voc.product.dao.ProductDao;
import com.bitcamp.voc.product.model.ProductVO;

public class EditProductService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProductDao dao;
	
	@Transactional
	public int edit(HttpServletRequest request, ProductVO product) throws Exception {
		dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		String uploadURI = "/file/productPhoto";
		String dir = request.getSession().getServletContext().getRealPath(uploadURI);
		String productImg = product.getpImg().getOriginalFilename();
		
		if(!product.getpImg().isEmpty()) {
			product.getpImg().transferTo(new File(dir, productImg));
			product.setProductImg(productImg);
		}
		
		return dao.update(product);
	}
}