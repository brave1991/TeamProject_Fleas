<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
<title>마이페이지</title>
</head>
<body>

<!-- 기능구현 -->

  <div class="services">
    <div class="container" >
      <div class="text-center" style="padding-bottom:310px; padding-top:100px;">
        <h2>My Page</h2>
        <div class="col-md-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
          <i class="fa fa-heart-o"></i>
          <h3>개인정보 수정</h3>
        </div>
        
        <div class="col-md-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">    
          <a href="/mypage/boardcheck">
          <i class="fa fa-book"></i>
          <h3>내가 쓴 글</h3>
          </a>
        </div>
        
        <div class="col-md-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms">
          <i class="fa fa-cloud"></i>
          <h3>플리마켓 개최자 신청</h3>
        </div>
        
        <div class="col-md-3 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="1200ms">
          <i class="fa fa-gear"></i>
          <h3>사업자 번호 등록</h3>
        </div>
        
      </div>
    </div>
    
  </div>

</body>
</html>
<%@include file="../footer.jsp"%>