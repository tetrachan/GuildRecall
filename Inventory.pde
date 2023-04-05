class Inventory{
 int keys, hp;
 String weapon;
 Person paul, jean, jordan, herbert, jonathan, orisa, me, evilLeader, corruptSoldier;
 ArrayList<Person> people;
 
 Inventory(){
  keys = 0;
  hp = 100;
  weapon = "none";
  people = new ArrayList<Person>();
  
  PImage paulI = loadImage("Paul.png");
  paul = new Person("paul",90,paulI);
  people.add(paul);
  
  PImage meI = loadImage("Me.png");
  me = new Person("me",0,meI);
  people.add(me);
  
  PImage jeanI = loadImage("Jean.png");
  jean = new Person("jean",0,jeanI);
  people.add(jean);
  
  PImage jonathanI = loadImage("Jonathan.png");
  jonathan = new Person("jonathan",50,jonathanI);
  people.add(jonathan);
  
  PImage orisaI = loadImage("Orisa.png");
  orisa = new Person("orisa",0,orisaI);
  people.add(orisa);
  
  PImage herbertI = loadImage("Herbert.png");
  herbert = new Person("herbert",0,herbertI);
  people.add(herbert);
  
  PImage jordanI = loadImage("Jordan.png");
  jordan = new Person("jordan",0,jordanI);
  people.add(jordan);
  
  PImage evilLeaderI = loadImage("EvilLeader.png");
  evilLeader = new Person("evilLeader",0,evilLeaderI);
  people.add(evilLeader);
  
  PImage corruptSoldierI = loadImage("CorruptSoldier.png");
  corruptSoldier = new Person("corruptSoldier",0,corruptSoldierI);
  people.add(corruptSoldier);
  
 }
 
 void display(){
   //display hp
 }
 
 int getKeys(){
  return keys; 
 }
 
 String getWeapon(){
  return weapon; 
 }
  
  PImage getCharImg(String charName){
    for(int i = 0; i<people.size();i++){
      if(charName == people.get(i).getNaWa()){
        return people.get(i).getSprite();
      }
    }
    
    return people.get(0).getSprite();
    
    
  }
  
  int getAmity(String charName){
    for(int i = 0; i<people.size();i++){
      if(charName == people.get(i).getNaWa()){
        return people.get(i).getKeys();
      }
    }
    
    return people.get(0).getKeys();
    
  }
  
  void addamity(String charName, int change){
    for(int i = 0; i<people.size();i++){
      if(charName == people.get(i).getNaWa()){
        people.get(i).addKeys(change);
      }
    }
    
    
  }
  
  
}
