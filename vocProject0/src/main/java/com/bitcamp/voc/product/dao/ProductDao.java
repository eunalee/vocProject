package com.bitcamp.voc.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bitcamp.voc.product.model.ProductVO;

public interface ProductDao {
	public int insert(ProductVO product);
	
	public int selectCount();
	
	public List<ProductVO> selectAll(@Param("firstRow") int firstRow, @Param("endRow") int endRow);
	
	public int selectCountByCategory(String category);
	
	public List<ProductVO> selectByCategory(@Param("category") String category, @Param("firstRow") int firstRow, @Param("endRow") int endRow);
	
	public int selectCountSearch(String category, String regDateFrom, String regDateTo);
	
	public List<ProductVO> selectSearch(@Param("category") String category, @Param("regDateFrom") String regDateFrom, @Param("regDateTo") String regDateTo);
	
	public ProductVO selectById(int id);
	
	public int update(ProductVO product);
	
	public int delete(int id);
}