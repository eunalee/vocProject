<%@page import="javax.crypto.Cipher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../index.jsp" flush="false" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/loginForm.css"/>">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<style>
#container h1 {
	margin: 30px auto;
	text-align: center;
}

body {
	background: white;
}

input[type=submit] {
	background: black;
}

.box {
	border: 1px solid black;
}

#naverLoginImg{
	margin-top:10px; 
}
</style>
</head>

<%
	request.setCharacterEncoding("UTF-8");

	String id = "";
	Cookie[] c = request.getCookies();

	if (c != null && c.length > 0) {
		for (int i = 0; i < c.length; i++) {
			if (c[i].getName().equals("id"))
				id = c[i].getValue();
		}
	}
%>

<body>
	<div id="containAll">

		<div id="container">
			<h1>로그인</h1>
			<form action="<c:url value="/member/login"/>" method="post">
				<div class="box">
					<input type="text" id="id" name="id" class="input"
						placeholder="아이디" value=<%=id%>>
				</div>
				<div class="box">
					<input type="password" id="password" name="pwd" class="input"
						placeholder="비밀번호">
				</div>

				<input type="submit" value="로그인"> 
				<input type="checkbox" id="remember" name="remember" value="remember"> 
				<label for="remember">아이디 저장</label><br>
					아이디/비밀번호를 잊으셨습니까?
					<label><a href="<c:url value="/member/id/FindId"/>">아이디 찾기</a></label> 
					<label><a href="<c:url value="/member/pwd/FindTempPwd"/>">비밀번호 찾기</a></label><br>

			<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
			<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
			<div id="naver_id_login" style="text-align: center">
				<a href="${url}"> <img width="100%" id="naverLoginImg" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
			</form>

			</div>
		</div>
	</div>
</body>

</html>

<jsp:include page="../footer.jsp" flush="false" />
