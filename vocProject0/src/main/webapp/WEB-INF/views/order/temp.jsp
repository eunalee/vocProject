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
    	border-collapse: collapse;
    	width: 100%;
    	
	}

	tr, td {
    	padding: 8px;
    	text-align: left;
    	border-top: 1px solid #ddd;
    	border-bottom: 1px solid #ddd;
    	text-align: center;
	}
	
	h1 {
		text-align: center;
	}
	
	.info {
		
		background-color: #f2f2f2
	}
	
</style>

<body>
	<jsp:include page="../index.jsp" flush="false" />

	<!-- 페이지 컨텐츠 -->
	<div class="content">
		<div style="margin: auto; width: 1000px; margin-top: 80px">

			결제가 완료되었습니다. ${orderVO }
	<br>
	<table>
		<tr>
			<td>상품번호</td>
			<td>상품이름</td>
			<td>수량</td>
			<td>옵션</td>
			<td>가격</td>
		</tr>
		<c:set var="orderTotal" value="0" />
		<c:forEach var="product" items="${OrderItem.orderList}">
			<tr>
				<td>${product.productKey }</td>
				<td>${product.productName }</td>
				<td>${product.productQuantity }</td>
				<td>${product.productOption }</td>
				<td>${product.productPrice }</td>
			</tr>
		</c:forEach>
	</table>
		</div>
	</div>
</body>

</html>

