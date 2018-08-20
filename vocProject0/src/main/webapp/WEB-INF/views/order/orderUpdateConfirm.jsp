<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/order/orderUpdate/${orderNumber }"  method="POST">
	<input type="hidden" name="orderNumber">
	
	송장번호 입력하기 : 
	<select name="orderDelivery1">
	<option>우체국택배</option>
	<option>한진택배</option>
	<option>CJ택배</option>
	<option>비트택배</option></select>
	<input type="text" name="orderDelivery2">
	<input type="submit" onclick="doUpdateDelivery()">
	</form>
</body>
</html>