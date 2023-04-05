Inventory newInv;
Scene liveScene;
Scene intro;
boolean paused;
OptionUI menu;

void setup() {
  paused = false;
  size(1280, 720);
  background(0);
  frameRate(240);
  newInv = new Inventory();
  liveScene = new TitleScene(newInv);
  //make pause menu options
  menu = new OptionUI((width/2)-150,(height/2)-200);
  menu.addOption("Resume", liveScene);
  intro = new TitleScene(newInv);
  menu.addOption("Restart",intro);
  
  
   //Welcome
  fill(255);
  textSize(25);
  text("Loading . . .",10,height-50);
  
  //start scene progression
  
  
  
}

void draw() {
  if(!paused){
  
    if(!liveScene.sceneDone()){
      liveScene.runScene();
     }else{
      //switch to next scene
      Scene nextScene = liveScene.nextScene();
      liveScene = nextScene;
    }
  
  }else{ 
    //do pause stuff, leave scene frozen in background.
  }
}


void keyPressed() {
  //transfer the key pressed event into the scene
  liveScene.keyPressed();
  //pause option and ui
  if(keyCode == 27 || key == 'p'){ 
    if(paused == true){
      paused = false;
    }else{
      paused = true;
      fill(0,0,0,140);
      noStroke();
      rectMode(CORNERS);
      rect(0,0,1280,720);
      menu.display();
    }
  }
}



void mousePressed() {
  
  if(paused){
    Inventory freshInv = new Inventory();
    intro = new TitleScene(freshInv);
    menu.updateOption(2,"Restart",intro);
    menu.updateOption(1,"Resume",liveScene);
    menu.mousePressed();
    if(menu.userChose()){
      Scene nextScene = menu.getNextScene();
      liveScene = nextScene;
    }
    paused = false;
  }else{
    liveScene.mousePressed();
  }
}
