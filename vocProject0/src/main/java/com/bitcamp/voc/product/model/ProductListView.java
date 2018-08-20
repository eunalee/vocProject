package com.bitcamp.voc.product.model;

import java.util.List;

public class ProductListView {
	private int productTotalCount;
	private int currentPageNumber;
	private List<ProductVO> productList;
	private int pageTotalCount;
	private int productCountPerPage;
	private int firstRow;
	private int endRow;
	
	public ProductListView(int productTotalCount, int currentPageNumber, List<ProductVO> productList,
			int productCountPerPage, int firstRow, int endRow) {
		super();
		this.productTotalCount = productTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.productList = productList;
		this.productCountPerPage = productCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calculatePageTotalCount();
	}
	
	private void calculatePageTotalCount() {
		if(productTotalCount == 0)
			pageTotalCount = 0;
		
		else {
			pageTotalCount = productTotalCount/productCountPerPage;
			
			if(productTotalCount % productCountPerPage > 0)
				pageTotalCount++;
		}
	}

	public int getProductTotalCount() {
		return productTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<ProductVO> getProductList() {
		return productList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getProductCountPerPage() {
		return productCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}
	
	public boolean isEmpty() {
		return productTotalCount == 0;
	}
}