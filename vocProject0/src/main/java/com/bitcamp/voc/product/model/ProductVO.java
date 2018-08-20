package com.bitcamp.voc.product.model;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int productId;
	private String productName;
	private String productCategory;
	private int productPrice;
	private int productQuantity;
	private String productMade;
	private int productSale;
	private MultipartFile pImg;
	private String productImg;
	private String productDesc;
	private String productRegDate;
	
	public ProductVO() { }
	
	public ProductVO(int productId, String productName, String productCategory, int productPrice, int productQuantity,
			String productMade, int productSale, String productImg, String productDesc, String productRegDate) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productCategory = productCategory;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
		this.productMade = productMade;
		this.productSale = productSale;
		this.productImg = productImg;
		this.productDesc = productDesc;
		this.productRegDate = productRegDate;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductMade() {
		return productMade;
	}

	public void setProductMade(String productMade) {
		this.productMade = productMade;
	}

	public int getProductSale() {
		return productSale;
	}

	public void setProductSale(int productSale) {
		this.productSale = productSale;
	}

	public MultipartFile getpImg() {
		return pImg;
	}

	public void setpImg(MultipartFile pImg) {
		this.pImg = pImg;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public String getProductRegDate() {
		return productRegDate;
	}

	public void setProductRegDate(String productRegDate) {
		this.productRegDate = productRegDate;
	}

	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", productName=" + productName + ", productCategory="
				+ productCategory + ", productPrice=" + productPrice + ", productQuantity=" + productQuantity
				+ ", productMade=" + productMade + ", productSale=" + productSale + ", productImg=" + productImg
				+ ", productDesc=" + productDesc + ", productRegDate=" + productRegDate + "]";
	}
}