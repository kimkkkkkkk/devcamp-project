//요일박스 
class DayBox extends DateBox{
    constructor(container, width, height, text, bg){
        super(container, width, height, 0, bg); //부모 
        this.div.innerHTML=text;

        
    }
}
