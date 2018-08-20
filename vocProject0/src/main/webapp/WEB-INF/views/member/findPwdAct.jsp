
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
%>

<% 
	if (resultCnt == 1) {
%>
	<script>
		alert('임시 비밀번호를 메일로 전송했습니다.');
		location.href = '<c:url value="/indexHome"/>';
	</script>

<%}else if(resultCnt == 2){ %>  
	<script>
		alert('이름이 올바르지 않습니다.');
		location.href = '<c:url value="/member/pwd/FindTempPwd"/>';
	</script>

<%}else if(resultCnt == 4){ %>
	<script>
		alert('이메일이 올바르지 않습니다.');
		location.href='<c:url value="/member/pwd/FindTempPwd"/>';
	</script>
	
<%}else if(resultCnt == 0){%>
	<script>
		alert('없는 아이디 입니다.');
		location.href='<c:url value="/member/pwd/FindTempPwd"/>';
	</script> 
<%} %> 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>임시 비밀번호</title>
<style>
</style>
</head>
<body>
</body>
</html>