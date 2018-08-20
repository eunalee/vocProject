<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../index.jsp" flush="false" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	li {  
		list-style: none;  
    	float: left;  
	}
	
	#container {
		border: 1px solid black;
	 	margin: 50px;
	 	padding: 30px;
	}
	
	#menu {
		margin-left: auto;
		margin-right: auto;
		
		width: 100%;
		height: 90px;
	}
	
	#menu td:nth-child(2n+1) {
		background-color: #555555;
		color: white;
		
		text-align: center;
		
		height: 50%;
	}
	
	input[type=text], input[type=date], select {
		height: 30px;
	}
	
	input[type=button] {
		border: none;
		
		color: white;
		background-color: #555555;
		
		margin-top: 20px;
		padding: 10px;
		
		margin-left: 50%;
	}
	
	#product {
		margin-top: 50px;
		
		width: 100%;
		height: 100px;
		
		text-align: center;
	}
	
	#product th {
		background-color: #555555;
		color: white;
		
		font-weight: normal;
		
		height: 50px;
	}
	
	#product tr, #product td {
		border-bottom: 1px solid #ddd;
	}
	
	#paging li {  
    	float: left; 
    	
    	margin: 0 auto;
	}
	
	#paging li a {  
		width:15px; 
	
    	float: left; 
    	 
    	padding: 4px;  
    	margin-right: 5px; 
    	 
    	font-weight: bold;  
    	
    	color: black;
    	
    	border: 1px solid #ddd;
    	
    	text-align: center;  
    	text-decoration: none;  
	}
</style>
</head>
<body>
<div id="container">
   <form>
      <table id="menu">
         <tr>
            <td>카테고리</td>
            <td>
               <select id="productCategory" name="productCategory">
                  <option value="Bath">Bath</option>
                  <option value="Tech">Tech</option>
                  <option value="Apparel">Apparel</option>
               </select>
            </td>
         </tr>
         
         <tr>
            <td>상품 등록일자</td>
            <td>
            	<input type="date" id="productRegDateFrom"> - <input type="date" id="productRegDateTo">
            </td>
         </tr>
      </table>
      
      <input type="button" value="검색" id="search">
   </form>
   
   <br>
   
   <table id="product">
   		<tr>
   			<th>&nbsp;&nbsp;</th>
   			<th>상품 ID</th>
   			<th>상품명</th>
   			<th>카테고리</th>
   			<th>판매가</th>
   			<th>가격</th>
   			<th>할인율</th>
   			<th>수량</th>
   			<th>제조사</th>
   			<th>상세설명</th>
   			<th>등록일자</th>
   		</tr>
   	
   		<tbody id="result">
   			<tr>
   				<td colspan="12" style="height: 50px;">등록된 상품이 없습니다.</td>
   			</tr>
   		</tbody>
   	</table>
   	
   	<ul id="paging"></ul>
</div>
</body>
<script>
   $(document).ready(function() {
      $('#search').click(function() {
         var category = $('#productCategory option:selected').val();
         var regDateFrom = $('#productRegDateFrom').val();
         var regDateTo = $('#productRegDateTo').val();
         
         if(regDateFrom.length == 0 || regDateTo.length == 0)
        	 alert('등록 일자를 선택해주세요.');
         
         else {
        	 $.ajax({
        		 type : 'GET',
                 data : 'category=' + category + '&regDateFrom=' + regDateFrom + '&regDateTo=' + regDateTo,
                 dataType : 'json',
                 url : '<c:url value='/product/productList.json' />',
                 
                 success : function(data) {
                	 $('#result').empty();
                	 
                	 var result = document.getElementById("result");
                	 result.innerHTML ="";
                	 
                	 var str = '';
                	 
                	 for(var i=0; i<data.length; i++) {
                		 var sale = parseInt(data[i].productSale);
                		 var price = parseInt(data[i].productPrice);
                		 
                		 str += '<tr>'+'<td><img src="${pageContext.request.contextPath}/file/productPhoto/' + data[i].productImg + '"></td>';
                		 str += '<td>' + data[i].productId + '</td>';
                		 str += '<td>' + data[i].productName + '</td>';
                		 str += '<td>' + data[i].productCategory + '</td>';
                		 str += '<td>' + '￦' + price*(100-sale)/100 + '</td>';
                		 str += '<td>' + '￦' + price + '</td>';
                		 str += '<td>' + sale + '%' + '</td>';
                		 str += '<td>' + data[i].productQuantity + '</td>';
                		 str += '<td>' + data[i].productMade + '</td>';
                		 str += '<td>' + data[i].productDesc + '</td>';
                		 str += '<td>' + data[i].productRegDate + '</td>';
                		//str += '<td><a href="${pageContext.request.contextPath}/product/edit/' + product[i].productId + '">수정</a> / ' + '<a href="${pageContext.request.contextPath}/product/delete/' + product[i].productId + '">삭제</a></td>' + '</tr>';
                	}
                	 result.innerHTML += str; 
                },
                 
                 error : function(request, status) {
                    alert('처리 실패!' + request.status);
                 }
              });
         }
      }); 
   });
</script>
</html>