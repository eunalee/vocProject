<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

	<jsp:include page="../index.jsp" flush="false" />
	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	height: 100%;
}

.content {
	margin: 25px 30px;
}
</style>
</head>
<body>

	<!-- 페이지 컨텐츠 -->
	<div style="width: 1300px; margin: auto;">
		<div style="width: 220px; font-size: 20px; font-family: serif; margin: auto; margin-bottom: 100px; margin-top: 50px; border-bottom-style: groove; border-bottom-width: 1px; text-align: center">
			Shopping Cart
		</div>
		
		<table>
			<tr style="background-color: rgb(228, 228, 228);">
				<th style="width: 20%">상품사진</th>
				<th style="width: 35%">상품명</th>
				<th style="width: 20%">수량</th>
				<th style="width: 20%">가격</th>
				<th style="width: 5%">총합</th>
				<th></th>
			</tr>
			
			<tr>
				<td><img src="<c:url value='/file/productPhoto/${ cart.productImg }' />" style="width: 50px;"></td> 
				<td>${ cart.productName }</td>
				<td>${ cart.productQuantity }</td>
				<td>${ cart.productPrice }</td>
				<td>${ cart.productQuantity*cart.productPrice }</td>
			</tr>
			
			<tr style="background-color: rgb(228, 228, 228);">
				<td colspan="7" style="margin: 30px;"></td>
			</tr>
		</table>

		<div style="margin: 10px">
			<!-- 				<form action="/CartAction" style="float: right">
					<input type="hidden" name="index" value="delete_all"> <input
						type="submit" value="장바구니 비우기">
				</form> -->
			<form action="${pageContext.request.contextPath}/order/buyProduct">
				<input type="submit" value="구매하기">
			</form>
		</div>
	</div>
	<jsp:include page="../footer.jsp" flush="false" />
</body>
</html>

