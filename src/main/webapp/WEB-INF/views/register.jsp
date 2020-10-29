<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="header.jsp"%>
<html>
<head>
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<form method="POST" id="fom" action="/register.do"
		style="background-color: white; width: 100%; height: 760px;">

		<div
			style="background-color: white; width: 105%; height: 670px; padding-right: 35%; padding-top: 115px; padding-left: 35%;">

			<div>
				<h2>회원가입</h2>
			</div>

			<!-- 아이디 -->
			<div class="form-group">

				<label for="user_id" style="color: black;">아이디</label> 
				<input type="text" class="form-control" id="userid" name="userid"
					placeholder="ID" required>
				<input type="button" id="check" value="중복체크">
				<p colspan=3 id="idCheck"></p>
			</div>
			<!-- 비밀번호 -->
			<div class="form-group">
				<label for="user_pw" style="color: black;">비밀번호</label> <input
					type="password" class="form-control" id="userpw" name="userpw"
					placeholder="PASSWORD" required>
				<div class="check_font" id="pw_check"></div>
			</div>
			<!-- 비밀번호 재확인 -->
			<div class="form-group">
				<label for="user_pw2" style="color: black;">비밀번호 확인</label> <input
					type="password" class="form-control" id="userpw2" name="userpw2"
					placeholder="Confirm Password" required>
				<div class="check_font" id="pw2_check"></div>
			</div>
			<!-- 이름 -->
			<div class="form-group">
				<label for="user_name" style="color: black;">이름</label> <input
					type="text" class="form-control" id="username" name="username"
					placeholder="Name" required>
				<div class="check_font" id="name_check"></div>
			</div>
			<!-- 본인확인 이메일 -->
			<div class="form-group">
				<label for="user_email" style="color: black;">이메일</label> <input
					type="text" class="form-control" name="email" id="email"
					placeholder="E-mail" required>
				<div class="check_font" id="email_check"></div>
			</div>
			<!-- 휴대전화 -->
			<div class="form-group">
				<label for="user_phone" style="color: black;">휴대전화 ('-' 없이
					번호만 입력해주세요)</label> <input type="text" class="form-control" 
					id="tel" name="tel" placeholder="Phone Number" required>
			</div>

			<div class="reg_button" style="padding-left: 520px;">
				<button class="btn btn-primary px-3" id="reg_submit">가입
				</button>
			</div>

		</div>
		    <input type="hidden" name="${_csrf.parameterName}"
    value="${_csrf.token}" />
	</form>

<script type="text/javascript">
	$(document).ready(function(e){
		
		var idx = false;
		
		$('#reg_submit').click(function(){
			if($.trim($('#userid').val()) == ''){
				alert("아이디 입력");
				$('#userid').focus();
				return;
			}else if($.trim($('#userpw').val()) == ''){
				alert("패스워드 입력");
				$('#userpw').focus();
				return;
			}
			//패스워드 확인
			else if($('#userpw').val() != $('#userpw2').val()){
				alert('패스워드가 다릅니다.');
				$('#userpw').focus();
				return;
			}
			
			if(idx==false){
				alert("아이디 중복체크를 해주세요.");
				return;
			}else{
				$('#fom').submit();
			}
		});
		
		$('#check').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/idCheck.do",
				type: "GET",
				data:{
					"userid":$('#userid').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#userid').val()) != '' ){
						idx=true;
						$('#userid').attr("readonly",true);
						var html="<p colspan='3' style='color: green'>사용가능</p>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
					else{
						var html="<p colspan='3' style='color: red'>사용불가능한 아이디 입니다.</p>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
					
				}
			});
			

		});
		
	});
</script>

</body>
</html>
<%@include file="footer.jsp"%>