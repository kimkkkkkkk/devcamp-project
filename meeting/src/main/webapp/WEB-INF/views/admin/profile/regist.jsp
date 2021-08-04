<%@page import="com.koreait.meeting.domain.ProFile"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	ProFile proFile=(ProFile)request.getAttribute("proFile");
%>
<!DOCTYPE html>
<html>

  <head>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.ckeditor.com/4.16.1/standard/ckeditor.js"></script>
	
    <!-- header start -->
    <%@ include file="../inc/toolbar.jsp" %>
      <!-- custom CSS File -->
  <link href="/resources/assets/css/profilecustom.css" rel="stylesheet">
    <!-- End Header -->
    <main id="main">
      <h4>MyProfile Page</h4>
      <p>본인의 프로필 상세를 등록해주세요.</p>
      <br />

      <div id="container">
        <!-- 이미지 시작 -->
        <!-- The four columns -->
        <div class="picture">
          <div class="picture_row" id="pictureList"></div>
          <div class="picture_swiper">
            <span
              onclick="this.parentElement.style.display='none'"
              class="closebtn"
              >&times;</span
            >
            <img id="expandedImg" />
            <div id="imgtext"></div>
          </div>
        </div>
        <!-- 이미지 끝 -->
        <div class="row">
          <div class="col-75">
            <div class="base_container">
              <form action="/action_page.php">
                <div class="row">
                  <div class="col-50">
                    <label for="fname"
                      ><i class="fa fa-user"></i>NickName</label
                    >
                    <input
                      type="text"
                      id="fname"
                      name="nickname"
                      placeholder="Your name.."
                    />
                    <label for="email"><i class="fa fa-envelope"></i>Age</label>
                    <input
                      type="text"
                      id="email"
                      name="age"
                      placeholder="Your age.."
                    />
                    <label for="adr"
                      ><i class="fa fa-address-card-o"></i> sex</label
                    >
                    <input
                      type="text"
                      id="adr"
                      name="sex"
                      placeholder="Your sex.."
                    />
                    <label for="city"
                      ><i class="fa fa-institution"></i>Height</label
                    >
                    <input
                      type="text"
                      id="city"
                      name="height"
                      placeholder="Your height.."
                    />

                    <div class="row">
                      <div class="col-50">
                        <label for="subject">Introduce</label>
                        <textarea
                          id="text"
                          name="introduce"
                          placeholder="Your Introduce.."
                          style="width: 100%"
                        ></textarea>
                      </div>
                    </div>
                  </div>

                  <div class="col-50">
                    <div class="row">
                      <div class="col-50">
                        <label for="fname"
                          ><i class="fa fa-user"></i>Weight</label
                        >
                        <input
                          type="text"
                          id="fname"
                          name="weight"
                          placeholder="Your weight.."
                        />
                        <label for="email"
                          ><i class="fa fa-envelope"></i> Job</label
                        >
                        <input
                          type="text"
                          id="email"
                          name="job"
                          placeholder="Your job.."
                        />
                        <label for="adr"
                          ><i class="fa fa-address-card-o"></i>Area</label
                        >
                        <input
                          type="text"
                          id="adr"
                          name="area"
                          placeholder="Your area.."
                        />
                        <label for="city"
                          ><i class="fa fa-institution"></i>Interest</label
                        >
                        <input
                          type="text"
                          id="city"
                          name="interest"
                          placeholder="Your interest.."
                        />

                        <div class="row">
                          <div class="col-50">
                            <label for="state">MBTI</label>
                            <input
                              type="text"
                              id="state"
                              name="mbti"
                              placeholder="Your MBTI.."
                            />
                          </div>

                          <div class="form-group">
                            <label for="exampleInputFile">File input</label>
                            <div class="input-group">
                              <div class="custom-file">
                                <input
                                  type="file"
                                  class="custom-file-input"
                                  id="exampleInputFile"
                                  name="photo"
                                />
                                <labelre
                                  class="custom-file-label"
                                  for="exampleInputFile"
                                  >Choose file</label
                                >
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

               
 				 <input type="button" value="Regist" id="bt_regist">
	       		 <input type="button" value="Update" id="bt_update">
	        	 
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </main>

    <script>
    "use strct";

    var inputFile = document.querySelector("#exampleInputFile");
    var pictureList = document.getElementById("pictureList");

    pictureList.addEventListener("click", (e) => {
      const { target } = e;
      if (target.tagName !== "IMG") return;

      var expandImg = document.getElementById("expandedImg");
      var imgText = document.getElementById("imgtext");
      expandImg.src = target.src;
      imgText.innerHTML = target.alt;
      expandImg.parentElement.style.display = "block";
    });

    inputFile.addEventListener("change", (e) => {
      const [file] = e.target.files;
      const newImage = document.createElement("img");

      if (file) {
        newImage.src = URL.createObjectURL(file);
        pictureList.appendChild(newImage);
      }
    });
    
    $(function(){
  		CKEDITOR.replace("content");
  		
  		//버튼에 이벤트 연결하기 
  		$("#bt_regist").click(function(){
  			if(confirm("등록하시겠어요?")){
  				regist();	
  			}
  		});
  		
  		//버튼에 이벤트 연결하기 
  		$("#bt_update").click(function(){
  			if(confirm("수정하시겠어요?")){
  				update();	
  			}
  		});
  	});
    
    
    function regist(){
     	$("form").attr({
     		action:"/profile/regist",
    		method:"post",
    		enctype:"multipart/form-data"
     		});
     	$("form").submit();
    }
    
  	function edit(){
  		$("form").attr({
  			"action":"/profile/regist",
  			"method":"post"
  		});	
  		$("form").submit();
  	}

  
    </script>
  </body>
</html>
