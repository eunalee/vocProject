<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../index.jsp" flush="false" />
<title>Insert title here</title>
<style>
#con{
	margin : 0 auto;
}
#cont{
	margin : 0 auto;
	width : 500px;
}
h1{
	text-align: center;
}
#memo{
	width : 500px;
	height : 300px;
}
</style>
</head>
<body>
<div id="con">
	<div id="cont">
	<h1>Write</h1>
	<form method="post">
		<!-- 
		<label for="name">작성자</label>
		<input type="text" id="name" name="name">
		<br>
		 -->
		 <table>
		 	<tr>
				<td><label for="pw">비밀번호</label></td>
				<td><input type="password" id="pw" name="pw"></td>
			</tr>
			<tr>
				<td><label for="title">제목</label></td>
				<td><input type="text" id="title" name="title"></td>
			</tr>
			
			<tr>
				<td><label for="memo">내용</label></td>
			<!-- <input type="text" id="memo" name="memo"> -->
				<td><textarea id="memo" name="memo"></textarea></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
	<a href="../bbs/board">게시판으로</a>
	</div>
</div>
</body>
</html>
<jsp:include page="../footer.jsp" flush="false" />