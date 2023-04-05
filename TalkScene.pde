class TalkScene extends Scene{
  //background image
  PImage bg;
  int chat;
  boolean explorer;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  TalkScene(Inventory inv, boolean exp){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk2 = new Talk2Scene(myInv);
    explorer = exp;
    chat = 0;
    
    if(myInv.getAmity("paul")>70){
      options.addOption("Continue", talk2);
      msg = new MessageUI("Paul: Bob! Thank goodness its you!");
    }else{
      options.addOption("Continue", talk2);
      msg = new MessageUI("Paul: Bob! Why were you running away from me?! What's wrong with you!\n Anyways...");
    }
  }
  
  
  void display(){
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   
   image(char1, 300, 200);
   image(char2, 600, 40);
   
   if(chat == 1){
     msg.changeMsg("Paul: I just woke up out here and have no idea what happened,\nI don't even recognize this place... ");
   }else if(chat == 2){
     msg.changeMsg("Paul: I wonder what could have happened to us...");
   }
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   
   if((options.userChose())&& (chat > 1)){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
   if(options.userChose()){
     chat++;
     options = new OptionUI(20, 50, 500, 70, 20);
     Scene talk2 = new Talk2Scene(myInv);
     options.addOption("Continue", talk2);
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class Talk2Scene extends Scene{
  //background image
  PImage bg;
  boolean amn;
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  Talk2Scene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk30 = new Talk3Scene(myInv, 0);
    Scene talk31 = new Talk3Scene(myInv, 1);
    Scene talk32 = new Talk3Scene(myInv, 2);
    amn = false;
    
    

     options.addOption("Of course, I know exactly ... (LIE)", talk30);
    options.addOption("No, I just woke up here...", talk31);
     options.addOption("No, do you?...", talk32);
    msg = new MessageUI("Paul: Do you know where we are?");
    
  }
  
  
  void display(){
    
    
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   
   image(char1, 300, 200);
   image(char2, 500, 40);
   
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

class ThinkScene extends Scene{
  //background image
  PImage bg;
  
  //characters
  PImage char1, char2;
  
  OptionUI options;
  MessageUI msg;
  
  ThinkScene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 450, 40, 20);
    Scene explore = new ExploreScene(myInv, false);
    options.addOption("Continue", explore);
    
    msg = new MessageUI("You barely remember what happened, it starts to hurt your head a lot, \n You start wandering around in your pain and eventually fall over");
  }
  
  
  void display(){
    bg = loadImage("dreambg.png");
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

class Talk3Scene extends Scene{
  //background image
  PImage bg;
  boolean amn;
  //characters
  PImage char1, char2;
  int dia, chat;//dialogue choice and chat number
  OptionUI options;
  MessageUI msg;
  
  Talk3Scene(Inventory inv, int optN){
    super(inv);
    amn = false;
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk4 = new Talk4Scene(myInv);
    dia = optN;
    if(dia == 0){
      msg = new MessageUI("You: Of course, I know exactly where we are, I put us here!");
    }else if(dia == 1){
      msg = new MessageUI("You: No, I just woke up here...");
    }else if(dia ==2){
      msg = new MessageUI("You: No, do you?");
    }
    options.addOption("Continue", talk4);
    
  }
  
  
  void display(){
    if(!amn){
      if(dia == 0){
      myInv.addamity("paul", -20);
    }else if(dia == 1){
      myInv.addamity("paul", 20);
    }else if(dia ==2){
      myInv.addamity("paul", 10);
    }
      
      
      
      Scene talk4 = new Talk4Scene(myInv);
    
      options.updateOption(1,"Continue", talk4);
   
      amn = true;
    }
    
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   
   image(char1, 300, 200);
   image(char2, 500, 40);
   
   if(chat == 1){
     if(dia == 0){
      msg.changeMsg("Paul: What? What's wrong with you? ");
    }else if(dia == 1){
      msg.changeMsg("Paul: Weird ");
    }else if(dia ==2){
      msg.changeMsg("Paul: I have no idea, but I thought I saw someone in a white robe earlier... ");
    }
     
     
   }else if(chat == 2){
     if(dia == 0){
      msg.changeMsg("You: It was just a joke relax... ");
    }else if(dia == 1){
      msg.changeMsg("You: yea... ");
    }else if(dia ==2){
      msg.changeMsg("You: Weird... ");
    }
   }
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   
   if((options.userChose())&& (chat > 1)){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
   if(options.userChose()){
     chat++;
     options = new OptionUI(20, 50, 500, 70, 20);
     Scene talk4 = new Talk4Scene(myInv);
     options.addOption("Continue", talk4);
   }
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class Talk4Scene extends Scene{
  //background image
  PImage bg;
  
  //characters
  PImage char1, char2;
  OptionUI options;
  MessageUI msg;
  
  Talk4Scene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene explore0 = new Talk5Scene(myInv,0);
    Scene explore1 = new Talk5Scene(myInv,1);
    
    
    

    options.addOption("Find the noise", explore0);
    options.addOption("Hide and wait", explore1);
    msg = new MessageUI("You hear the sound of rustling leaves nearby,\nwhat do you do?");
    
  }
  
  
  void display(){
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   
   image(char1, 300, 200);
   image(char2, 500, 40);
   
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

class Talk5Scene extends Scene{
  //background image
  PImage bg;
  boolean amn;
  //characters
  PImage char1, char2, char3, bush;
  int dia, chat;//dialogue choice and chat number
  OptionUI options;
  MessageUI msg;
  
  Talk5Scene(Inventory inv, int optN){
    super(inv);
    amn = false;
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk6 = new Scene(myInv);
    dia = optN;
    if(dia == 0){
      //find the noise
      msg = new MessageUI("As you head towards the noise, you run into a soldier!\nAs he bumps into you, he begins to draw his sword...");
    }else if(dia == 1){
      //hide on bush
      msg = new MessageUI("A soldier appears!\nHe is searching around for something or someone...");
    }
    options.addOption("Continue", talk6);//swithc to battle scene
    chat = 0;
    
  }
  
  
  void display(){
       
    bush = loadImage("bush.png");
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   char3 = myInv.getCharImg("corruptSoldier");
   
   if(chat == 0){
     if(dia == 0){
       image(char1, 100, 40);
       image(char2, 200, 40);
       
       image(char3, 700, 70);
        
      }else if(dia == 1){
        
        image(char1, 100, 40);
       image(char2, 200, 40);
        image(bush, 150,100);
        image(char3, 700, 40);
      }
   }
   
   if(chat == 1){
     if(dia == 0){
       image(char1, 300, 200);
       image(char2, 500, 40);
       image(char3, 700, 40);
        msg.changeMsg("Soldier: Stop right there peasant!");
      }else if(dia == 1){
        msg.changeMsg("Soldier: I swore they were around here somehwere...");
        image(char1, 100, 40);
       image(char2, 200, 40);
        image(bush, 150,100);
        image(char3, 600, 40);
      }
     
     
   }else if(chat == 2){
     if(dia == 0){
       image(char1, 300, 200);
       image(char2, 500, 40);
       image(char3, 700, 40);
      msg.changeMsg("You are under arrest and will be coming with me!\nSubmit or die!");
     }else if(dia == 1){
       image(char1, 100, 40);
       image(char2, 200, 40);
        image(bush, 150,100);
        image(char3, 800, 40);
      msg.changeMsg("Soldier: Oh well, I guess they got away...");
     }
    
    }
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   
   if((options.userChose())&& (chat > 1)){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
   if(options.userChose()){
     chat++;
     options = new OptionUI(20, 50, 500, 70, 20);
     if(dia == 0){
       Scene talk6 = new Fight6Scene(myInv);
       options.addOption("Continue", talk6);
     }else if(dia == 1){
       Scene talk6 = new Talk6Scene(myInv);
       options.addOption("Continue", talk6);
     }
   }
   
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

//talk it out then find other ppl/ skip battle
class Talk6Scene extends Scene{
  //background image
  PImage bg;
  
  //characters
  PImage char1, char2;
  OptionUI options;
  MessageUI msg;
  
  Talk6Scene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene chaseAtk = new Battle7Scene(myInv, 0);
    Scene chaseTalk = new Battle7Scene(myInv, 1);
    Scene explore = new Explore9Scene(myInv);
    
    
    

    options.addOption("Chase the soldier and attack with your friend!", chaseAtk);
    options.addOption("Chase the soldier and try to talk to him...", chaseTalk);
    options.addOption("Move on searching in the opposite direction...", explore);
    msg = new MessageUI("The soldier has now left, what do you do?");
    
  }
  
  
  void display(){
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   
   image(char1, 300, 200);
   image(char2, 500, 40);
   
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


//fight scene
class Fight6Scene extends Scene{
  //background image
  PImage bg;
  
  //characters
  PImage char1, char2, char3;
  OptionUI options;
  MessageUI msg;
  
  Fight6Scene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene battle = new Battle7Scene(myInv,0);
    Scene talk = new Battle7Scene(myInv,1);
    
    
    

    options.addOption("Attack the soldier with the power of friendship", battle);
    options.addOption("Try to talk it out", talk);
    msg = new MessageUI("The soldier wants you to turn yourself in,\nwhat do you do?");
    
  }
  
  
  void display(){
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   char3 = myInv.getCharImg("corruptSoldier");
   
   image(char1, 300, 200);
   image(char2, 500, 40);
   image(char3, 800, 40);
   
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

class Battle7Scene extends Scene{
  //background image
  PImage bg;
  boolean amn;
  //characters
  PImage char1, char2, char3, bush;
  int dia, chat;//dialogue choice and chat number
  OptionUI options;
  MessageUI msg;
  
  Battle7Scene(Inventory inv, int optN){
    super(inv);
    amn = false;
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk6 = new Scene(myInv);
    dia = optN;
    if(dia == 0){//attack with friend if amn is high enough
      //find the noise
      if(myInv.getAmity("paul")>90){
      msg = new MessageUI("You: Paul, lets battle this fool!");
      }else{
        msg = new MessageUI("You: Paul get up and help me fight this idiot!");
      }
    }else if(dia == 1){//talk it out
      
      msg = new MessageUI("You: Hey now, I'm sure this is a misunderstanding that we can easily work out,\nwhy don't we make a deal...");
    }
    options.addOption("Continue", talk6);
    chat = 0;
    
  }
  
  
  void display(){
    
    if(!amn){
      if(dia == 1){
      myInv.addamity("corruptSoldier",50);
      }
      amn = true;
    }
       
    bush = loadImage("bush.png");
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   char3 = myInv.getCharImg("corruptSoldier");
   
   if(chat == 0){
     
       if(dia == 0){
       image(char1, 100, 40);
       image(char2, 200, 40);
       
       image(char3, 700, 70);
        
      }else if(dia == 1){
        
        image(char1, 100, 40);
       image(char2, 200, 40);
        
        image(char3, 700, 40);
      }
   }
   
   if(chat == 1){
     if(dia == 0){
       image(char1, 300, 200);
       image(char2, 500, 40);
       image(char3, 700, 40);
        
       if(myInv.getAmity("paul")>90){
        msg.changeMsg("Paul: You got it, lets both attack at the same time!");
      }else{
        msg.changeMsg("Paul: Good joke you doofus, we need to get away, I'm leaving!");
      }
      }else if(dia == 1){
        msg.changeMsg("Soldier: Alright, I don't really care that much anyways, I hate my boss...");
        image(char1, 100, 40);
       image(char2, 200, 40);
       
        image(char3, 600, 40);
      }
     
     
   }else if(chat == 2){
     if(dia == 0){
       
       if(myInv.getAmity("paul")>90){
        msg.changeMsg("You both attack and overwhelm the soldier, pinning him down...");
        image(char1, 300, 200);
       image(char2, 500, 40);
       image(char3, 700, 40);
      }else{
        msg.changeMsg("Paul leaves you to deal with the soldier yourself...");
        image(char1, 300, 200);
       
       image(char3, 700, 40);
      }
       
      
     }else if(dia == 1){
       image(char1, 100, 40);
       image(char2, 200, 40);
       
        image(char3, 800, 40);
      msg.changeMsg("You: Can your boss get us out of here?");
     }
    
    }
    else if(chat == 3){
     if(dia == 0){
       
       if(myInv.getAmity("paul")>90){
        msg.changeMsg("Soldier: Alright! Alright! I give up, just please let me live and\nI will take you to my leader\nIf we defeat him, we can leave!");
        image(char1, 300, 200);
       image(char2, 500, 40);
       image(char3, 700, 40);
      }else{
        msg.changeMsg("You attack the soldier, but he is very strong,\n'this would have been easier with two people' you think to yourself\nunsure if you will survive this");
        image(char1, 300, 200);
       
       image(char3, 700, 40);
      }
       
    
     }else if(dia == 1){
       image(char1, 100, 40);
       image(char2, 200, 40);
       
        image(char3, 800, 40);
      msg.changeMsg("Soldier: Yea, lets go beat him up and force him to make us leave...");
     }
    
    }else if(chat == 4){
     if(dia == 0){
       
       if(myInv.getAmity("paul")>90){
        msg.changeMsg("Paul: Really you'd help us defeat your boss?");
        image(char1, 300, 200);
       image(char2, 500, 40);
       image(char3, 700, 40);
      }else{
        msg.changeMsg("You take a heavy blow to the chest and stumble backwards in pain...");
        image(char1, 300, 200);
       
       image(char3, 700, 40);
      }
       
    
     }else if(dia == 1){
       image(char1, 100, 40);
       image(char2, 200, 40);
       
        image(char3, 800, 40);
      msg.changeMsg("Paul looks towards you*\nPaul: Let's do it, we got no other way out right now...");
     }
    
    }else if(chat == 5){
     if(dia == 0){
       
       if(myInv.getAmity("paul")>90){
        msg.changeMsg("Soldier: Yea I don't get paid enough to do this horrible work. We have to hurry though...\nPaul and you look at eachother and nod in agreement to follow him.");
        image(char1, 300, 200);
       image(char2, 500, 40);
       image(char3, 700, 40);
      }else{
        msg.changeMsg("The soldier then sends a flying kick at you, sending you over the cliff to your doom...");
        image(char1, 300, 200);
       
       image(char3, 700, 40);
      }
       
    
     }else if(dia == 1){
       image(char1, 100, 40);
       image(char2, 200, 40);
       
        image(char3, 800, 40);
      msg.changeMsg("Paul looks towards you*\nPaul: Let's do it, we got no other way out right now...");
     }
    
    }
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   
   if((options.userChose())&& (chat > 4)){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
   if(options.userChose()){
     chat++;
     options = new OptionUI(20, 50, 500, 70, 20);
     if(dia == 0){
       if(myInv.getAmity("paul")>90){
        Scene fbtalk = new FBTalkScene(myInv);
       options.addOption("Continue", fbtalk);
      }else{
       Scene death = new Death2Scene(myInv);
       options.addOption("Continue", death);
      }
     }else if(dia == 1){
       Scene fbtalk = new FBTalkScene(myInv);
       options.addOption("Continue", fbtalk);
     }
   }
   
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class Explore9Scene extends Scene{
  //background image
  PImage bg;
  boolean amn;
  //characters
  PImage char1, char2, char3, bush;
  int chat;//dialogue choice and chat number
  OptionUI options;
  MessageUI msg;
  
  Explore9Scene(Inventory inv){
    super(inv);
    amn = false;
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk6 = new Scene(myInv);
 
      //find the noise
      msg = new MessageUI("As you explore, you eventually run into another guildmate, Jonathan...");

    options.addOption("Continue", talk6);
    chat = 0;
    
  }
  
  
  void display(){
    if(!amn){
      myInv.addamity("jonathan", 50);
      amn = true;
    }
       
   
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
   char3 = myInv.getCharImg("jonathan");
   
   if(chat == 0){
     
       image(char1, 100, 40);
       image(char2, 200, 40);
       
       image(char3, 700, 70);
        
    
   }
   
   if(chat == 1){
     
       image(char1, 300, 200);
       image(char2, 500, 40);
       image(char3, 700, 40);
        msg.changeMsg("Jonathan: Hello Bob...");
    
       
      
     
     
   }else if(chat == 2){
     
    
       image(char1, 100, 40);
       image(char2, 200, 40);
        
        image(char3, 800, 40);
      msg.changeMsg("You: Jonathan! Thank goodness you're here,\ndo you know anything about where we are?");
   
    
    }else if(chat == 3){
     
    
       image(char1, 100, 40);
       image(char2, 200, 40);
     
        image(char3, 800, 40);
      msg.changeMsg("Jonathan: Yes, In fact, I just defeated some soldier and he told me\n where the guy running this whole scheme is\nSaid if we could defeat him, we would be set free\nWe should hurry though before night...");
   
    
    }else if(chat == 4){
     
    
       image(char1, 100, 40);
       image(char2, 200, 40);
       
        image(char3, 800, 40);
      msg.changeMsg("You: Alright lets head out then...");
   
    
    }
   
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   
   if((options.userChose())&& (chat > 3)){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
   if(options.userChose()){
     chat++;
     options = new OptionUI(20, 50, 500, 70, 20);
     
       Scene talk = new FBTalkScene(myInv);
       options.addOption("Continue", talk);
     
      
   }
   
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

class FBTalkScene extends Scene{
  //background image
  PImage bg;
  boolean amn;
  //characters
  PImage char1, char2, char3, char4, fireball, char5;
  int chat;//dialogue choice and chat number
  OptionUI options;
  MessageUI msg;
  
  FBTalkScene(Inventory inv){
    super(inv);
    amn = false;
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene talk6 = new Scene(myInv);
 
      //find the noise
      msg = new MessageUI("Ahead you see someone in a  grey robe and red headband...");

    options.addOption("Continue", talk6);
    chat = 0;
    
  }
  
  
  void display(){
       
   
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
    char3 = myInv.getCharImg("corruptSoldier");
   char4 = myInv.getCharImg("jordan");
   char5 = myInv.getCharImg("jonathan");
   fireball = loadImage("smallfire.png");
   
   if(chat == 0){
     if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
     }else{
       image(char3, 300, 70);
     }
     
       image(char1, 100, 40);
       image(char2, 200, 50);
       image(char4, 950, 70);
       
        
    
   }
   
    else if(chat == 1){
     if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
       msg.changeMsg("Jonathan: That's a powerful mage...");
     }else{
       image(char3, 300, 70);
       msg.changeMsg("Soldier: That's Jordan, one of the most powerful wizards around...");
     }
     
       image(char1, 100, 40);
       image(char2, 200, 50);
       image(char4, 950, 70);
       
        
    
       
      
     
     
   }else if(chat == 2){
     if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
     }else{
      image(char3, 300, 70);
     }
     
    
       image(char1, 100, 40);
       image(char2, 200, 50);
        image(char4, 750, 70);
       
      msg.changeMsg("Jordan: Oh, so you're approaching me?");
   
    
    }else if(chat == 3){
      if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
     }else{
       image(char3, 300, 70);
       
     }
     
    
      image(char1, 100, 40);
       image(char2, 200, 50);
     image(char4, 750, 70);
       
      msg.changeMsg("You: Oh, no we just wanted to leave this pla-");
    
    }else if(chat == 4){
      if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
     }else{
       image(char3, 300, 70);
     }
     
    
      image(char1, 100, 40);
       image(char2, 200, 50);
       image(char4, 750, 70);
       
       image(fireball, 900, 70);
      msg.changeMsg("Jordan: Oh, you wanted to leave, I'm afraid I can't\nlet that happen, prepare to die from this fireball attack!");
   
    
    }
   
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   
   if((options.userChose())&& (chat > 3)){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
   if(options.userChose()){
     chat++;
     options = new OptionUI(20, 50, 500, 70, 20);
     
       Scene choice = new FightFScene(myInv);
       options.addOption("Continue", choice);
     
      
   }
   
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
}

//fight scene
class FightFScene extends Scene{
  //background image
  PImage bg;
  
  //characters
  PImage char1, char2, char3, char4, fireball, char5;
  OptionUI options;
  MessageUI msg;
  
  FightFScene(Inventory inv){
    super(inv);
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene battle = new FinalScene(myInv);
    Scene teamWipe = new Death3Scene(myInv);
    
    
    

    options.addOption("Attack as a team now!", battle);
    options.addOption("Run away now!", teamWipe);
    msg = new MessageUI("Jordan is threatening to send out a massive attack,\nand the fireball has grown!!\nWhat do you do?");
    
  }
  
  
  void display(){
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
    char3 = myInv.getCharImg("corruptSoldier");
   char4 = myInv.getCharImg("jordan");
   char5 = myInv.getCharImg("jonathan");
   fireball = loadImage("bigfire.png");
   
   if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
     }else{
       image(char3, 300, 70);
     }
   
    image(char1, 100, 40);
       image(char2, 200, 50);
       image(char4, 750, 70);
       
       image(fireball, 900, 70);
   
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

class FinalScene extends Scene{
  //background image
  PImage bg;
  boolean amn;
  //characters
  PImage char1, char2, char3, char4, fireball, char5;
  int chat;//dialogue choice and chat number
  OptionUI options;
  MessageUI msg;
  
  FinalScene(Inventory inv){
    super(inv);
    amn = false;
    options = new OptionUI(20, 50, 500, 70, 20);
    Scene end = new EscapeScene(myInv);
 
      //find the noise
      msg = new MessageUI("You all attack at once as the fire ball hurtles towards you...");

    options.addOption("Continue", end);
    chat = 0;
    
  }
  
  
  void display(){
       
   
    bg = loadImage("woods2.png");
   background(bg);
   
   //chars
   char1 = myInv.getCharImg("me");
   char2 = myInv.getCharImg("paul");
    char3 = myInv.getCharImg("corruptSoldier");
   char4 = myInv.getCharImg("jordan");
   char5 = myInv.getCharImg("jonathan");
   fireball = loadImage("bigfire.png");
   
   if(chat == 0){
     if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
     }else{
       image(char3, 300, 70);
     }
     
       image(char1, 100, 40);
       image(char2, 200, 50);
       image(char4, 950, 70);
       image(fireball, 600, 70);
        
    
   }
   
   else if(chat == 1){
     if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
     }else{
       image(char3, 300, 70);
     }
     
       image(char1, 100, 40);
       image(char2, 200, 50);
       image(char4, 950, 70);
       image(fireball, 500, 70);
        msg.changeMsg("The fireball reverse it direction after you all attack...");
    
       
      
     
     
   }else if(chat == 2){
     if(myInv.getAmity("jonathan") > 90){
       image(char5, 300, 70);
     }else{
       image(char3, 300, 70);
     }
    
       image(char1, 100, 40);
       image(char2, 200, 50);
       image(char4, 750, 70);
       image(fireball, 870, 70);
      msg.changeMsg("Jordan: WHAT???????????");
   
    
    }else if(chat == 3){
     if(myInv.getAmity("jonathan") > 90){
        image(char5, 300, 70);
     }else{
        image(char3, 300, 70);
     }
    
      image(char1, 100, 40);
       image(char2, 200, 50);
       image(char4, 750, 70);
      
      msg.changeMsg("Jordan explodes as the world fades to black......");
    
    }
    
   
   
   //display options and message ui
   options.display();
   msg.display(); 
   
   //check for if a choice was made
   
   if((options.userChose())&& (chat > 2)){
     nextScene = options.getNextScene();
     sceneDone = true;
   }
   if(options.userChose()){
     chat++;
     options = new OptionUI(20, 50, 500, 70, 20);
     
       Scene end = new EscapeScene(myInv);
       options.addOption("Continue", end);
     
      
   }
   
  }
  
  //transfer mousepressed events to the ui
  void mousePressed() {
    options.mousePressed();
  }
  
}
