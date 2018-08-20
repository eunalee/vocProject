<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<c:if test="${id != null}">
	<script>
		var name ="${name}";
		var id = "${id}";
		alert(name + ' 님의 ID는 '+ id +'입니다.');
		location.href = '<c:url value="/member/login"/>';
	</script>

</c:if>
	<script>
		var name ="${name}";
		alert('정보가 올바르지 않습니다.');
		location.href = '<c:url value="/member/id/FindId"/>';
	</script>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
</head>
<body>

</body>
</html>