<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@include file="header.jsp"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>로그인</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<h1>로그인 페이지</h1>
	  <h2><c:out value="${error}"/></h2>
  <h2><c:out value="${logout}"/></h2>
	<hr/>
	  <form method='post' action="/login">
  <div>
  <label>아이디 : </label>
    <input type='text' name='username' id="username" placeholder="ID">
  </div>
  <div>
    <label>비밀번호 : </label>
    <input type='password' name='password' id="password" placeholder="PASSWORD">
  </div>
  <div>
    <input type='checkbox' name='remember-me'> Remember Me
  </div>

  <div>
    <input type='submit' id="login" value="로그인">
  </div>
    <input type="hidden" name="${_csrf.parameterName}"
    value="${_csrf.token}" />
  
  </form>
	
	
</body>
<script type="text/javascript">
	$(document).ready(function(e){
		$('#login').click(function(){

			// 입력 값 체크
			if($.trim($('#username').val()) == ''){
				alert("아이디를 입력해 주세요.");
				$('#username').focus();
				return;
			}else if($.trim($('#password').val()) == ''){
				alert("패스워드를 입력해 주세요.");
				$('#password').focus();
				return;
			}
			
		});
		
	});
</script>
</html>
<%@include file="footer.jsp"%>