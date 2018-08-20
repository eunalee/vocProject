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
	font-size : 12px;
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

tr:hover {
	background-color: gray;
}
</style>

<body>
	<jsp:include page="../index.jsp" flush="false" />

	<!-- 페이지 컨텐츠 -->
	<div class="content">
		<div style="margin: auto; width: 1000px; margin-top: 80px">

			<div style="text-align: center">
				<h1>Order Management</h1>
			</div>

			<select id="orderStatus"><option value="all">주문상태</option>
				<option value="zero">주문대기</option>
				<option value="one">발주완료</option>
				<option value="two">발송중</option>
				<option value="three">완료대기</option>
				<option value="four">완료</option>
				<option value="five">환불요청</option>
				<option value="six">환불완료</option></select> <select id="orderPerPage"><option>10</option>
				<option>20</option>
				<option>50</option></select> <input type="text" id="memberName"> <input
				type="date" id="orderDateFrom"> <input type="date"
				id="orderDateTo">
			<button onclick="doOrderSelect()">Search</button>
			<table>
				<tr>
					<th>번호</th>
					<th>상태</th>
					<th>주문제품</th>
					<th>주문자</th>
					<th>주문날짜</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>비고</th>
					<th>총계</th>
					<th>주문방식</th>
				</tr>
				<c:forEach var="order" items="${orderList}">
					<tr onclick="location.href='${pageContext.request.contextPath}/order/orderUpdate/${order.orderNumber}'">
						<td>${order.orderNumber }</td>
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
						<td>${order.memberID }</td>
						<td>${order.orderDate }</td>
						<td>${order.orderAddress }</td>
						<td>${order.orderPhone }</td>
						<td>${order.orderOption }</td>
						<td>${order.orderTotal }</td>
						<td>${order.orderPay }</td>
					</tr>
				</c:forEach>
			</table>
			<c:forEach var="count" begin="1" end="${orderSelect.orderCount-1  }">
				<a href="${pageContext.request.contextPath}/order/orderControl/${count}&${orderSelect.perPage}/${orderSelect.keyword}/${orderSelect.memberID}/${orderSelect.orderDateFrom}&${orderSelect.orderDateTo}">${count }</a>
			</c:forEach>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			console("${orderSelect}")
		})

		function doOrderSelect() {
			var orderStatus = $('#orderStatus').val();
			var orderPerPage = "1&" + $('#orderPerPage').val();
			var memberName = $('#memberName').val();
			var orderDateFrom = $('#orderDateFrom').val();
			var orderDateTo = $('#orderDateTo').val();

			if (orderDateFrom == "")
				orderDateFrom = "1980-01-01";
			if (orderDateTo == "")
				orderDateTo = "2100-01-01";
			var orderDate = orderDateFrom + "&" + orderDateTo;

			if (memberName == "")
				memberName = "ALL";
			location.href = "${pageContext.request.contextPath}/order/orderControl/"
					+ orderPerPage
					+ "/"
					+ orderStatus
					+ "/"
					+ memberName
					+ "/"
					+ orderDate;
		}
	</script>
</body>

</html>

