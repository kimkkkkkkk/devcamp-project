<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Add icon library -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <style>
      * {
        box-sizing: border-box;
      }

      body {
        background: linear-gradient(45deg, #1de099, #1dc8cd);
        padding: 20px;
        font-family: Arial;
      }

      /* Center website */
      .main {
        max-width: 1000px;
        margin: auto;
      }

      h1 {
        font-size: 50px;
        word-break: break-all;
        color: white;
      }

      .row {
        margin: 10px -16px;
      }

      /* Add padding BETWEEN each column */
      .row,
      .row > .column {
        padding: 8px;
      }

      /* Create three equal columns that floats next to each other */
      .column {
        float: left;
        width: 33.33%;
        display: none; /* Hide all elements by default */
      }

      /* Clear floats after rows */
      .row:after {
        content: "";
        display: table;
        clear: both;
      }

      /* Content */
      .content {
        background-color: white;
        padding: 10px;
      }

      /* The "show" class is added to the filtered elements */
      .show {
        display: block;
      }

      /* Style the buttons */
      .btn {
        border: none;
        outline: none;
        padding: 12px 16px;
        background-color: white;
        cursor: pointer;
      }

      .btn:hover {
        background-color: #eff5f5;
      }

      .btn.active {
        background-color: #eff5f5;
        color: white;
      }

      .card {
        background: white;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
      }

      .container {
        padding: 0 16px;
      }

      .container::after,
      .row::after {
        content: "";
        clear: both;
        display: table;
      }

      .title {
        color: grey;
      }

      .button {
        border: none;
        background-color: inherit;
        padding: 14px 28px;
        font-size: 16px;
        cursor: pointer;
        display: inline-block;
        color: red;
      }

      .button:hover {
        background-color: pink;
      }
    </style>
  </head>
  <body>
    <!-- MAIN (Center website) -->
    <div class="main">
      <h1>Ollang Like</h1>
      <hr />

      <h2>Profile Image</h2>

      <div id="myBtnContainer">
        <button class="btn active" onclick="filterSelection('all')">
          사람들
        </button>
        <button class="btn" onclick="filterSelection('likeyou')">
          내가좋아한사람
        </button>
        <button class="btn" onclick="filterSelection('likeme')">
          나를좋아한사람
        </button>
      </div>

      <!-- Portfolio Gallery Grid -->
      <div class="row">
        <div class="column likeyou">
          <div class="card">
            <img
              src="../assets/img/momo1.jpg"
              alt="Jane"
              style="width: 100%"
            />
            <div class="container">
              <h2>Jane Doe</h2>
              <p class="title">CEO & Founder</p>
              <p>Some text that describes me lorem ipsum ipsum lorem.</p>
              <p>example@example.com</p>
              <p>
                <button class="button"><a href="/login.do"></a>1:1 채팅연결</button>
              </p>
            </div>
          </div>
        </div>
        <div class="column likeyou">
           <div class="card">
            <img
              src="../assets/img/momo1.jpg"
              alt="Jane"
              style="width: 100%"
            />
            <div class="container">
              <h2>Jane Doe</h2>
              <p class="title">CEO & Founder</p>
              <p>Some text that describes me lorem ipsum ipsum lorem.</p>
              <p>example@example.com</p>
              <p>
                <button class="button"><a href="/login.do"></a>1:1 채팅연결</button>
              </p>
            </div>
          </div>
        </div>
        <div class="column likeyou">
           <div class="card">
            <img
              src="../assets/img/momo1.jpg"
              alt="Jane"
              style="width: 100%"
            />
            <div class="container">
              <h2>Jane Doe</h2>
              <p class="title">CEO & Founder</p>
              <p>Some text that describes me lorem ipsum ipsum lorem.</p>
              <p>example@example.com</p>
              <p>
                <button class="button"><a href="/login.do"></a>1:1 채팅연결</button>
              </p>
            </div>
          </div>
        </div>
        <div class="column likeme">
           <div class="card">
            <img
              src="../assets/img/momo2.jpg"
              alt="Jane"
              style="width: 100%"
            />
            <div class="container">
              <h2>Jane Doe</h2>
              <p class="title">CEO & Founder</p>
              <p>Some text that describes me lorem ipsum ipsum lorem.</p>
              <p>example@example.com</p>
              <p>
                <button class="button"><a href="/login.do"></a>1:1 채팅연결</button>
              </p>
            </div>
          </div>
        </div>
        <div class="column likeme">
          <div class="card">
            <img
              src="../assets/img/momo2.jpg"
              alt="Jane"
              style="width: 100%"
            />
            <div class="container">
              <h2>Jane Doe</h2>
              <p class="title">CEO & Founder</p>
              <p>Some text that describes me lorem ipsum ipsum lorem.</p>
              <p>example@example.com</p>
              <p>
                <button class="button"><a href="/login.do"></a>1:1 채팅연결</button>
              </p>
            </div>
          </div>
        </div>

        <!-- END GRID -->
      </div>

      <!-- END MAIN -->
    </div>

    <script>
      filterSelection("all");
      function filterSelection(c) {
        var x, i;
        x = document.getElementsByClassName("column");
        if (c == "all") c = "";
        for (i = 0; i < x.length; i++) {
          w3RemoveClass(x[i], "show");
          if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
        }
      }

      function w3AddClass(element, name) {
        var i, arr1, arr2;
        arr1 = element.className.split(" ");
        arr2 = name.split(" ");
        for (i = 0; i < arr2.length; i++) {
          if (arr1.indexOf(arr2[i]) == -1) {
            element.className += " " + arr2[i];
          }
        }
      }

      function w3RemoveClass(element, name) {
        var i, arr1, arr2;
        arr1 = element.className.split(" ");
        arr2 = name.split(" ");
        for (i = 0; i < arr2.length; i++) {
          while (arr1.indexOf(arr2[i]) > -1) {
            arr1.splice(arr1.indexOf(arr2[i]), 1);
          }
        }
        element.className = arr1.join(" ");
      }

      // Add active class to the current button (highlight it)
      var btnContainer = document.getElementById("myBtnContainer");
      var btns = btnContainer.getElementsByClassName("btn");
      for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function () {
          var current = document.getElementsByClassName("active");
          current[0].className = current[0].className.replace(" active", "");
          this.className += " active";
        });
      }
    </script>
  </body>
</html>
