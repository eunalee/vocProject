<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0;
	height: 100%;
}

.content {
	font-size: 12px;
	margin: 25px 30px;
}

table {
	width: 100%;
}

td, th {
	border-bottom-style: solid;
	border-right: solid;
	border-width: 1px;
}

th {
	background-color: black;
	color: white;
	text-align: left;
}

tr:hover {
	background-color: gray;
}
</style>

<body>
	<jsp:include page="../index.jsp" flush="false" />
	<jsp:include page="../mypageSideBar.jsp" flush="false" />
	<!-- 페이지 컨텐츠 -->
	<div class="content">

		<div style="margin: auto; width: 1000px; margin-top: 80px">

			<div style="text-align: center">
				<h1>Order Management</h1>
			</div>

			나의 주문내역 <input type="date" id="orderDateFrom"> <input
				type="date" id="orderDateTo">
			<button onclick="doOrderSelect()">Search</button>

			<table>
				<tr>
					<td>상태</td>
					<td>주문제품</td>
					<td>주문날짜</td>
					<td>주소</td>
					<td>전화번호</td>
					<td>비고</td>
					<td>총계</td>
					<td>주문방식</td>
				</tr>
				<c:forEach var="order" items="${orderList}">
					<tr>
						<td><c:choose>
								<c:when test="${order.orderStatus == 0}">주문대기</c:when>
								<c:when test="${order.orderStatus == 1}">발주완료</c:when>
								<c:when test="${order.orderStatus == 2}">발송중</c:when>
								<c:when test="${order.orderStatus == 3}">완료대기</c:when>
								<c:when test="${order.orderStatus == 4}">완료</c:when>
								<c:when test="${order.orderStatus == 5}">환불요청</c:when>
								<c:when test="${order.orderStatus == 6}">환불완료</c:when>
							</c:choose></td>
						<td>${order.orderItem }</td>
						<td>${order.orderDate }</td>
						<td>${order.orderAddress }</td>
						<td>${order.orderPhone }</td>
						<td>${order.orderOption }</td>
						<td>${order.orderTotal }</td>
						<td>${order.orderPay }</td>
						<td>
							<form action=""
								onsubmit="window.open('${pageContext.request.contextPath}/member/getOrderDelivery/${order.orderDelivery }','배송현황','width=500,height=500')">
								<c:choose>
								
										<c:when test="${order.orderDelivery != null && order.orderStatus < 5 }">
											<input type="submit" value="배송조회">
										</c:when>
										<c:when test="${order.orderDelivery == null && order.orderStatus < 5 }">
											<input type="submit" value="배송전" disabled="disabled">
										</c:when>
									
								</c:choose>

							</form> <br> <c:if test="${order.orderStatus < 4}">
								<button id="refund" onclick="doRefund(${order.orderNumber})"
									style="background-color: Red">반품신청</button>
							</c:if> <c:if test="${order.orderStatus >= 4 }">
								<button style="background-color: Gray;">반품대기</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<c:forEach var="count" begin="1" end="${orderSelect.orderCount}">
				<a
					href="${pageContext.request.contextPath}/member/orderList/${count}/${orderSelect.orderDateFrom},${orderSelect.orderDateTo}">${count }</a>
			</c:forEach>

		</div>
	</div>

	<script>
	
	function doOrderSelect() {
		var orderDateFrom = $('#orderDateFrom').val();
		var orderDateTo = $('#orderDateTo').val();
		var orderPage = 1;
		
		if(orderDateFrom == "")orderDateFrom = "1980-01-01";
		if(orderDateTo == "")orderDateTo = "2100-01-01";
		var orderDate = orderDateFrom + "," + orderDateTo;
		
		location.href= "${pageContext.request.contextPath}/member/orderList/"
		+ orderPage + "/" + orderDate;
	}
	
	function doRefund(orderNumber){
		var con = confirm("정말로 환불을 원하십니까?")
		if(con){
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/member/doRefund/" + orderNumber,
				success: window.location.reload()
			})
		}else{
		}
	}
	
	function reloadPage(){
		
	}
	
	</script>
</body>

</html>

