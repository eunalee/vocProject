<%@page import="com.bitcamp.Model.Member"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../index.jsp" flush="false" />

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	Member member = (Member) request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/MyPageForm.css"/>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
<style>
#container {
	border: 1px solid black;
	padding-top: 0px;
	margin-top: 40px;
}

body {
	background: white;
}

#container h1 {
	color: black;
	margin-top: 30px;
}

input[type=button] {
	background: black;
	font-size: 15px;
}

.noneBorder {
	border-bottom: none;
}

}
</style>
</head>
<body>
<jsp:include page="../mypageSideBar.jsp" flush="false" />
	<div id="containAll">
		<%
			if (member != null) {
		%>
		<div id="container">
			<h1>My Page</h1>
			<%
				if (member.getPhoto() != null) {
			%>
			<img src='<%=request.getContextPath()%>/file/photo/${member.photo}'
				style="width: 200px;">
			<%
				}
			%>
			<p>
			<table>
				<tr>
					<td>아이디</td>
					<td>${member.id}</td>
				</tr>

				<tr>
					<td>비밀번호</td>
					<td>${member.pwd}</td>
				</tr>

				<tr>
					<td>이름</td>
					<td>${member.name}</td>
				</tr>

				<tr>
					<td>생년월일</td>
					<td>${member.birth}</td>
				</tr>

				<tr>
					<td>성별</td>
					<td>${member.gender}</td>
				</tr>

				<tr>
					<td>이메일</td>
					<td>${member.email}</td>
				</tr>

				<tr>
					<td>핸드폰 번호</td>
					<td>${member.phone}</td>
				</tr>

				<tr>
					<td>주소</td>
					<td>${member.address}</td>
				</tr>

				<tr>
					<td>가입날짜</td>
					<td>${member.joindate}</td>
				</tr>

				<tr>
					<td class="noneBorder"><input type="button" value="회원정보 수정"
						onclick="location.href='<c:url value="/member/editMember"/>'" /></td>
					<td class="noneBorder"><input type="button" value="홈으로 가기"
						onclick="location.href='<c:url value="/indexHome"/>'" /></td>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
<%
	} else {
%>
<script>
	alert('로그인 해주세요.');
	location.href = '<c:url value="/member/login"/>';
</script>
<%
	}
%>


<jsp:include page="../footer.jsp" flush="false" />