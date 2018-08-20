package com.bitcamp.voc.order.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.voc.order.model.OrderVO;
import com.bitcamp.voc.order.model.ProductVO;

public interface OrderDAOInterface {

	//List<ProductVO> selectCart(int memberNumber);
	int insertOrder(OrderVO orderVO);
	int insertOrderItems(ProductVO productVO);
	
	List<OrderVO> selectOrderItems(int perPage, int nowPage);
	List<OrderVO> selectOrderItemsBy(Map<String, Object> orderSelect);
	
	OrderVO selectOrderByNumber(int orderNumber);
	List<ProductVO> selectOrderItemsByOrderNumber(int orderNumber);
	void updateOrderStatus(Map<String, Object> orderConfig);
	int updateOrderRefund(int orderNumber);
	
	//주문테이블의 전체 칼럼 갯수 구하기
	int selectOrderCount(Map<String, Object> orderSelect);
	
}
