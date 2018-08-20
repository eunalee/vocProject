package com.bitcamp.voc.order.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class OrderItem {
	private List<ProductVO> orderList;

	public OrderItem() {
		super();
		this.orderList = new ArrayList<>();
	}

	public List<ProductVO> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<ProductVO> orderList) {
		this.orderList = orderList;
	}
	
	public void addOrderList(ProductVO productVO) {
		orderList.add(productVO);
	}
	
	public int getOrderCount() {
		return orderList.size();
	}
	
	public void setOrderNumber(int orderNumber) {
		for(ProductVO productVO : orderList) {
			productVO.setOrderNumber(orderNumber);
		}
	}

	@Override
	public String toString() {
		String string = "";
//		Iterator<ProductVO> itr = orderList.iterator();
//		int count = 0;
//		while(itr.hasNext()) {
//			ProductVO productVO = itr.next();
//			string += productVO.getProductKey() + " " + productVO.getProductQuantity() + "개";
//			count++;
//		}
//		if(string.length() > 14 || count != 1) {
//		//string = string.substring(0, 10) + "..";
//		}
//		string += " 총 "+ count + "종";
		return orderList.get(0).getProductName() + "포함 " +orderList.size() + "개";
	}
	
}
