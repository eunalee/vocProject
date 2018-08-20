<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
table{
	width : 100%;
	border : 1px solid;
}
tr, td{
	border : 1px solid;
}
h1{
	text-align: center;
}
.text-center{
	text-align: center;
}
.text-center ul{
	list-style-type: none;
}
.text-center li{
	display: inline;
}
a{
	text-decoration: none;
}
</style>
</head>
<body>
<div id="con">
	<div id="cont">
	<h1> 게시판 </h1>
	<table>
		<tr>
			<th><input type="checkbox" id="allchk"></th>
			<th>NO</th>
			<th style="width:60%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<c:forEach items="${list}" var="vo">
		<tr>
			<td><input type="checkbox" name="check[]" value="${vo.num}" class="chks"></td>
			<td>${vo.num}</td>
			<td><a href="view?num=${vo.num}">${vo.title} [${vo.replyCnt}]</a></td>
			<td>${vo.name}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regDate}"/></td>
			<td>${vo.viewCnt}</td>
			<td><a href="delete?num=${vo.num}">삭제</a></td>
		</tr>
		</c:forEach>
	</table>
	<a href="write">글쓰기</a>
	<a href="#" onclick="selchk()">선택삭제</a>
	<hr>
	
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMake.prev}">
				<li><a href="board?page=${pageMaker.startPage-1}">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="board?page=${idx}">${idx}</a>
				</li>
			</c:forEach>
			
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="board?page=${pageMaker.endPage+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	
	</div>
</div>
</body>
<script>
	$('#allchk').bind('click', function(){
		if($('#allchk').prop('checked')){
			$('.chks').prop('checked', true);
		}else{
			$('.chks').prop('checked', false);
		}
	});

	function selchk(){
		var cs = Array();
		var cnt = 0;
		var chkbox = $('.chks');
		
		for(i=0; i<chkbox.length; i++){
			if(chkbox[i].checked == true){
				cs[cnt] = chkbox[i].value;
				cnt++;
			}
		}
		location.href="selchk?nums=" + cs;
	}
</script>
</html>
<jsp:include page="../footer.jsp" flush="false" />