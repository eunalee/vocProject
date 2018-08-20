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
	.content {
		margin: 25px 30px;
	}
</style>
</head>
<body>

<div class="content">
	<c:if test="${ resultCnt > 0 }">
		<p>성공!</p>
	</c:if>

	<c:if test="${ !(resultCnt > 0) }">
		<p>실패!</p>
	</c:if>
</div>
</body>
</html>