<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/header.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style>
body {
	margin: 0;
	height: 100%;
}

.content {
	margin: 25px 30px;
}

body {
	margin: 0;
	height: 100%;
}

.content {
	margin: 25px 30px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.payment_info {
	width: 100%;
	margin-top: 25px;
}

fieldset {
	margin: 50px;
	padding: 0 10px 10px;
	border: 1px solid #999999;
}

legend {
	padding: 4px 4px;
	background: #fff;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
}

.info_check {
	text-align: right;
	padding: 10px;
}

#zipcodebtn {
	border: none;
	color: white;
	background-color: #555555;
	width: 100px;
	height: 30px;
	text-align: center;
}

input[type=submit] {
	border: none;
	color: white;
	background-color: #555555;
	width: 100%;
	height: 40px;
}
</style>
</head>
<body>
	<jsp:include page="../index.jsp" flush="false" />


	<!-- 페이지 컨텐츠 -->
	<div class="content" style="width: 1300px; margin: auto">
		<fieldset id="product">
			<legend>주문내역</legend>
			<table>
				<c:set var="orderTotal" value="0"/>
				<tr>
					<td>상품번호</td>
					<td>상품이름</td>
					<td>수량</td>
					<td>옵션</td>
					<td>가격</td>
					<td>총합</td>
				</tr>
				<c:set var="orderTotal" value="0" />
				<c:forEach var="product" items="${productList}" varStatus="status">
					<tr>
						<c:set var="orderTotal"
							value="${orderTotal + product.productPrice * product.productQuantity }" />
						<td>${product.productKey }</td>
						<td>${product.productName }</td>
						<td>${product.productQuantity }</td>
						<td>${product.productOption }</td>
						<td>${product.productPrice }</td>
						<td>${product.productPrice * product.productQuantity }
					</tr>
				</c:forEach>
			</table>

			<div class="payment_info">
				Total : ${orderTotal} <input type="hidden" name="orderTotal"
					value="${orderTotal }"><br>
			</div>

		</fieldset>

		<fieldset id="order">
			<legend>주문자 정보</legend>
			<input type="hidden" name="ju_name" value=""> <input
				type="hidden" name="cart_length" value=""> <input
				type="hidden" name="total" value="">
			<div class="container">
				<label> 아이디 <input type="text" id="member-id"
					name="delivery-id" value="${member.id}" disabled="disabled"><br>
					<br>
				</label> <label> 휴대폰<input type="text" id="member-tel"
					name="delivery-tel" value="${member.phone }" disabled="disabled"><br>
					<br>
				</label> <label> 우편번호<input type="text" id="member-zip"
					name="delivery-post" value="${member.zipcode }" disabled="disabled"><br>
					<br>
				</label> <label> 주소<input type="text" id="member-address"
					name="delivery-address" value="${member.address }"
					disabled="disabled"><br> <br>
				</label>
			</div>
		</fieldset>

		<form action="${pageContext.request.contextPath}/order/insertOrder" method="POST">
			<fieldset id="delivery">
				<legend>배송 정보</legend>
				<div class="info_check">
					<input type="checkbox" id="check" onclick="copy()">주문자와 동일
				</div>

				<div class="container">
					<label> 아이디 <input type="text" id="orderName"
						name="orderName" required><br> <br>
					</label> <label> 휴대폰<input type="text" id="orderPhone"
						name="orderPhone" required><br> <br>
					</label> <label> 우편번호<input type="text" id="zipcode" name="zipcode" value=""><input
						type="button" id="zipcodebtn" value="우편번호찾기" onclick="checkPost()"><br>
						<br>
					</label> <label> 배송지 주소<input type="text" id="orderAddress"
						name="orderAddress" value="" required><br> <br>
					</label> <label> 기타사항<input type="text" id="orderOption"
						name="orderOption" required><br> <br>
					</label> <label> 결제방법 <select name="orderPay">
							<option>체크/신용카드</option>
							<option>계좌이체</option>
							<option>휴대폰 간편결제</option>
					</select> <br> <br>
					</label> <input type="submit" id="okbtn" value="Ok">
				</div>
			</fieldset>
		</form>
	</div>
	<script>
      function copy() {
         if(document.getElementById("check").checked) {
            document.getElementById("orderName").value = document.getElementById("member-id").value;
            document.getElementById("orderPhone").value = document.getElementById("member-tel").value;
            document.getElementById("zipcode").value = document.getElementById("member-zip").value;
            document.getElementById("orderAddress").value = document.getElementById("member-address").value;
         }
         else{
        	 document.getElementById("orderName").value = "";
        	 document.getElementById("orderPhone").value = document.getElementById("member-tel").value;
             document.getElementById("zipcode").value = "";
             document.getElementById("orderAddress").value = "";
         }
      }
      
      function checkPost(){   //우편번호 체크
  	    var width=500;
  	    var height=600;
  	    
  	    daum.postcode.load(function(){
  	        new daum.Postcode({
  	            oncomplete: function(data){
  	                $('#zipcode').val(data.postcode);
  	                $('#orderAddress').val(data.address);
  	            }
  	        }).open({
  	            left: (window.screen.width/2)-(width/2),
  	            top: (window.screen.height/2)-(height/2)
  	        });
  	    });
  	}
  	</script>
  	 
  	<!-- 우편번호 찾기 -->
  	<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	
	<jsp:include page="../footer.jsp" flush="false" />
</body>

</html>

