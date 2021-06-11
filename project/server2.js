var http=require("http");
var fs=require("fs");
var mysql=require("mysql");
var static =require("serve-static");
var ejs=require("ejs");
var express=require("express");
var bodyParser=require("body-parser");

const conStr={
    url:"localhost",
    user:"root",
    password:"1234",
    database:"nodejs"
};
const connection = mysql.createConnection(conStr);
connection.connect();

var app=express();

app.use(static(__dirname+"/static")); //static 디렉토리를 정적자원의 루트로 지정 그러면, 추후 static 디렉토리느 ㄴ명시하지않음
app.set("view engine", "ejs"); //엡 엔징르 선택하면 이 시점부터는 무조건   ejs 파일을 views 디렉토리 밑에서 찾는다 
app.use(bodyParser.urlencoded({ extended: true }));

// Delete 메서드 허용하기
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Methods", "GET, POST, DELETE");
    next();
});

//관리자 로그인 (나만 플래너 쓸 수 있음)
/*
app.get("/admin/loginform", function(request, response){
    fs.readFile("./static/login.html", function(error, data){
        response.writeHead(200, {"Content-Type":"text/html;charset=utf-8"}); //header
        response.end(data); //body
    });  
});
*/

//정적자원에 대해서 까지 app.get() 처리하게 되면  정적 자원위 수만큼 코드를 짜야 한다...불가능 하다.. 
//express 모듈이 지원하는 정적 자원 처리 미들웨어를 쓰자 즉 미들웨어로 static 모듈 정의해ㅣ본다 
//static 모듈은 개발자가 처리해야 할 정적 자원에 대한 요청에 응답을 알아서 처리 ..
/*
app.get("/img1", function(request, response){
    //이미지 파일 읽기 
    fs.readFile("./static/images/img0.jpg", function(error, data){
        response.writeHead(200, {"Content-Type":"image/jpeg"}); //header
        response.end(data); //body
    });
});
*/

app.get("/", function(request, response) {
    response.render("login");
});

app.get("/planner", function(request, response) {
    const member_id = 9;
    const year = 2021;
    const month = 3;

    connection.query(
        'select * from planner where member_id = ? and yy = ? and mm = ?',
        [member_id, year, month],
        function(e, r) {
            response.render("planner", {
                planner: r,
            });
        },
    );
});

// app.get("/test", function(request ,response){
//     response.render("test"); //서버에서 실행되어야 하므로, 렌더링 대상이다 
// });

app.post("/login", function(request, response) {

    response.redirect('/planner');
});

app.post("/planner", function(request, response) {
    const {
        member_id,
        color_id,
        yy,
        mm,
        dd,
        title,
        content,
    } = request.body;

    connection.query(
        'insert into planner(member_id, color, yy, mm, dd, title, content) values(?, ?, ?, ?, ?, ?, ?)',
        [member_id, color_id, yy, mm, dd.replace('일', ''), title, content],
        function(e, r, f) {
            if (e) {
                console.error(e);
                response.redirect('/planner');
            } else {
                response.redirect('/planner');
            }
        },
    );
});

app.delete("/planner", function(request, response) {
    const { member_id, yy, mm, dd } = request.body;
    console.log(member_id, yy, mm, dd);

    response.redirect("/planner");
});

var server = http.createServer(app);
server.listen(7878, function(){
    console.log("Server is running at 7878....");
});

