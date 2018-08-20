<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Check duplicated ID</title>
<style>
   input[type=submit], input[type=button]{
        background-color:black;
        color:white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        text-align: center;
    }
    
    input[type=text]{
        width:100%;
        padding: 10px 20px;
        margin: 8px 0;
        display:inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    button:hover{
        opacity:0.8;
    }

    span{
        color: gray;
        font-size: 11pt;
        font-weight: normal;
    }

    .middle{
    	width : 350px;
    	height : 275px;
        background-color:white;
        padding: 5px;
        border: 1px solid #ccc;
    }

    h1{
        text-align: center;
    }
</style>
</head>

<body>
<% 
  request.setCharacterEncoding("utf-8");
  boolean result = (boolean)request.getAttribute("result");
%>

<div class="middle">
    <h1>ID Check</h1><br>
    
<%if(result==false){%>
   <h1><span>${id}는 이미 사용중인 아이디입니다</span></h1><br>
   
   <h1><span>다른 아이디를 선택하세요</span></h1><br>
   
   <form action="<%=request.getContextPath()%>/member/idcheck/" method="post" name="checkForm" >
   <input type="text" name="id" placeholder="ID"><br>
   <input type="submit" value="중복ID 확인">
   </form>
   
<%}else{%>
   <h1><span> ${id}는 사용 가능한 ID입니다</span></h1><br>
   <input type="button" id="close" value="닫기" onclick="setid()">
 
 <%} %>

<script>
 function setid(){
	 opener.document.Regi.id.value="${id}";
	 self.close();
 }
</script>
</div>
</body>
</html>