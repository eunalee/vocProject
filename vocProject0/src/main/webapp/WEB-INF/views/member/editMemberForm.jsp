<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="../index.jsp" flush="false" />

<!DOCTYPE html>
<html>
<link href="<c:url value="/css/RegisterForm.css"/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<head>
<title>VOC : 회원정보 수정</title>
<style>
body {
	background: white;
}

.box {
	border-color: black;
}

#header h1 {
	margin: 30px auto;
	text-align: center;
}

#send {
	background: black;
}

#birth input {
	width: 430px;
	border-color: black;
	text-align: center;
}

.gender-box {
	border-color: black;
}

#phone {
	color: black;
}

#phoneBox {
	width: 440px;
}

.gender-box>div {
	border: 1px solid black;
}

#idBox, #id, #pwdBox, #pwd {
	background: #ccc;
}
</style>
</head>

<body>
	<jsp:include page="../mypageSideBar.jsp" flush="false" />
	<div
		style="border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: gray;">

	</div>
	<div id="naver">
		<div id="header">
			<h1>회원정보 수정</h1>
		</div>
		<div id="container">

			<form name="Regi"
				action="<%=request.getContextPath()%>/member/editMember"
				method="post" onsubmit="return checkValue()"
				enctype="multipart/form-data">
				<label for="id">ID</label>
				<div id="idBox" class="box">
					<input type="text" id="id" name="id" class="input"
						value="${member.id}" readonly>
				</div>
				<p id="redCheck_id" class="redCheck"></p>

				<label for="pwd">비밀번호</label>
				<div id="pwdBox" class="box">
					<input type="password" id="pwd" name="pwd" class="input"
						value="${member.pwd}" readonly> <img
						src="https://static.nid.naver.com/images/ui/join/pc_icon_pass_180417.png">
				</div>
				<p id="redCheck_pwd" class="redCheck"></p>


				<label for="name">이름</label>
				<div id="nameBox" class="box">
					<input type="text" id="name" name="name" class="input"
						value="${member.name}">
				</div>
				<p id="redCheck_name" class="redCheck"></p>

				<div id="photoBox">
					<label>프로필 사진</label> <input type="file" value="프로필 사진 찾기"
						name="photoFile" value="${member.photo}">
				</div>
				<br> <label>생년월일</label>
				<div id="birth">
					<input type="date" name="birth" class="input"
						value="${member.birth}">
				</div>
				<p id="redCheck_birth" class="redCheck"></p>

				<label>성별</label>
				<div class="gender-box box1">
					<div>
						<input type="radio" id="man" name="gender" value="M"> <label
							for="man">남자</label>
					</div>
					<div>
						<input type="radio" id="woman" name="gender" value="F" checked>
						<label for="woman">여자</label>
					</div>
				</div>
				<br> <label for="email">본인 확인 이메일</label>
				<div id="email" class="box">
					<input type="text" name="email" placeholder="필수입력" class="input"
						value="${member.email}">
				</div>
				<p id="redCheck_email" class="redCheck"></p>

				<label for="phone">휴대전화</label>
				<div id="phoneBox" class="box">
					<input type="text" id="phone" name="phone" class="input"
						placeholder="전화번호 입력" value="${member.phone}">
				</div>

				<label for="zipcode">우편번호</label> <input type="button"
					value="우편번호검색" onclick="checkPost()">
				<div class="box">
					<input type="text" id="zipcode" name="zipcode" class="input" value="${member.zipcode}">
				</div>

				<label for="address">주소</label>
				<div class="box">
					<input type="text" id="address" name="address" class="input" value="${member.address}">
				</div>

				<input type="submit" id="send" value="수정하기">
				<input type="button" id="send" value="비밀번호 변경하기"
					onclick="location.href='<%=request.getContextPath()%>/member/changePwd'">
			</form>
		</div>
		<div id="footer">
			<ul>
				<li><a href="#">이용약관 </a></li>
				<li><a href="#">개인정보처리방침 </a></li>
				<li><a href="#">책임의 한계와 법적고지 </a></li>
				<li><a href="#">회원정보 고객센터</a></li>
			</ul>

			<%-- <img src="<c:url value="/img/footernaver.JPG"/>"> --%>
			<label>Copyright <b>Naver Crop.</b> All Rights Reserved.
			</label>

		</div>
	</div>
</body>

</html>


<script>
	
    $(document).ready(function(){
        var idReg=/^[A-za-z0-9]{5,20}$/g;
        var pwdReg=/^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
        var nameReg=/^[가-힣a-zA-Z]+$/;
        var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        /*name*/
         $('#name').focusin(function(){
            $('#nameBox').css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#name').focusout(function(){
            $('#nameBox').css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_name').html("필수 정보입니다.").css('color','red');
            
            }else{
               if(!nameReg.test($(this).val())){
                   $('#redCheck_name').html("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)").css('color','red');
                }else{
                    $('#redCheck_name').html(" ");
                }
            }
        });
        
        
        /*생년월일*/
        $('#birth input').focusin(function(){
            $(this).css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#birth input').focusout(function(){
            $(this).css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_birth').html("필수 정보입니다.").css('color','red');
            }else{
                $('#redCheck_birth').html(" ");
            }
        });
        
        
        /*이메일*/
        $('#email input').focusin(function(){
            $('#email').css('border','1px solid #08a600');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#email input').focusout(function(){
            $('#email').css('border','1px solid rgb(218, 218, 218)');
            
            if($(this).val()==null || $(this).val().trim(" ").length==0){
                $('#redCheck_email').html("필수 정보입니다.").css('color','red');
            
            }else{
                 if(!emailReg.test($(this).val())){
                       $('#redCheck_email').html("이메일 주소를 다시 확인해주세요.").css('color','red');
                    }else{
                        $('#redCheck_email').html(" ");
                    }
            }
        });
        
        
        /*전화번호*/
        $('#phone').focusin(function(){
            $('#phoneBox').css('border','1px solid #08a600');
        });
        
        $('#phone').focusout(function(){
            $('#phoneBox').css('border','1px solid rgb(218, 218, 218)');
        });
        
        /*포커스 아웃. 유효성 검사*/
        $('#phoneBtn').click(function(){
            
            if($('#phone').val()==null || $('#phone').val().trim(" ").length==0){
                $('#redCheck_phone').html("필수 정보입니다.").css('color','red');
            }else{
                if(!($('#phone').val().length==10 || $('#phone').val().length==11)){
                   $('#redCheck_phone').html("형식에 맞지 않는 번호 입니다.").css('color','red');
                }else{
                    $('#redCheck_phone').html(" ");
                    $('#serialPhone').css('background', '#fff');  
                    $('#serialBox').css('background', '#fff');  
                }
            }
        });

    });
    
    function checkValue(){
    	if(!document.Regi.name.value){
    		alert("이름을 입력하세요.");
    	    return false;
    	}
    	
    	if(!document.Regi.id.value){
    		alert("아이디를 입력하세요.");
    		return false;
    	}
    	
    	if(document.Regi.id.value.indexOf(" ")>=0){
    		alert("아이디에 공백을 사용할 수 없습니다.");
    		return false;
    	}
    	
    	if(document.Regi.id.value.length<4 || document.Regi.id.value.length>12){
    		alert("아이디를 4~12자까지 입력해주세요.");
    		return false;
    	}
    	
    	if(!document.Regi.pwd.value){
    		alert("비밀번호를 입력하세요.");
    		return false;
    	}
    	
    	if(document.Regi.id.value == document.Regi.pwd.value){
    		alert("아이디와 비밀번호가 같습니다.");
    		return false;
    	}
    	
    	if(document.Regi.pwd.value != document.Regi.checkpwd.value){
    		alert("비밀번호를 동일하게 입력하세요.");
    	    return false;
    	}
    	
    	if(!document.Regi.phone.value){
    		alert("핸드폰 번호를 입력하세요.");
    		return false;
    	}
    	
    	if(!document.Regi.email.value){
    		alert("이메일을 입력하세요.");
    		return false;
    	}
    	
    	if(!document.Regi.address.value){
    		alert("주소를 입력하세요.");
    		return false;
    	}
    	
    }
    
	function idCheck(){
    	
    	if(document.Regi.id.value!=null && document.Regi.id.value.trim(" ").length>0){
    	var value = document.Regi.id.value;
    	window.open('<%=request.getContextPath()%>/member/idcheck/' + value);
    	}else{
    		alert("ID를 입력해주세요.");
    	}
    }
	
	function checkPost(){   //우편번호 체크
	    var width=500;
	    var height=600;
	    
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data){
	                $('#zipcode').val(data.postcode);
	                $('#address').val(data.address);
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


