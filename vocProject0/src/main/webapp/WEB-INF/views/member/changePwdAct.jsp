
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
boolean result = (boolean)request.getAttribute("result");
%>


<% 
	if (result == true) {
%>

	<script>
		alert('비밀번호가 성공적으로 변경되었습니다.');
		location.href = '<c:url value="/indexHome"/>';
	</script>

<%}else{ %>  
	
	<script>
		alert('비밀번호 변경을 실패하였습니다.');
		location.href = '<c:url value="/member/changePwd"/>';
	</script> 
<%} %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 변경</title>
<style>
</style>
</head>
<body>
</body>
</html>