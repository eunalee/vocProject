package com.bitcamp.voc.product.model;

public class CartVO {
	private int productKey;
	private int productQuantity;
	private String productName;
	private int productPrice;
	private String productImg;
	private String productOption;
	
	public int getProductKey() {
		return productKey;
	}
	
	public void setProductKey(int productKey) {
		this.productKey = productKey;
	}
	
	public int getProductQuantity() {
		return productQuantity;
	}
	
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public int getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getProductOption() {
		return productOption;
	}
	
	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}

	@Override
	public String toString() {
		return "CartVO [productKey=" + productKey + ", productQuantity=" + productQuantity + ", productName="
				+ productName + ", productPrice=" + productPrice + ", productImg=" + productImg + ", productOption="
				+ productOption + "]";
	}
}