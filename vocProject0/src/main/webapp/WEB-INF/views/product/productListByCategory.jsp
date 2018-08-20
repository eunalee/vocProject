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
	 	margin: 50px;
	 	padding: 30px;
	 	
	 	text-align: center;
	}
	
	.box {
    	padding: 15px;
    }
    
    .product {
    	float: left;
    	
    	padding-left: 20px;
    	padding-right: 20px;
    	
    	margin: 45px;
    	
    	font-weight: bold;
    }
    
    #paging {
		margin-top: 50%;
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
    	margin-right: 10px; 
    	 
    	font-weight: bold;  
    	
    	color: black;
    	
    	border: 1px solid #ddd;
    	
    	text-align: center;  
    	text-decoration: none;  
	}  
</style>
</head>
<body>
	<div class="content">
		<div class="box">
        	<c:choose>
				<c:when test="${ empty viewData }">
					<p>등록된 상품이 없습니다.</p>
				</c:when> 
				
				<c:when test="${ not empty viewData }">
					<c:forEach var="product" items="${ productList }">
						<div class="product">
							<a href="<c:url value='/product/viewProduct/${ product.productId }' />"><img src="<c:url value='/file/productPhoto/${ product.productImg }' />"></a>
							<p><span>[${ product.productDesc }]</span> ${ product.productName }</p>
						</div>
					</c:forEach>
				</c:when> 
			</c:choose>
			
			<ul id="paging">
				<c:forEach var="i" begin="1" end="${ totalPageCount }">
					<li><a href="<c:url value='/product/viewCategory/${ category }/${ i }' />">${ i }</a></li>
				</c:forEach>
			</ul>
			
    	</div>
	</div>
</body>
</html>