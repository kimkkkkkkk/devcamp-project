/*
달력의 셀 하나를 표현하는 사각형 일정 등록 및 날짜 표가 가능한 객체
*/
class DateBox{
    constructor(container, width, height, seq, bg){
        this.container=container;
        this.div=document.createElement("div");
        this.width=width;
        this.height=height;
        this.div.id=seq; // 인수로 넘겨받은 문자열을 div에 출력
        this.bg=bg//배경색을 인수로 넘겨받자
        this.title; // 제목 보관용
        this.content; // 내용 보관용
        var me=this;
        this.colorFlag=false; //적용된 색상이 없다 
    
        // this.div.style.width=this.width+"px";
        // this.div.style.height=this.height+"px";
        this.div.style.width="14.2857143%";
        this.div.style.height="100px";
        this.div.style.background=this.bg;
        this.div.style.border="1px solid rgb(147, 144, 141)";
        this.div.style.boxSizing="border-box";
        this.div.style.float="left"; //div가 block이니까 
        this.div.style.overflow="hidden";

        var block =document.createElement("div");
        this.div.appendChild(block);

        this.container.appendChild(this.div); // 부모에 부착
        var bg=this.bg;

        //이벤트 구현
        this.div.addEventListener("mouseover",function(){
            
            if(!me.colorFlag){
                this.style.background=" rgb(255, 234, 211)";
            }
        });
        this.div.addEventListener("mouseout",function(){
            if(!me.colorFlag){
                this.style.background=bg;
            }
        });
      
        this.div.addEventListener("click",function(){
            console.log(this.id+" 박스 눌럿어?");
            document.getElementById("div_index").value=this.id;

            // openDialog(index);
            if(editable){ //기록을 원한다 
                var d_date = document.getElementById("d_date");                    
                var t_title = document.getElementById(" t_title");                    
                var c_content = document.getElementById(" c_content");                    
                d_date.value=this.innerText;
                
            }else{
                stamp(this); //div 전달 
                editable=true;
                pointer(-1);
            }
        });
  
  
    } 
}