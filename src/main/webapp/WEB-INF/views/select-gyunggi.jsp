<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Day - HTML Bootstrap Template</title>

  <!-- Bootstrap -->
  <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="../resources/css/font-awesome.min.css">
  <link rel="stylesheet" href="../resources/css/animate.css">
  <link href="../resources/css/animate.min.css" rel="stylesheet">
  <link href="../resources/css/style.css" rel="stylesheet" />


<style>

	.list{
	
	margin-right:100px;
	}
  
  </style>


</head>

<body>
  <header id="header">
    <nav class="navbar navbar-default navbar-static-top" role="banner">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
          <div class="navbar-brand">
            <a href="/home" ><h1>Fleas</h1></a>
          </div>
        </div>
        
        <div class="navbar-collapse collapse">
          <div class="menu">
            <ul class="nav nav-tabs" role="tablist">
             <li class="list" role="presentation"><a href="/home" >Home</a></li>
              <li class="list" role="presentation"><a href="/select"  class="active">lookup</a></li>
              <li class="list" role="presentation"><a href="/mypage">MyPage</a></li>
              <li class="list" role="presentation"><a href="/login">login & sign up</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!--/.container-->
    </nav>
    <!--/nav-->
  </header>
  <!--/header-->

<nav>
 <form class="form-inline" style="float:right; margin-right:60px; margin-top:20px;">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="width:260px;"/>
    
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin-top:0px;">Search</button>
    
  </form>
</nav>




<div>
<center style="margin-top:170px;">
<h2 style="color:black; font-size:28px;">축제프리마켓 정보 조회</h2>
      <p style="font-size:20px;">경기도</p>

  <div class="dropdown" style="margin-top:30px; margin-bottom:-50px;">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" 
  aria-haspopup="true" aria-expanded="false" style="background-color:white; border:2px solid grey; color:black;">
    지역 선택
  </button>

  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="margin-left:800px;">
     <li><a class="dropdown-item" href="/select">서울시</a></li>
    <li><a class="dropdown-item" href="/select-gyunggi">경기도</a></li>
    <li><a class="dropdown-item" href="#">강원도</a></li>
    <li><a class="dropdown-item" href="#">충청도</a></li>
    <li><a class="dropdown-item" href="#">경상도</a></li>
    <li><a class="dropdown-item" href="#">전라도</a></li>
    <li><a class="dropdown-item" href="#">제주도</a></li>
  </div>
</div>
</center>
</div>

  <div class="gallery">
    <div class="text-center" style="padding-top:36px;">
   

    </div>
    
    <div class="container" style="width:100%; padding-left:100px; padding-top:50px;">  
      
      <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >	<!-- 틀 위. hover -->
          <figcaption style="height:240px;">	<!-- 틀 -->
            <h4 style="width:220px;">축제(플리마켓)명 <br>+개최자가 올린 이미지</h4>
            <p style="width:220px;">플리마켓 기간</p>
          </figcaption>
        </figure>        
      </div>
      
     
      <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >	<!-- 틀 위. hover -->
          <figcaption style="height:240px;">	<!-- 틀 -->
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>        
      </div>
      
      
    
      <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>      
      </div>
      
      
      <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>        
      </div>
      
      <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>       
      </div>     
    </div>


    <div class="container" style="width:100%; padding-left:100px; padding-top:50px;">
    
    <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>        
      </div>
      
      
  <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>                      
      </div>
      
      
        <div class="col-md-4" style="width:300px;">
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>     
        </figure>
        
        
      </div>
        <div class="col-md-4" style="width:300px;"> 
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>      
        </figure>
        
        
      </div>
        <div class="col-md-4" style="width:300px;"> 
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>        
      </div>
      
      
    </div>
    
    <div class="container" style="width:100%; padding-left:100px; padding-top:50px;">
    
    <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>        
      </div>
      
      
  <div class="col-md-4" style="width:300px;">      
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>                      
      </div>
      
      
        <div class="col-md-4" style="width:300px;">
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>     
        </figure>
        
        
      </div>
        <div class="col-md-4" style="width:300px;"> 
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>      
        </figure>
        
        
      </div>
        <div class="col-md-4" style="width:300px;"> 
        <figure class="effect-marley" >	
          <figcaption style="height:240px;">
            <h4 style="width:220px;">sweet marley</h4>
            <p style="width:220px;">Marley tried to convince her but she was not interested.</p>
          </figcaption>          
        </figure>        
      </div>
      
      
    </div>
    
  </div>
  
 <center>
<h4>페이징처리</h4>
</center>

  <footer>
    <div class="container">
      <div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
        <h4>About Us</h4>
        <p>Day is tellus ac cursus commodo, mauesris condime ntum nibh, ut fermentum mas justo sitters.</p>
        <div class="contact-info">
          <ul>
            <li><i class="fa fa-home fa"></i>Suite 54 Elizebth Street, Victoria State Newyork, USA </li>
            <li><i class="fa fa-phone fa"></i> +38 000 129900</li>
            <li><i class="fa fa-envelope fa"></i> info@domain.net</li>
          </ul>
        </div>
      </div>

      <div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
        <div class="text-center">
          <h4>Photo Gallery</h4>
          <ul class="sidebar-gallery">
            <li><a href="#"><img src="../resources/img/gallery1.png" alt="" /></a></li>
            <li><a href="#"><img src="../resources/img/gallery2.png" alt="" /></a></li>
            <li><a href="#"><img src="../resources/img/gallery3.png" alt="" /></a></li>
            <li><a href="#"><img src="../resources/img/gallery4.png" alt="" /></a></li>
            <li><a href="#"><img src="../resources/img/gallery5.png" alt="" /></a></li>
            <li><a href="#"><img src="../resources/img/gallery6.png" alt="" /></a></li>
          </ul>
        </div>
      </div>

      <div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms">
        <div class="">
          <h4>Newsletter Registration</h4>
          <p>Subscribe today to receive the latest Day news via email. You may unsubscribe from this service at any time</p>
          <div class="btn-gamp">
            <input type="email" class="form-control" id="exampleInputEmail3" placeholder="Enter Email">
          </div>
          <div class="btn-gamp">
            <a type="submit" class="btn btn-default">Subscribe</a>
          </div>

        </div>

      </div>
  </footer>

  <div class="sub-footer">
    <div class="container">
      <div class="social-icon">
        <div class="col-md-4">
          <ul class="social-network">
            <li><a href="#" class="fb tool-tip" title="Facebook"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#" class="twitter tool-tip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#" class="gplus tool-tip" title="Google Plus"><i class="fa fa-google-plus"></i></a></li>
            <li><a href="#" class="linkedin tool-tip" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
            <li><a href="#" class="ytube tool-tip" title="You Tube"><i class="fa fa-youtube-play"></i></a></li>
          </ul>
        </div>
      </div>

      <div class="col-md-4 col-md-offset-4">
        <div class="copyright">
          &copy; Day Theme. All Rights Reserved.
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Day
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../resources/js/jquery.min.js"></script>
  <script src="../resources/js/jquery-migrate.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../resources/js/bootstrap.min.js"></script>
  <script src="../resources/js/wow.min.js"></script>
  <script>
    wow = new WOW({}).init();
  </script>

</body>

</html>
