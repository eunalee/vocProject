package com.bitcamp.voc.product.service;

import java.util.Collections;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.voc.product.dao.ProductDao;
import com.bitcamp.voc.product.model.ProductListView;
import com.bitcamp.voc.product.model.ProductVO;

public class GetProductListService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private ProductDao dao;
	
	private static final int PRODUCT_COUNT_PER_PAGE = 5;
	
	//전체 상품 목록 가져오기
	public ProductListView getProductList(int pageNumber) {
		dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		int currentPageNumber = 1;
		
		if(pageNumber > 0)
			currentPageNumber = pageNumber;
		
		int productTotalCount = dao.selectCount();
		List<ProductVO> productList = null;
		
		int firstRow = 0;
		int endRow = 0;
		
		if(productTotalCount > 0) {
			firstRow = (pageNumber - 1) * PRODUCT_COUNT_PER_PAGE;
			endRow = PRODUCT_COUNT_PER_PAGE;
			
			productList = dao.selectAll(firstRow, endRow);
		}
		
		else {
			currentPageNumber = 0;
			productList = Collections.emptyList();
		}
		
		return new ProductListView(productTotalCount, currentPageNumber, productList, PRODUCT_COUNT_PER_PAGE, firstRow, endRow);
	}
	
	//카테고리별 상품 목록 가져오기
	public ProductListView getProductListByCateogory(int pageNumber, String category) {
		dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		int currentPageNumber = 1;
		
		if(pageNumber > 0)
			currentPageNumber = pageNumber;
		
		int productTotalCount = dao.selectCountByCategory(category);
		List<ProductVO> productList = null;
		
		int firstRow = 0;
		int endRow = 0;
		
		if(productTotalCount > 0) {
			firstRow = (pageNumber - 1) * 10;
			endRow = 10;
			
			productList = dao.selectByCategory(category, firstRow, endRow);
		}
		
		else {
			currentPageNumber = 0;
			productList = Collections.emptyList();
		}
		
		return new ProductListView(productTotalCount, currentPageNumber, productList, 10, firstRow, endRow);
	}
	
	//카테고리별, 등록날짜별 상품 목록 가져오기
	public List<ProductVO> getProductListBySearch(String category, String regDateFrom, String regDateTo) {
		dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		return dao.selectSearch(category, regDateFrom, regDateTo);
	}
	
	//제품 ID별 상품 목록 가져오기
	public ProductVO getProductListById(int id) {
		dao = sqlSessionTemplate.getMapper(ProductDao.class);
		
		return dao.selectById(id);
	}
}