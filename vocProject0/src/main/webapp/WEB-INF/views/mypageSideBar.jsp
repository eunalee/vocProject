<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사이드 바</title>
<style>
ul.sidenav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 20%;
	background-color: #f1f1f1;
   	position: fixed;
	height: 100%;
	overflow: auto;
}

ul.sidenav li a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
}

ul.sidenav li a.active {
	background-color: #4CAF50;
	color: white;
}

ul.sidenav li a:hover (.active ) {
	background-color: #555;
	color: white;
}

div.content {
	margin-left: 25%;
	padding: 1px 16px;
	height: 1000px;
}

@media screen and (max-width: 900px) {
	ul.sidenav {
		width: 100%;
		height: auto;
		position: relative;
   }
	ul.sidenav li a {
		float: left;
		padding: 15px;
	}
</style>
</head>
<% String id = (String)request.getSession(true).getAttribute("id"); %>
<% if(id!=null)%>
<body>
	<ul class="sidenav">
		<li><a class="active" href="<c:url value="/member/myPage"/>">마이페이지</a></li>
		<li><a href="<c:url value="/member/orderList/1/1980-01-01,2100-01-01"/>">내 구매내역</a></li>
		<li><a href="<c:url value="/member/editMember"/>">회원정보 수정</a></li>
		<li><a href="<c:url value="/member/changePwd"/>">비밀번호 변경</a></li>
		<li><a href="<%=request.getContextPath()%>/member/deleteMember/<%=id%>">회원탈퇴</a></li>
		<li><a href="<c:url value="/member/logout"/>">로그아웃</a></li>
	</ul>

</body>
</html>