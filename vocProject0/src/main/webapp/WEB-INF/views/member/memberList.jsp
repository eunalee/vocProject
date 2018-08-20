<%@page import="com.bitcamp.Model.Member"%>
<%@page import="com.bitcamp.Model.MemberListView"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% request.setCharacterEncoding("UTF-8"); %>
<% MemberListView viewMem = (MemberListView)request.getAttribute("memberListView");
   String id = (String)request.getSession(true).getAttribute("id");
%>

<jsp:include page="../index.jsp" flush="false" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/MemberAllPage.css"/>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MemberList Page</title>
<style>
	body{
		background:white;
	}
	
 	#containAll{
 		width: 70%;
 		margin-top: 30px;
 	}
 	
 	table{
 		border: 1px solid black;
 		padding: 15px;
 	}
 	
 	#containAll h1{
 		color: black;
 		margin-top: 20px;
 	}
	
	td{
		padding: 5px
	}
	
	th{
		background: black;
		color:white;
		padding: 7px;
	}
	
	#homeBtn{
		background:black;
	}
</style>
</head>
<body>

	<div id="containAll">
	

		<div id="container">
			<h1>모든 회원정보 보기</h1>

			<%
				if (viewMem.isEmpty()) {
			%>

			<h3>등록된 회원정보가 없습니다.</h3>
			<a href="<c:url value="/indexHome"/>">[홈으로 가기]</a>

			<%
				} else {
			%>
	 		<%-- <input type="button" id="XMLBtn" onclick="location.href='<c:url value="/joinerList/pdf"/>'" value="PDF">
	 		<input type="button" id="XMLBtn" onclick="location.href='<c:url value="/joinerList/xls"/>'" value="EXCEL">  
			<input type="button" id="XMLBtn" onclick="location.href='<c:url value="/joinerList/list.xml"/>'" value="XML">
			<input type="button" id="XMLBtn" onclick="location.href='<c:url value="/joinerList/list.json"/>'" value="JSON"> --%>

			<table>
				<tr id="tr">
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>이메일</th>
					<th>핸드폰 번호</th>
					<th>주소</th>
					<th>가입날짜</th>
				</tr>

				<%
					for (Member member : viewMem.getMemberList()) {
				%>
				<tr>
					<td><%=member.getId()%></td>
					<td><%=member.getName()%></td>
					<td><%=member.getBirth() %></td>
					<td><%=member.getGender()%></td>
					<td><%=member.getEmail()%></td>
					<td><%=member.getPhone()%></td>
					<td><%=member.getAddress()%></td>
					<td><%=member.getJoindate() %></td>
					
					<%if(id.equals("wang9")){ %>
					<td><input type="button" id="deleteBtn" onclick="location.href='<%=request.getContextPath()%>/member/deleteMember/<%=member.getId()%>'"  value="삭제하기"></td>
					<%} %>
				</tr>
				<%
					}
				%>
				<tr>
					<td colspan="9">
				<%
					for (int i = 1; i <= viewMem.getPageTotalCount(); i++) {
				%>
					<a href="<%=request.getContextPath()%>/member/memberList/<%=i%>">[<%=i%>]</a>
				<%
					}
				}
				%>
					</td>
				</tr>

				<tr>
					<td colspan="9"><input type="button" id="homeBtn" value="홈으로 가기"
						onclick="location.href='<%=request.getContextPath()%>/indexHome'" /></td>
				</tr>

			</table>
		</div>
	</div>

</body>
</html>



<jsp:include page="../footer.jsp" flush="false" />