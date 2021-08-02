<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ollang Ollang Member Chat</title>
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
 
 body{
 	margin-top: 120px;
 	margin-left: 200px;
 
 }
 
 #btn1, #btn2, #btn3, #btn4{
 	background: linear-gradient(45deg, #1de099, #1dc8cd);
 	color : white;
 	border-radius: 5px;
 	border: none;
 	margin-top:30px;
 }
 
 #messageinput{
 	width: 500px;
 }
 
  
 </style>
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

    <div>
        <button type="button" onclick="openSocket();" id="btn3">대화방 참여</button>
        <button type="button" onclick="closeSocket();" id="btn4">대회방 나가기</button>
    	<br/><br/><br/>
  		메세지 입력 : 
        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
        <input type="text" id="messageinput">
        <button type="button" onclick="send();" id="btn1">메세지 전송</button>
        <button type="button" onclick="javascript:clearText();" id="btn2">대화내용 지우기</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages">
    </div>
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws = new WebSocket("ws://localhost:8888/echo.do");
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            ws.onclose = function(event){
                writeResponse("대화 종료");
            }
            
        }
        
        function send(){
           // var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
            ws.send(text);
            text = "";
        }
        
        function closeSocket(){
            ws.close();
        }
        
        function writeResponse(text){
            messages.innerHTML += "<br/>"+text;
        }

        function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	}
        
  </script>
</body>
</html>