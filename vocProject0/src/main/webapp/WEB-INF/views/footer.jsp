<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>footer</title>
<style> 
        body{
            margin: 0px;
        }
        
       #footer {
            margin: 0px;
            margin-bottom:10px;
            padding: 0px;
            text-align: center;
        }
 
        #footer ul {
            padding: 0px;
            margin-top: 30px;
            margin-bottom: 9px;
        }
 
        #footer ul li {
            list-style: none;
            display: inline;
        }
 
        #footer ul li a {
            text-decoration: none;
            padding: 0 4px;
            border-right: 1px solid #ccc;
 
            font-size: 12px;
            color: #333;
        }
 
        #footer img {
            width: 63px;
            margin-bottom: -4px;
        }
 
        #footer label {
            font-size: 10px;
            color: #333;
        }
</style>
</head>
<body>
    <div id="footer">
            <ul>
                <li><a href="#">이용약관 </a></li>
                <li><a href="#">개인정보처리방침 </a></li>
                <li><a href="#">책임의 한계와 법적고지 </a></li>
                <li><a href="#">회원정보 고객센터</a></li>
            </ul>
   
            <img src="<c:url value="/img/footernaver.JPG"/>">
            <label>Copyright <b>Naver Crop.</b> All Rights Reserved.</label>
 
     </div>
</body>
</html>