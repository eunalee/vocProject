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

</style>

<body>
	<jsp:include page="../index.jsp" flush="false" />

	<!-- 페이지 컨텐츠 -->
	<div class="content">
		<div style="margin: auto; width: 1000px; margin-top: 80px">
			
			<div style="text-align: center; font-size: 30px">Order Status</div>
			
			<form
				action="${pageContext.request.contextPath}/order/orderUpdate/${order.orderNumber}"
				method="POST">
				<table>
					<tr>
						<td>주문번호</td>
						<td>${order.orderNumber }</td>
					</tr>
					<tr>
						<td>주문상태</td>
						<td><c:choose>
								<c:when test="${order.orderStatus == 0}">주문대기</c:when>
								<c:when test="${order.orderStatus == 1}">발주완료</c:when>
								<c:when test="${order.orderStatus == 2}">발송중</c:when>
								<c:when test="${order.orderStatus == 3}">완료대기</c:when>
								<c:when test="${order.orderStatus == 4}">완료</c:when>
								<c:when test="${order.orderStatus == 5}">환불요청</c:when>
								<c:when test="${order.orderStatus == 6}">환불완료</c:when>
							</c:choose></td>
					</tr>
					<tr>
						<td>주문자</td>
						<td>${order.memberID }</td>
					</tr>
					<tr>
						<td>주문날짜</td>
						<td>${order.orderDate }</td>
					</tr>
					<tr>
						<td>주문지역</td>
						<td>${order.orderAddress }</td>
					</tr>
					<tr>
						<td>주문자번호</td>
						<td>${order.orderPhone }</td>
					</tr>
					<tr>
						<td>특이사항</td>
						<td>${order.orderOption }</td>
					</tr>
					<tr>
						<td>총결제금액</td>
						<td>${order.orderTotal }</td>
					</tr>
					<tr>
						<td>결제방법</td>
						<td>${order.orderPay }</td>
					</tr>
					<tr>
						<td>결제품목</td>
					</tr>
				</table>
				<table>
						<tr>
							<td>상품명</td>
							<td>가격</td>
							<td>수량</td>
							<td>총계</td>
							<td>옵션</td>
						</tr>
					<c:forEach var="product" items="${order.orderItem.orderList }">
						<tr>
							<td>${product.productKey }</td>
							<td>${product.productPrice }</td>
							<td>${product.productQuantity }</td>
							<td>${product.productPrice * product.productQuantity }</td>
							<td>${product.productOption }</td>
						</tr>
					</c:forEach>
				</table>
				<c:choose>
					<c:when test="${order.orderStatus == 0}">
						<button onclick="getOrderUpdateWindow()">발송허가</button>
					</c:when>
					<c:when test="${order.orderStatus == 5}">
						<button onclick="location.href='${pageContext.request.contextPath}/order/orderDelete/${order.orderNumber}'">환불허가</button>
					</c:when>
				</c:choose>
			</form>

		</div>
	</div>

	<script>
		function getOrderUpdateWindow() {
			window
					.open(
							"${pageContext.request.contextPath}/order/orderUpdateConfirm/${order.orderNumber}",
							"송장처리", 'height=200,width=400');
		}

		function getOrderControl() {
			location.href = "${pageContext.request.contextPath}/order/orderControl";
		}
	</script>
</body>

</html>

