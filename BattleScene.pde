class BattleScene extends Scene{
  String enemyName;
  OptionUI choices;
  PImage bg;
  
  BattleScene(Inventory inv, String opponent, PImage background){
    enemyName = opponent;
    myInv = inv;
    choices = new OptionUI();
    bg = background;
  }
  
  void addOutcome(String optTxt, Scene optScn){
    choices.addOption(optTxt, optScn);
  }
  
  void display(){
    background(bg);
    choices.display();
   //place opponent character on opposite side 
   if(choices.userChose()){
     nextScene = choices.getNextScene();
     sceneDone = true;
   }
   
   //place self on left side and give options.
  }
  
}
