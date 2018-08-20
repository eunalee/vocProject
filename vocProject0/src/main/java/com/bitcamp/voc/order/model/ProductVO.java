package com.bitcamp.voc.order.model;

public class ProductVO {
	private int productKey;
	private int orderNumber;
	private int productQuantity;
	private String productName;
	private int productPrice;
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
	public int getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}
	public String getProductOption() {
		return productOption;
	}
	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}
	
	@Override
	public String toString() {
		return "productVO [productKey=" + productKey + ", productQuantity=" + productQuantity + ", productName="
				+ productName + ", productPrice=" + productPrice + ", option=" + productOption + "]";
	}
	
}
