package com.bitcamp.voc.order.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

public class OrderVO {

	private int orderNumber;
	private String memberID;
	private int orderTotal;
	private int orderStatus;
	private Date orderDate;
	private String orderDelivery;
	private String orderAddress;
	private String orderPhone;
	private String orderOption;
	private String orderPay;
	private OrderItem orderItem;

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getMemberID() {
		return memberID;
	}

	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}

	public int getOrderTotal() {
		int total = 0;

		if (orderItem != null) {
			Iterator<ProductVO> itr = orderItem.getOrderList().iterator();
			while (itr.hasNext()) {
				ProductVO pvo = itr.next();
				total += pvo.getProductPrice() * pvo.getProductQuantity();
			}
		}
		
		return total;
	}

	public void setOrderTotal(int orderTotal) {
		this.orderTotal = orderTotal;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderDate() {
		return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(orderDate);
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderDelivery() {
		return orderDelivery;
	}

	public void setOrderDelivery(String orderDelivery) {
		this.orderDelivery = orderDelivery;
	}

	public String getOrderPay() {
		return orderPay;
	}

	public void setOrderPay(String orderPay) {
		this.orderPay = orderPay;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public String getOrderOption() {
		return orderOption;
	}

	public void setOrderOption(String orderOption) {
		this.orderOption = orderOption;
	}

	public OrderItem getOrderItem() {
		// if(orderItem != null) {
		// orderItem = new OrderItem();
		// }
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNumber=" + orderNumber + ", orderTotal=" + orderTotal + ", orderStatus=" + orderStatus
				+ ", orderDate=" + orderDate + ", orderDelivery=" + orderDelivery + ", orderAddress=" + orderAddress
				+ ", orderPhone=" + orderPhone + ", orderOption=" + orderOption + ", orderPay=" + orderPay + "]";
	}

}
