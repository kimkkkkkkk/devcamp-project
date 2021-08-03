<%@page import="com.koreait.meeting.domain.Board"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Board board=(Board)request.getAttribute("board");//하위 컨트롤러가 심어놓은 객체를 꺼내기!!
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">

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


<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	CKEDITOR.replace("content");
	
	//버튼에 이벤트 연결하기 
	$("#bt_edit").click(function(){
		if(confirm("수정하시겠어요?")){
			edit();	
		}
	});
	$("#bt_del").click(function(){
		if(confirm("삭제하시겠어요?")){
			del()	
		}
	});
	$("#bt_list").click(function(){
		location.href="/board/list";	
	});	
});

function del(){
	$("form").attr({
		"action":"/board/del",
		"method":"post"
	});	
	$("form").submit();	
}

function edit(){
	$("form").attr({
		"action":"/board/edit",
		"method":"post"
	});	
	$("form").submit();
}


</script>
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
                    <li><a href="#">Male</a></li>
                    <li><a href="#">Female</a></li>
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

<h3>상세보기</h3>

<div class="container">
  <form>
  	<input type="hidden" 	name="board_id"  	value="<%=board.getboard_id()%>">
    <input type="text" 		name="profile_id" 		value="<%=board.getProfile_id()%>">
    <input type="text" 		name="title" 			value="<%=board.getTitle()%>">
    <textarea 					name="content" 	style="height:200px"><%=board.getContent()%></textarea>

    <input type="button" value="수정" id="bt_edit">
    <input type="button" value="삭제" id="bt_del">
    <input type="button" value="목록" id="bt_list">
  </form>
</div>

</body>
</html>





    