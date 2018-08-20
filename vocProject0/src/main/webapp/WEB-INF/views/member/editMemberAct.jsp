<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	boolean result = (boolean)request.getAttribute("result");
%>

<% if(result == true){ %>
<script>
alert("회원정보 수정이 성공적으로 이루어졌습니다.");
location.href="<c:url value="/member/myPage"/>";
</script>
<% }else{ %>
<script>
alert("회원정보 수정을 실패했습니다.");
location.href="<c:url value="/member/myPage"/>";
</script>
<% } %>
</body>
</html>