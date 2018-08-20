package com.bitcamp.voc.product.model;

import java.util.List;

public class ProductList {
	private List<ProductVO> productList;
	
	public ProductList() { }

	public ProductList(List<ProductVO> productList) {
		super();
		this.productList = productList;
	}

	public List<ProductVO> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductVO> productList) {
		this.productList = productList;
	}
}