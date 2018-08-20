<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
	width : 1000px;
}
h1, h2{
	text-align: center;
}
#memo, #reply{
	border : 1px solid;
}
</style>
</head>
<body>
<div id="con">
	<div id="cont">

	<h1>내용</h1>
	<div id="memo">
	번호 : ${list.num} <br>
	제목 : ${list.title} <br>
	작성자 : ${list.name} <br>
	작성시간 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${list.regDate}"/><br>
	조회수 : ${list.viewCnt} <br>
	내용 : ${list.memo } <br>
	
	<a href="../bbs/board">목록</a>
	<a href="../bbs/modify?num=${list.num}">수정</a>
	<a href="../bbs/delete?num=${list.num}">삭제</a>
	</div>
	
	<h2>댓글</h2>
	<div id="reply">
	<c:forEach items="${reply}" var="replyVo">
		번호 : ${replyVo.cnum} /
		작성자 : ${replyVo.name} /
		작성시간 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${replyVo.regDate}"/><br>
		내용 : ${replyVo.memo}<br>
		<%-- <a href="../bbs/replymodify?cnum=${replyVo.cnum}&num=${list.num}" onclick="mod(); return false;">수정</a> --%>
		<a href="#" onclick="mod('${replyVo.cnum}', '${replyVo.num}');">수정</a>
		<a href="../bbs/replydelete?cnum=${replyVo.cnum}&num=${list.num}">삭제</a><br>
	</c:forEach>
	</div>
	
	<!-- 댓글의 수정 버튼을 누르면 javascript를 통해 보여지게 됨 -->
	<div id="modify" style="display:none;">
		<form action="replymodify">
			<input type="hidden" name="mcnum" id="cnum" value="">
			<input type="hidden" name="mnum" id="num" value="">				
			<input type="text" name="mmemo">
			<input type="submit" value="수정">
		</form>
	</div>
	
	<form action="replyinsert">
		<input type="hidden" name="num" value="${list.num}"><br>
		<!-- <input type="text" name="name"><br> -->
		<input type="text" name="memo"><br>
		<input type="submit" value="등록">
	</form>
	</div>
</div>
</body>
<script>
	/* 수정 버튼을 누를시 글번호와, 댓글번호를 매개변수로 넘겨줌 and 숨겨진 수정 폼이 생김 */
	function mod(a, b){
		$('#modify').attr('style', 'block');
		$('#cnum').val(a); //댓글번호
		$('#num').val(b); //글번호
	}
</script>
</html>
<jsp:include page="../footer.jsp" flush="false" />