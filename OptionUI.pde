class OptionUI{
  boolean selectionMade;
  int options,x ,y, boxW, boxH, txtSize;
  color boxC, boxO;
  ArrayList<String> optTexts;
  ArrayList<Scene> optScenes;
  ArrayList<Integer> y1s;
  Scene nextScene;
  
  OptionUI(){
    this(width/2, height/2);
 }
  
 OptionUI(int xpos, int ypos){
   this(xpos, ypos, 300, 40, 25);
 }
 
 OptionUI(int xpos, int ypos,int boxWidth, int boxHeight, int textSize){
   this(xpos, ypos, boxWidth, boxHeight, color(0), color(255), textSize);
 }
 
 OptionUI(int xpos, int ypos,int boxWidth, int boxHeight, color boxColor, color boxOutline, int textSize){
   x = xpos;
   y = ypos;
   boxW = boxWidth;
   boxH = boxHeight;
   boxC = boxColor;
   boxO = boxOutline;
   txtSize = textSize;
   options = 0;
   optTexts = new ArrayList<String>();
   optScenes = new ArrayList<Scene>();
   y1s = new ArrayList<Integer>();
   selectionMade = false;
 }
 
 void display(){
  //use a for loop to display infinite options
  for(int i = 0; i <= options; i++){
    drawOption(i);
  }
  
 }
 
  void drawOption(int optNum){
    if(optNum > 0){
      stroke(boxO);
      fill(boxC);
      rectMode(CORNER);
      rect(x,y1s.get(optNum-1), boxW, boxH);
      rectMode(CORNER);
      textAlign(CENTER);
      textSize(txtSize);
      fill(255,255,255);
      text(optTexts.get(optNum-1),x+(boxW/2),y1s.get(optNum-1)+((boxH/4)*2));
    }
  }
  
  void mousePressed() {
    for(int i = 0; i < options; i++){
      int x1 = x;
      int x2 = x+boxW;
      int y1 = y1s.get(i);
      int y2 = y1 +boxH;
      if((mouseX > x1 && mouseX < x2) && (mouseY > y1 && mouseY < y2)){
        selectionMade = true;
        nextScene = optScenes.get(i);
      }
    }
  }
 
  
  boolean userChose(){
    return selectionMade;
  }
  
  Scene getNextScene(){
    return nextScene;
  }
  
  void updateOption(int optNumb, String optTxt, Scene optScn){
    optTexts.set(optNumb-1,optTxt);
    optScenes.set(optNumb-1,optScn);
  }
  
  void addOption(String optTxt, Scene optScn){
    optTexts.add(optTxt);
    optScenes.add(optScn);
    options++;
    
    //decide the location of it onscreen here
    if(y1s.isEmpty()){
      y1s.add(y);
    }else{
      y1s.add(y1s.get(y1s.size()-1)+boxH+15);
    }
  }
}
