<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

h2 {
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
</style>
</head>
<body>

<!-- MAIN (Center website) -->
<div class="main">

<h1>Ollang People</h1>
<hr>

<h2>Profile Image</h2>

<div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> Show all</button>
  <button class="btn" onclick="filterSelection('man')"> Man</button>
  <button class="btn" onclick="filterSelection('woman')"> Woman</button>
  <button class="btn" onclick="filterSelection('homosexual')">Homosexual</button>
</div>

<!-- Portfolio Gallery Grid -->
<div class="row">
  <div class="column man">
    <div class="content">
      <img src="../assets/img/momo1.jpg" alt="man" style="width:100%">
      <h4>남자 momo</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column man">
    <div class="content">
    <img src="../assets/img/momo2.jpg" alt="man" style="width:100%">
      <h4>남자 모모2</h4>
      <p>남자 모모2</p>
    </div>
  </div>
  <div class="column man">
    <div class="content">
    <img src="../assets/img/momo3.jpg" alt="man" style="width:100%">
      <h4>남자 모모3</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  
  <div class="column woman">
    <div class="content">
      <img src="../assets/img/momo4.jpg" alt="woman" style="width:100%">
      <h4>여자 모모1</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column woman">
    <div class="content">
    <img src="../assets/img/momo2.jpg" alt="woman" style="width:100%">
      <h4>여자 모모2</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column woman">
    <div class="content">
    <img src="../assets/img/soh3.jpg" alt="woman" style="width:100%">
      <h4>여자 소희1</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>

  <div class="column homosexual">
    <div class="content">
      <img src="../assets/img/soh3.jpg" alt=" homosexual" style="width:100%">
      <h4>여자 소희3</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column homosexual">
    <div class="content">
    <img src="../assets/img/soh3.jpg" alt=" homosexual" style="width:100%">
      <h4>여자 소희3</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
  <div class="column homosexual">
    <div class="content">
    <img src="../assets/img/momo1.jpg" alt=" homosexual" style="width:100%">
      <h4>여자 모모1</h4>
      <p>Lorem ipsum dolor..</p>
    </div>
  </div>
<!-- END GRID -->
</div>

<!-- END MAIN -->
</div>

<script>
filterSelection("all")
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
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
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
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>

</body>
</html>
