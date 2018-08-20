<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../index.jsp" flush="false" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content {
		margin: 25px 30px;
	}
	
	img {
		width: 50%;
		height: 50%;
	}

	.left_area {
		float:left;
		width:47%;
		
		text-align: center;
		margin-top:5px;
	}
	
	.right_area {
		float:right;
		width:47%;
	}
	
	.info_list {
		width:50%;
		margin-top:20px;
		padding:0 0 8px;
		border-bottom:1px solid #e5e5e5;
	}
	
	h1#pname {
		font-size:26px;
		color:#000;
		line-height:32px;
		word-break:break-all;
	}
	
	ul {
		list-style: none;
		padding-left: 0px;
	}
	
	input[type=number], select {
		border: 1px solid #e5e5e5;
		width: 50px;
		height: 30px;
	}
	
	 #cartbtn {
	 	margin-top: 15px;
	  	border: none;
		color: white;
		background-color: #555555;
		width:50%;
		height: 45px;
	}
</style>
</head>
<body>
	<form action="<c:url value='/product/addtocart' />" method="post" id="form">
	
	<div class="content">
		<div class="left_area">
			<img src="<c:url value='/file/productPhoto/${ product.productImg }' />">
			<input type="hidden" name="productImg" value="${ product.productImg }">
		</div>
	
		<div class="right_area">
			<div class="info_list">
				<input type="hidden" name="productKey" value="${ product.productId }">
				
				<h1 id="pname">${ product.productName }</h1>
				<input type="hidden" name="productName" value="${ product.productName }">
				
				<p>${ product.productMade }</p>
			</div>
		
			<ul>
				<li><b><fmt:formatNumber type="currency" currencySymbol="￦" value="${ product.productPrice*(100-product.productSale)/100 }" /></b></li>
			</ul>
			<fmt:parseNumber var="price" value="${ product.productPrice*(100-product.productSale)/100 }" />
			<input type="hidden" name="productPrice" value="${ price }">
		
			<br>
		
			<p>Quantity</p>
			<input type="number" name="productQuantity" min="1" max="20" value="1">
			
			<c:if test="${ product.productCategory eq 'Apparel' }">
				<p>Size</p>
           		<select id="size" name="productOption">
           			<option value="Small">S</option>
           			<option value="Medium">M</option>
           			<option value="Large">L</option>
           		</select>
           		<br>
           	</c:if>
           	
           	<div class="payment_info">
           		<input type="submit" id="cartbtn" value="Add to cart"><br>
			</div>
		</div>
	</div>
	</form>
<script>
/*  	$(document).ready(function() {
		$('#cartbtn').click(function() {
			var result = confirm('계속 쇼핑하시겠습니까?');
			
			if(result) 
				$('#form').attr('action', '<c:url value='/products/addtocart' />'); 
			
			else 
				$('#form').attr('action', '<c:url value='/product/addtocart' />'); 			
		});
	});  */
</script>
</body>
</html>