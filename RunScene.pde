class RunScene extends Scene{
  //background image
  PImage bg;
  
  boolean explorer, amn;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  RunScene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk = new TalkScene(myInv, false);
    Scene run2 = new Run2Scene(myInv);
    
    options.addOption("Talk to him", talk);
    options.addOption("Keep running, this is definitely a setup!", run2);
    msg = new MessageUI("Paul begins to chase you\nPaul: Wait up! Come back! \nWhat do you do?");
    
  }
  
  
  void display(){
    if(!amn){
      myInv.addamity("paul", -30);
      Scene talk = new TalkScene(myInv, false);
      Scene run2 = new Run2Scene(myInv);
    
      options.updateOption(1,"Talk to him", talk);
      options.updateOption(2,"Keep running, this is definitely a setup!", run2);
      amn = true;
    }
    
   bg = loadImage("woods3.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   
   image(char1, 300, 200);
   image(char2, 900, 40);
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   if(options.userChose()){
     
     nextScene = options.getNextScene();
     sceneDone = true;
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class Run2Scene extends Scene{
  //background image
  PImage bg;
  
  boolean explorer, amn;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  Run2Scene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk = new TalkScene(myInv, false);
    Scene killPaul = new DeathScene(myInv);
    amn = false;
    
    options.addOption("Talk to him", talk);
    options.addOption("Attack Paul, he is way too close for comfort!", killPaul);
    msg = new MessageUI("Paul begins to catch up on you!\nPaul: What's wrong with you! \nWhat do you do?");
    
  }
  
  
  void display(){
    
    //update amity
    if(!amn){
      myInv.addamity("paul", -50);
      Scene talk = new TalkScene(myInv, false);
    Scene killPaul = new DeathScene(myInv);
      options.updateOption(1, "Talk to him", talk);
      options.updateOption(2,"Attack Paul, he is way too close for comfort!", killPaul);
      amn = true;
    }
    
   bg = loadImage("woods4.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   
   image(char1, 300, 200);
   image(char2, 900, 40);
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   if(options.userChose()){
     
     nextScene = options.getNextScene();
     sceneDone = true;
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class DeathScene extends Scene{
  //background image
  PImage bg;
  
  boolean explorer;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  DeathScene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene score = new ScoreScene(myInv);
    
    options.addOption("Continue(ScoreCard)", score);
    msg = new MessageUI("You attack paul, but he strikes back to defend himself, which sends\n you flying off a cliff to your death...");
    
  }
  
  
  void display(){
   bg = loadImage("woods4.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   
   image(char1, 200, 0);
   image(char2, 500, 40);
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   if(options.userChose()){
     myInv.addamity("paul", -90);
     nextScene = options.getNextScene();
     sceneDone = true;
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class Death2Scene extends Scene{
  //background image
  PImage bg;
  
  boolean explorer;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  Death2Scene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene score = new ScoreScene(myInv);
    
    options.addOption("Continue(ScoreCard)", score);
    msg = new MessageUI("You died in lonely combat...");
    
  }
  
  
  void display(){
   bg = loadImage("woods4.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("corruptSoldier");

   
   image(char1, 200, 0);
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   if(options.userChose()){
     myInv.addamity("corruptSoldier", -90);
     myInv.addamity("paul", -7);
     nextScene = options.getNextScene();
     sceneDone = true;
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class Death3Scene extends Scene{
  //background image
  PImage bg;
  
  

  
  OptionUI options;
  MessageUI msg;
  
  Death3Scene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene score = new ScoreScene(myInv);
    
    options.addOption("Continue(ScoreCard)", score);
    msg = new MessageUI("You all died in a blazen inferno since the attack was not countered");
    
  }
  
  
  void display(){
   bg = loadImage("firebg.png");
   background(bg);
   
  

   
  
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   if(options.userChose()){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class EscapeScene extends Scene{
  //background image
  PImage bg;
  
  

  
  OptionUI options;
  MessageUI msg;
  
  EscapeScene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene score = new ScoreScene(myInv);
    
    options.addOption("Continue(ScoreCard)", score);
    msg = new MessageUI("You escaped!");
    
  }
  
  
  void display(){
   bg = loadImage("survivebg.png");
   background(bg);
   
  

   
  
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   if(options.userChose()){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}
