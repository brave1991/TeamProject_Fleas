<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Bootstrap -->
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet" />

<script src="https://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<!-- =======================================================
    Theme Name: Day
    Theme URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
</head>

<body>
	<header id="header">
		<nav class="navbar navbar-default navbar-static-top" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="navbar-brand">
						<a href="/"><h1>FleaS</h1></a>
					</div>
				</div>
				<div class="navbar-collapse collapse">
					<div class="menu">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation"><a href="/" class="active">Home</a></li>
							<li role="presentation"><a href="/getFlealist.do">찾아보기</a></li>
							<li role="presentation"><a href="/fleaform.do">올리기</a></li>
							<li role="presentation"><a href="/mypage.do">마이페이지</a></li>
							<sec:authorize access="isAuthenticated()">
								<li><span>Hello, <b> <sec:authentication
											property="principal.username" /></b>
								</span>
								<a href="#"
									onclick="document.getElementById('logout-form').submit();">
									<span class="fa fa-sign-out"></span>&nbsp;[로그아웃]
								</a>
								<form id="logout-form" action="<c:url value='/logout'/>"
									method="POST">
									<input name="${_csrf.parameterName}" type="hidden"
										value="${_csrf.token}" />
								</form>
								</li>
							</sec:authorize>
							<sec:authorize access="!isAuthenticated()">
							<li role="presentation"><a href="/login">login</a></li>
							<li role="presentation"><a href="/registerpage.do">register</a></li>
							</sec:authorize>
						</ul>
					</div>
				</div>
			</div>
			<!--/.container-->
		</nav>
		<!--/nav-->
	</header>
	<!--/header-->
</body>

</html>
