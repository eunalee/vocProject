<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
int resultCnt = (int)request.getAttribute("resultCnt");
String id = (String)request.getAttribute("id");
%>

<% if (resultCnt == 1) {%>
	<% request.getSession(true).setAttribute("id",id); %>
	<% System.out.println(request.getSession(false).getAttribute("id"));%>
	<script>
		var id = "${id}"; 
		alert(id+ '님 환영합니다!');
		location.href = '<c:url value="/indexHome"/>';
	</script>

<%}else if(resultCnt == 2){ %>  

	<script>
		alert('비밀번호가 틀렸습니다.');
		location.href = '<c:url value="/member/login"/>';
	</script>

<%}else if(resultCnt == 3){ %>
	<script>
		alert('아이디가 틀렸습니다.');
		location.href = '<c:url value="/member/login"/>';
	</script>

<%-- <%}else if(resultCnt == 4){ %>
	<script>
		var id = "${id}"; 
		alert('이메일 회원인증을 해주세요!.');
		location.href='<c:url value="/mail/RegiConfirmMail/${id}"/>';
	</script> --%>
	
<%}else if(resultCnt == 0){%>
	<script>
		alert('아이디를 정확하게 입력해주세요.');
		location.href = '<c:url value="/member/login"/>';
	</script> 
<%} %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
</style>
</head>
<body>
</body>
</html>
