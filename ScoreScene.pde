class ScoreScene extends Scene{
  //background image
  PImage bg;
  int chat;
  boolean explorer;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  ScoreScene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 300, 40, 20);
    Scene talk2 = new Talk2Scene(myInv);
    chat = 0;
    
      options.addOption("Continue", talk2);
      msg = new MessageUI("Now Viewing Final Scores");

  }
  
  
  void display(){
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   
   if(chat == 1){
      char1 = myInv.getCharImg("paul");
     
     msg.changeMsg("amity with Paul: "+myInv.getAmity("paul")+"% amity rating");
   
   }else if(chat == 2){
     char1 = myInv.getCharImg("jonathan");
     
     msg.changeMsg("amity with Jonathan: "+myInv.getAmity("jonathan")+"% amity rating");
   }else if(chat == 3){
     char1 = myInv.getCharImg("corruptSoldier");
     
     msg.changeMsg("amity with soldier: "+myInv.getAmity("corruptSoldier")+"% amity rating");
   }else if(chat == 4){
     char1 = myInv.getCharImg("jordan");
     
     msg.changeMsg("amity with Jordan: "+myInv.getAmity("jordan")+"% amity rating");
   }
   
   
   else if(chat >= 3){
     msg.changeMsg("The end");
   }
   image(char1, 300, 100);
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   
   if((options.userChose())&& (chat >= 7)){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
   if(options.userChose()){
     chat++;
     options = new OptionUI(20, 50, 300, 40, 20);
     Inventory newInv = new Inventory();
     Scene talk2 = new TitleScene(newInv);
     options.addOption("Continue", talk2);
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}
