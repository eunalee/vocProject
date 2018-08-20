<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../index.jsp" flush="false" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	#container {
		border: 1px solid black;
	 	margin: 50px;
	 	padding: 30px;
	 	
	 	text-align: center;
	}
	
	#product {
		width: 100%;
		height: 400px;
	}
	
	#product td:nth-child(2n+1) {
		background-color: #555555;
		color: white;
	}
	
	input[type=text], input[type=file], select {
		width: 100%;
		height: 30px;
	}
	
	textarea {
		width: 100%;
		height: 70px;	
	}
	
	input[type=submit], input[type=reset] {
		border: none;
		
		color: white;
		background-color: #555555;
		
		margin-right:20px;
		padding: 10px;
	}
</style>
</head>
<body>
<div id="container">
	<form action="<c:url value='/product/register' />" method="post" enctype="multipart/form-data">
		<table id="product">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="productName"></td>
			</tr>
		
			<tr>
				<td>상품 카테고리</td>
				<td>
					<select id="productCategory" name="productCategory">
						<option value="Bath">Bath</option>
						<option value="Tech">Tech</option>
						<option value="Apparel">Apparel</option>
					</select>
				</td>
			</tr>
		
			<tr>
				<td>상품 가격</td>
				<td><input type="text" name="productPrice"></td>
			</tr>
		
			<tr>
				<td>상품 수량</td>
				<td><input type="text" name="productQuantity"></td>
			</tr>
		
			<tr>
				<td>상품 제조사</td>
				<td><input type="text" name="productMade"></td>
			</tr>
		
			<tr>
				<td>상품 할인율</td>
				<td><input type="text" name="productSale"></td>
			</tr>
		
			<tr>
				<td>상품 사진</td>
				<td><input type="file" name="pImg"></td>
			</tr>
		
			<tr>
				<td>상품 설명</td>
				<td>
					<textarea name="productDesc" cols="30" rows="10"></textarea>
				</td>
			</tr>
		</table>
	
		<input type="submit" value="등록"><input type="reset" value="취소">
	</form>
</div>
<script>
	$(document).ready(function(){
		$('form').on('reset', function() {
			location.href = '<c:url value='/' />';
		});
	});
</script>
</body>
</html>