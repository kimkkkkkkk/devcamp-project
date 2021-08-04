<%@page import="com.koreait.meeting.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Board> boardList= (List)request.getAttribute("boardList");
%>
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
  <link href="/resources/assets/css/custom.css" rel="stylesheet">

<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
  position:relative;
  left:-1000px;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  
  color: gray;
}

#btn{
 background: linear-gradient(45deg, #1de099, #1dc8cd);
 color: white;
 border: none;
 padding: 12px 25px;
 border-radius: 4px;
 width: 100px;
 height: 45px;
 cursor: pointer;
}
#btn:hover {
  background: pink;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
    var table = $("table");  
    table.animate({left: '0px'}, "slow");	
});
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
  <script src="/resources/assets/js/custom.js"></script>
<div id="boardContent">
<h2>게시판 목록</h2>
	<table>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<%for(Board board : boardList){ %>
		<tr>
			<td><%=board.getProfile_id()%></td>
			<td><a href="/board/detail?board_id=<%=board.getBoard_id()%>"><%=board.getTitle()%></a></td>
			<td><%=board.getProfile_id()%></td>
			<td><%=board.getRegdate()%></td>
			<td><%=board.getHit()%></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="5">
				<button id="btn" onClick="location.href='/board/registform';">Regist</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>
