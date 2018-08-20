<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%-- <jsp:useBean id="joiner" scope="session" class="LoginTask.model.Joiner"/> --%>
<%
	String id = (String) request.getSession(true).getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
body {
	margin: 0px;
}

#topnav {
	background: black;
	width: 100%;
	height: 51px;
}

#topnav a {
	float: left;
	background: black;
	color: #fff;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
	cursor: pointer;
}

#topnav a:hover {
	opacity: 0.8;
}

#topnav a:active {
	background: white;
	color: #08a600;
}

.title {
	position: absolute;
	right: 47.75%;
	text-decoration: none;
	color: black;
	padding-top: 10px;
}

#toptop{
	background: white;
	width:100%;
	height:130px;
}

</style>
</head>
<!--  <c:url value="/indexHome"/> -->
<body>
	<div id="toptop">
		<div class="title">
			<a href="<c:url value="/indexHome"/>"><img style="width: 80px" src="<c:url value="/img/voc_logo.png"/>"></a>
		</div>

		<div class="right">
			<a id="kakao-link-btn" href="javascript:;"><img style="width: 50px; float: right; margin: 15px" src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"></a>
			<a href="/adminLogin"><img style="width: 50px; float: right; margin: 15px" src="<c:url value="/img/setting.png"/>"></a>
			<a href="<c:url value="/order/cart"/>"><img style="width: 50px; float: right; margin: 15px" src="<c:url value="/img/cart.png"/>"></a>
			<a href="<c:url value="/member/myPage"/>"><img style="width: 50px; float: right; margin: 15px" src="<c:url value="/img/member.png"/>"></a>
			<%-- <a href="<c:url value="/member/myPage"/>"><img style="width: 45px; float: right; margin: 15px; margin-bottom:4px;" src="https://cdn.icon-icons.com/icons2/37/PNG/512/logout_3622.png"/></a> --%>
		</div>
	</div>

	<div id="topnav">
		<a href="<c:url value="/indexHome"/>">홈</a> 
		<a href="<c:url value='/product/viewCategory' />">상품 보기</a>
		<a href="<c:url value="/bbs/board"/>">게시판</a>

		
		<% if (id != null) { 
			if(id.equals("wang9")) {
		%>
				<a href="<c:url value='/product/search' />">상품 검색</a>
				<a href="<c:url value='/product/register' />">상품 등록</a>
				<a href="<c:url value='/product/viewAll' />">상품 관리</a>
				<a href="<c:url value="/order/orderControl/1&10/all/ALL/1980-01-01&2100-01-01"/>">주문 관리</a> 
		<% 
			}
		%>	
			<a href="<c:url value="/member/myPage"/>">MyPage</a> 
			<a href="<c:url value="/member/memberList"/>">MemberList</a> 
			<a href="<c:url value="/member/logout"/>">로그아웃</a> 
		<% } 
			else { 
		%>
			<a href="<c:url value="/member/regi"/>">회원가입</a> 
			<a href="<c:url value="/member/login"/>">로그인</a>
		<%
			}
		%>		
	</div>

<script type='text/javascript'>
    //JavaScript 키 설정 
	Kakao.init('525d4de5a3ea4dd20b481a373aaaf8ad');
    //카카오링크 버튼 생성
    Kakao.Link.createDefaultButton({
    	container : '#kakao-link-btn',
    	objectType : 'feed',
    	content : {
    		title : 'VOC 쇼핑몰',
    		description : '친구와 함께 쇼핑하고 적립금 받자!',
    		imageUrl : 'http://lp2.hm.com/hmgoepprod?set=width[800],quality[80],options[limit]&source=url[http://www2.hm.com/content/dam/campaign-men-s08/3198e/3198E-Campaign-Small-3x2.jpg]&scale=width[global.width],height[15000],options[global.options]&sink=format[jpg],quality[global.quality]',
    		link : {
    			mobileWebUrl : 'http://ec2-13-125-117-235.ap-northeast-2.compute.amazonaws.com:8080',
    			webUrl : 'http://ec2-13-125-117-235.ap-northeast-2.compute.amazonaws.com:8080'
    		}
    	},
    	social : { 
    		likeCount : 400,
    		commentCount : 101,
    		sharedCount : 41
    	},
    	buttons :[{
    		title : '웹으로 보기',
    		link : {
    			mobileWebUrl : 'http://ec2-13-125-117-235.ap-northeast-2.compute.amazonaws.com:8080/vocProject/',
    			webUrl : 'http://ec2-13-125-117-235.ap-northeast-2.compute.amazonaws.com:8080/vocProject/'
    		}
    	},{
    		title : '앱으로 보기',
    		link : {
    			mobileWebUrl : 'http://ec2-13-125-117-235.ap-northeast-2.compute.amazonaws.com:8080/vocProject/',
    			webUrl :'http://ec2-13-125-117-235.ap-northeast-2.compute.amazonaws.com:8080/vocProject/'
    		}
    		
    	}]
    	
    });
</script>
</body>
</html>
