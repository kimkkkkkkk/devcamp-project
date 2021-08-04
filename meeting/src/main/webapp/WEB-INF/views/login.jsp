<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Avilon Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords"> 
  
  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700|Open+Sans:300,300i,400,400i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/venobox/venobox.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/style.css" rel="stylesheet">
  
  
  <!-- custom CSS File -->
  <link href="/resources/assets/css/socustom.css" rel="stylesheet">
  
  
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
	
	<style>
	    body {
	        background: #f8f8f8;
	        padding: 60px 0;
	        margin-top: 200px;
	        margin-left: 500px;
	    }
	    
	    #login-form > div {
	        margin: 15px 0;
  			
	    }
	    
	    .btn{
	      background: linear-gradient(45deg, #1de099, #1dc8cd);
  		  width: 475px;
	    }
	
	</style>
	<title>Home</title>
</head>
<body>

<!-- ======= Header ======= -->
<header id="header" class="header-transparent header-fixed">
  <div class="container">

    <div id="logo" class="pull-left">
      <h1><a href="/admin/main" class="scrollto">Ollang Ollang</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html"><img src="/resources/assets/img/logo.png" alt=""></a> -->
    </div>

    <nav id="nav-menu-container">
      <ul class="nav-menu">
        <li class="menu-active"><a href="/admin/main">Home</a></li>
        
            <li><a href="/board/list">Board</a></li>
            <li><a href="/login.do">Chat</a></li>
            <li class="menu-has-children">
              <a href="">Love Matching</a>
              <ul>
                <li><a href="/profile/registform">My Page</a></li>
                <li class="menu-has-children">
                  <a href="#">Gallery</a>
                  <ul>
                   <li><a href="/profile/gallery">Member</a></li>
                    
                  </ul>
                </li>
                <li><a href="#">Cart</a></li>
              </ul>
            </li>
            <li><a href="/profile/payment">Payment</a></li>
          </ul>
        </nav>
        <!-- #nav-menu-container -->
  </div>
</header><!-- End Header -->

<main id="main">

</main>

<!-- Vendor JS Files -->
  <script src="/resources/assets/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="/resources/assets/vendor/wow/wow.min.js"></script>
  <script src="/resources/assets/vendor/venobox/venobox.min.js"></script>
  <script src="/resources/assets/vendor/superfish/superfish.min.js"></script>
  <script src="/resources/assets/vendor/hoverIntent/hoverIntent.js"></script>
  
  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>

  <!-- Custom Js -->
  <script src="/resources/assets/js/socustom.js"></script>

<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">대화에 사용할 이름을 입력해주세요!</div>
            </div>
            <div class="panel-body">
                <form id="login-form" method="post" action="/loginProcess.do">
                    <div>
                        <input type="text"  name="id"	class="form-control" name="아이디 입력" placeholder="Username" autofocus>
                    </div>
                    <div>
                        <button type="submit" class="btn">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
