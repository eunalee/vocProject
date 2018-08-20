<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:include page="index.jsp" flush="false" />

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>

<style>
body {
	margin: 0;
	height: 100%;
}

.content {
	margin: 25px 30px;
}
</style>

<body>

	<!-- 페이지 컨텐츠 -->
	<div style="text-align: center;" class="content">
		<a href="/ProductAction?index=selectAll&location=productlist.jsp&category=ALL"><img src="https://i.pinimg.com/originals/52/b9/e4/52b9e4d7b4a914fe0dd32feb6dcf8d2a.jpg"></a>
	</div>

</body>
</html>

<jsp:include page="footer.jsp" flush="false" />