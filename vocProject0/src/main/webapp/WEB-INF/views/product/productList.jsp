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
	
	#product tr:first-child {
		background-color: #555555;
		color: white;
		
		height: 50px;
	}
	
	#product tr, #product td {
		border-bottom: 1px solid #ddd;
	}
	
	#product a {
		text-decoration: none;
		color: black;
		
		font-weight: bold;
	}
	
	#paging {
		margin-top: 20px;
		margin-bottom: 50px;
		margin-left: 50%;
	}
	
	#paging li {  
    	float: left; 
    	
    	list-style: none;  
	}
	
	#paging li a {  
		width:15px; 
	
    	float: left; 
    	 
    	padding: 4px;  
    	margin-right: 5px; 
    	 
    	font-weight: bold;  
    	
    	color: black;
    	
    	border: 1px solid #ddd;
    	
    	text-align: center;  
    	text-decoration: none;  
	}
</style>
</head>
<body>
<div id="container">
	<table id="product">
		<tr>
			<td></td>
			<td>상품 ID</td>
			<td>상품명</td>
			<td>카테고리</td>
			<td>판매가</td>
			<td>가격</td>
			<td>할인율</td>
			<td>수량</td>
			<td>제조사</td>
			<td>상세설명</td>
			<td>등록일자</td>
			<td>상품관리</td>
		</tr>
		
		<c:choose>
			<c:when test="${ empty viewData }">
				<tr>
					<td colspan="12">등록된 상품이 없습니다.</td>
				</tr>
			</c:when> 
			
			<c:when test="${ not empty viewData }">
				<c:set var="no" value="${ (pageNum-1) * 5 + 1 }" />
				
				<c:forEach var="product" items="${ productList }">
					<tr>
						<td><img src="<c:url value='/file/productPhoto/${ product.productImg }' />"></td>
						<td>${ product.productId }</td>
						<td>${ product.productName }</td>
						<td>${ product.productCategory }</td>
						<td><fmt:formatNumber type="currency" currencySymbol="￦" value="${ product.productPrice*(100-product.productSale)/100 }" /></td>
						<td><fmt:formatNumber type="currency" currencySymbol="￦" value="${ product.productPrice }" /></td>
						<td><fmt:formatNumber type="percent" value="${ product.productSale/100 }" /></td>
						<td>${ product.productQuantity }</td>
						<td>${ product.productMade }</td>
						<td>${ product.productDesc }</td>
						<td>${ product.productRegDate }</td>
						<td><a href="<c:url value='/product/edit/${ product.productId }' />">수정</a> / <a href="<c:url value='/product/delete/${ product.productId }' />">삭제</a></td>
					</tr>
					
					<c:set var="no" value="${ no+1 }" />
				</c:forEach>
			</c:when> 
		</c:choose>
	</table>
	
	<ul id="paging">
		<c:forEach var="i" begin="1" end="${ totalPageCount }">
			<li><a href="<c:url value='/product/viewAll/${ i }' />">${ i }</a></li>
		</c:forEach>
	</ul>
</div>

</body>
</html>