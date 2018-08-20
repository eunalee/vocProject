package com.bitcamp.voc.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Many;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;

import com.bitcamp.Service.mypageMemberService;
import com.bitcamp.voc.order.model.OrderItem;
import com.bitcamp.voc.order.model.OrderVO;
import com.bitcamp.voc.order.model.ProductVO;
import com.bitcamp.voc.order.service.OrderService;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	
	@Autowired
	mypageMemberService mypageMemberService;

	// 카트로 가기
	@RequestMapping("order/cart")
	public String getCart(Model model,  @SessionAttribute("id") String id) {
		List<ProductVO> productList = orderService.getCartList(id);
		model.addAttribute("productList", productList);

		return "order/productCart";
	}

	// 구매 결정 화면
	@RequestMapping("order/buyProduct")
	public String getConfirm(Model model, @SessionAttribute("id") String memberId) {
		/* @RequestAttribute("productList") List<ProductVO> productList */
		List<ProductVO> productList = orderService.getCartList(memberId);

		// 다음 컨펌화면에 넘겨주기 위해 모델에 넣는다
		model.addAttribute("productList", productList);
		model.addAttribute("member", mypageMemberService.selectOneMember(memberId));
		return "order/orderConfirm";
	}

	// 결제 완료 화면
	@RequestMapping(value = "order/insertOrder", method = RequestMethod.POST)
	public String doInsertOrder(OrderVO orderVO, Model model, @RequestParam("zipcode") String zipcode,
			@SessionAttribute("id") String memberId) {
		System.out.println("order/insertOrder." + orderVO);
	
		/// 구매처리(주문정보 SQL등록)
		//사용자 계정번호<간이처리>
		orderVO.setMemberID(memberId);
		orderVO.setOrderAddress(zipcode + " " + orderVO.getOrderAddress());
		
		//구매처리 SQL
		orderService.insertOrder(orderVO);
		
		/// 구매물품처리<간이처리>(물품정보 SQL등록)
		OrderItem orderItem = new OrderItem();
		
		//들어온 구매물품 정보 주문번호 넣기
		List<ProductVO> productList = orderService.getCartList(memberId);
		orderItem.setOrderList(productList);
		orderItem.setOrderNumber(orderVO.getOrderNumber());
		
		//구매물품 SQL처리
		orderService.insertOrderItems(orderItem.getOrderList());
		
		///////////////////////////////////////////////
		
		//구매,구매물품 정보 결과 페이지로 
		model.addAttribute("OrderItem",orderItem);
		model.addAttribute("OrderVO",orderVO);

		return "order/orderComplete";
	}

//	// 구매관리 화면이동 모든 주문선택!
//	@RequestMapping(value = "order/orderControl/{pageNumber}&{perPage}", method = RequestMethod.GET)
//	public String getOrderControl(Model model, @PathVariable(name="pageNumber",required = false) int pageNumber,
//			@PathVariable(name="perPage",required = false) int perPage) {
//		//모든 서비스 오더리스트 제공 SQL
//		List<OrderVO> orderList = orderService.selectOrderItems(perPage,(pageNumber-1)*perPage);
//		
//		
//		Map<String, Object> orderSelect = new HashMap<>();
//		
//		orderSelect.put("pageNumber", (pageNumber));
//		int	orderCount = orderService.selectOrderCount(orderSelect);
//		orderSelect.put("orderCount", (orderCount/perPage)+1);
//		model.addAttribute("orderList", orderList);
//		model.addAttribute("orderSelect",orderSelect);
//
//		return "order/orderControl";
//	}
	
	// 주문 선별선택(where) //2018.08.14모두 검색도 커버
		@RequestMapping(value = "order/orderControl/{pageNumber}&{perPage}/{keyword}/{memberID}/{orderDateFrom}&{orderDateTo}", method = RequestMethod.GET)
		public String getOrderControlSelect(Model model,@PathVariable("keyword") String keyword, 
				@PathVariable(name="memberID",required=false) String memberID,
				@PathVariable("pageNumber") int pageNumber,
				@PathVariable("perPage") int perPage,
				@PathVariable("orderDateFrom") String orderDateFrom,
				@PathVariable("orderDateTo") String orderDateTo) {
			//모든 서비스 오더리스트 제공 SQL
			Map<String, Object> orderSelect = new HashMap<>();
			orderSelect.put("keyword", keyword);
			orderSelect.put("memberID", memberID);
			orderSelect.put("pageNumber", (pageNumber-1)*perPage);
			orderSelect.put("perPage", perPage);
			orderSelect.put("orderDateFrom", orderDateFrom);
			orderSelect.put("orderDateTo", orderDateTo);
			
			List<OrderVO> orderList = orderService.selectOrderItems(orderSelect);
			model.addAttribute("orderList", orderList);
			
			orderSelect.put("orderCount", (orderService.selectOrderCount(orderSelect)/perPage)+1);
			orderSelect.put("pageNumber", pageNumber);
			model.addAttribute("orderSelect",orderSelect);

			return "order/orderControl";
		}

	// 구매관리 수정화면
	@RequestMapping(value = "order/orderUpdate/{orderNumber}", method = RequestMethod.GET)
	public String getOrderUpdate(Model model, @PathVariable("orderNumber") int orderNumber) {
		// 간이처리
		OrderVO orderVO = orderService.selectOrderByNumber(orderNumber);
		model.addAttribute("order", orderVO);

		return "order/orderUpdate";
	}

	// 주문 환불처리, 환불완료된 데이터 보존하는게 나을듯..하여 아직 미구현
	@RequestMapping(value = "order/orderDelete/{orderCount}", method = RequestMethod.GET)
	public String doOrderDelete(@PathVariable("orderCount") int orderCount) {
		return "/order/orderControl";
	}

	// 주문 업데이트<택배처리>
	@RequestMapping(value = "order/orderUpdate/{orderNumber}", method = RequestMethod.POST)
	public String doOrderUpdate(@PathVariable("orderNumber") int orderNumber, HttpServletRequest request) {
		String orderDelivery1 = request.getParameter("orderDelivery1");
		String orderDelivery2 = request.getParameter("orderDelivery2");
		Map<String, Object> orderConfig = new HashMap<>();
		orderConfig.put("orderNumber", orderNumber);
		orderConfig.put("orderDelivery", orderDelivery1+" "+orderDelivery2);
		orderService.updateOrderStatus(orderConfig);
		return "order/closePage";
	}
	
	@RequestMapping(value = "order/orderUpdateConfirm/{orderNumber}", method = RequestMethod.GET)
	public String getOrderUpdateConfirm(@PathVariable("orderNumber") int orderNumber, Model model) {
		model.addAttribute("orderNumber",orderNumber);
		return "order/orderUpdateConfirm";
	}
	
	// 나의 주문내역 조회
	@RequestMapping(value = "member/orderList/{pageNumber}/{orderDateFrom},{orderDateTo}")
	public String getMemberOrder(
			@PathVariable("pageNumber") int pageNumber,
			@PathVariable("orderDateFrom") String orderDateFrom,
			@PathVariable("orderDateTo") String orderDateTo,
			@SessionAttribute("id") String id,
			Model model
			) {
		//아이디 임시처리
		int perPage = 3	;
		
		//모든 서비스 오더리스트 제공 SQL
		Map<String, Object> orderSelect = new HashMap<>();
		orderSelect.put("keyword", "ALL");
		orderSelect.put("memberID", id);
		orderSelect.put("pageNumber", (pageNumber-1)*perPage);
		orderSelect.put("perPage", perPage);
		orderSelect.put("orderDateFrom", orderDateFrom);
		orderSelect.put("orderDateTo", orderDateTo);
		
		List<OrderVO> orderList = orderService.selectOrderItems(orderSelect);
		orderSelect.put("orderCount", (orderService.selectOrderCount(orderSelect)/perPage)+1);
		orderSelect.put("pageNumber", pageNumber);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderSelect",orderSelect);
		
		return "order/memberOrder";
	}
	
	//운송조회
	@RequestMapping(value = "member/getOrderDelivery/{orderDelivery}")
	public String getMemberDelivery(HttpServletRequest request,Model model,
			@PathVariable("orderDelivery") String orderDelivery ) {
		model.addAttribute("orderDelivery", orderDelivery);
		return "order/memberDelivery";
	}
	
	//반품처리
	@RequestMapping(value = "member/doRefund/{orderNumber}")
	public void doRefund(@PathVariable(value = "orderNumber") int orderNumber) {
		if(orderService.updateOrderRefund(orderNumber) > 0) {
			System.out.println("환불요청 성공");
		}else {
			System.out.println("환불요청 실패");
		}
	}
	
	//페이지 수정
	@RequestMapping(value = "test")
	public String test() {
		return "order/temp";
	}
}
