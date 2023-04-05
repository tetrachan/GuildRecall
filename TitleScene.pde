class TitleScene extends Scene{
  //background image
  PImage bg;
  int frame;
  boolean reverse;
  
  TitleScene(Inventory inv){
    super(inv);
    frame = 0;
    reverse = false;
  }
  
  void display(){
   fill(255);
   bg = loadImage("welcomebg.png");
   background(bg);
   
   textSize(50);
   
   rectMode(CENTER);
   textAlign(CENTER);
   fill(0);
   text("GUILD RECALL",(width/2)+2, 72); 
   fill(62, 171, 136);
   text("GUILD RECALL",width/2, 70); 
   
   
   
   textSize(26);
   
   //animate the enter to begin text with the frame variable
   rectMode(CENTER);
   textAlign(CENTER);
   fill(0,0,0,frame*7);
   text("Press Enter To Begin",(width/2)+2,(height/2)+2); 
   fill(255,255,0,frame*7);
   text("Press Enter To Begin",width/2,height/2); 
   if(frame >= 30){
     reverse = true;
   }
   if(frame <= 0){
     reverse = false;
   }
   if(reverse){
     frame--;
   }else{
     frame++;
   }
   
  }
  
  void keyPressed() {
    if (key == '\n') {
      sceneDone = true;
      nextScene = new IntroScene(myInv);
    }
   
  }
  
  
}
