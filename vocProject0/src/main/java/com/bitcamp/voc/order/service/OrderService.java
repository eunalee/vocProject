package com.bitcamp.voc.order.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bitcamp.voc.order.dao.OrderDAOInterface;
import com.bitcamp.voc.order.model.OrderItem;
import com.bitcamp.voc.order.model.OrderVO;
import com.bitcamp.voc.order.model.ProductVO;
import com.bitcamp.voc.product.model.CartVO;

public class OrderService {

	@Autowired
	SqlSessionTemplate sessionTemplate;
	
	OrderDAOInterface orderDAO;
	
	//페이지 네이션 갯수
	private final int PERPAGE_ORDERLIST = 10;

	public List<ProductVO> getCartList(String memberID) {
		
		// 장바구니에 담긴 상품들 아이디로 검색 하는 명령문
		
		// 장바구니 상품 리스트화
		List<ProductVO> productList = new ArrayList<ProductVO>();

		/// 간이처리
		ProductVO productVO1 = new ProductVO();
		ProductVO productVO2 = new ProductVO();
		
		productVO1.setProductKey(1);
		productVO1.setProductQuantity(2);
		productVO1.setProductPrice(20000);
		productVO1.setProductOption("XL");
		productVO1.setProductName("T-Shirt");
		
		productVO2.setProductKey(2);
		productVO2.setProductQuantity(1);
		productVO2.setProductPrice(20000);
		productVO2.setProductOption("XL");
		productVO2.setProductName("Jean");

		productList.add(productVO1);
		productList.add(productVO2);
		
		return productList;
		/* return otherInterface.selectCart(memberNumber); */
	}
	
	public int insertOrder(OrderVO orderVO) {
		orderDAO = sessionTemplate.getMapper(OrderDAOInterface.class);
		return orderDAO.insertOrder(orderVO);
	}
	
	public int insertOrderItems(List<ProductVO> productList) {
		orderDAO = sessionTemplate.getMapper(OrderDAOInterface.class);
		int count = 0;
		for(ProductVO productvo : productList) {
			count += orderDAO.insertOrderItems(productvo);
		}
		return count;
	}
	
	//모든 주문 선택
	public List<OrderVO> selectOrderItems(int perPage, int nowPage){
		orderDAO = sessionTemplate.getMapper(OrderDAOInterface.class);
		List<OrderVO> orderList = orderDAO.selectOrderItems(perPage, nowPage);
		if(orderList != null)orderList = inputOrderItem(orderList); 
		return orderList;
	}
	
	//주문 분야별 선택
	public List<OrderVO> selectOrderItems(Map<String, Object> orderSelect){
		orderDAO = sessionTemplate.getMapper(OrderDAOInterface.class);
		List<OrderVO> orderList = orderDAO.selectOrderItemsBy(orderSelect);
		if(orderList != null)orderList = inputOrderItem(orderList); 
		return orderList;
	}
	
	public OrderVO selectOrderByNumber(int orderNumber) {
		orderDAO = sessionTemplate.getMapper(OrderDAOInterface.class);
		OrderVO orderVO = orderDAO.selectOrderByNumber(orderNumber);
		orderVO.setOrderItem(new OrderItem());
		orderVO.getOrderItem().setOrderList(orderDAO.selectOrderItemsByOrderNumber(orderVO.getOrderNumber()));
		return orderVO;
	}
	
	public void updateOrderStatus(Map<String, Object> orderConfig) {
		orderDAO = sessionTemplate.getMapper(OrderDAOInterface.class);
		orderDAO.updateOrderStatus(orderConfig);
	}
	
	//환불처리 요청
	public int updateOrderRefund(int orderNumber) {
		orderDAO = sessionTemplate.getMapper(OrderDAOInterface.class);
		return orderDAO.updateOrderRefund(orderNumber);
	}
	
	//주문 필드에 주문 상품의 정보를 넣어주는 메서드
	private List<OrderVO> inputOrderItem(List<OrderVO> orderList) {
		for(OrderVO orderVO : orderList) {
			orderVO.setOrderItem(new OrderItem());
			orderVO.getOrderItem().setOrderList(orderDAO.selectOrderItemsByOrderNumber(orderVO.getOrderNumber()));
		}
		return orderList;
	}

	public int selectOrderCount(Map<String, Object> orderSelect) {
		return orderDAO.selectOrderCount(orderSelect);
	}
	

}
