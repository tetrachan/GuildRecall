class IntroScene extends Scene{
  //background image
  PImage bg;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  IntroScene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 450, 40, 20);
    Scene explore = new ExploreScene(myInv, true);
    Scene think = new ThinkScene(myInv);
    options.addOption("Explore the surrounding area immediately", explore);
    options.addOption("Try to remember what happened", think);
    
    msg = new MessageUI("You awake dazed and confused in the middle of the woods,\nWhat do you do?");
  }
  
  
  void display(){
    bg = loadImage("woodsbg.png");
   background(bg);
   
   //chars
   char2 = myInv.getCharImg("me");
   
   image(char2, 400, 0);
   
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

class ExploreScene extends Scene{
  //background image
  PImage bg;
  
  boolean explorer;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  ExploreScene(Inventory inv, boolean exp){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk = new TalkScene(myInv, exp);
    Scene run = new RunScene(myInv);
   
    explorer = exp;
    
    if(exp){
     options.addOption("Talk to him", talk);
    options.addOption("Run away and hide, did your friends set you up?", run);
    msg = new MessageUI("You see your best friend Paul nearby walking around with an angry look on his face,\nWhat do you do?");
    }else{
       options.addOption("Say hi to him", talk);
    options.addOption("Run away and hide, are you still partially\n dreaming or under a spell?", run);
      msg = new MessageUI("When you awake, you are in a new location and\nYou see your best friend Paul walking towards you,\nWhat do you do?");
    }
  }
  
  
  void display(){
    bg = loadImage("woods2.png");
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
