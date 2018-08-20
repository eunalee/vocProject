<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../index.jsp" flush="false" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container {
	 	margin: 50px;
	 	text-align: center;
	}
	
	a {
		text-decoration: none;
		color: black;
	}
	
	.category {
		border: 1px solid black;
		float: left;
		
		width: 30%;
		height: 400px;
		
		margin-top: 120px;
		margin-left: 30px;
		
		pading-right: 10px;
		font-size: 2em;
	}
	
	.position {
		font-weight: bold;
		font-size: 1em;
		
		margin-top: 30%;
	}
</style>
</head>
<body>
<div id="container">
	<div class="category">
		<div class="position"><a href="<c:url value='/product/viewCategory/Bath' />">Bath</a></div>
	</div>
		
	<div class="category">
		<div class="position"><a href="<c:url value='/product/viewCategory/Tech' />">Tech</a></div>
	</div>
	
	<div class="category">
		<div class="position"><a href="<c:url value='/product/viewCategory/Apparel' />">Apparel</a></div>
	</div>
</div>

</body>
</html>