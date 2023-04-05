class MessageUI{
  boolean charSays;
  String speaker, msg;
  int x ,y, boxW, boxH, txtSize;
  color boxO, boxC, txtC;
  
  
  MessageUI(){
    this("none");
  }
  
  MessageUI(String message){
    this(message, "none");
  }
  
  MessageUI(String message, String charName){
    this(message, charName, 0, 520, 1280, 200);
  }
  
  MessageUI(String message, String charName,  int x1, int y1, int w,int h){
    if(charName == "none"){
      charSays = false;
      speaker = "";
    }else{
      charSays = true;
      speaker = charName;
    }
    msg = message;
    x=x1;
    y=y1;
    boxW = w;
    boxH = h;
    boxO = color(0);
    boxC = color(255,255,255,198);
    txtC = color(0);
    txtSize = 30;
  }
  
  void changeMsg(String newMsg){
    msg = newMsg;
  }
  
  
  void display(){
    stroke(boxO);
      fill(boxC);
      rectMode(CORNER);
      rect(x,y, boxW, boxH);
      rectMode(CORNER);
      textAlign(CENTER);
      textSize(txtSize);
      fill(txtC);
      text(msg,x+(boxW/2),y+((boxH/4)*3)-100);
  }
}
