class Person{
 PImage sprite;
 int rel;//how good ur relationship with them is
 String name;
 
 Person(){
 }
 
 Person(String charName, int rating, PImage pic){
   name = charName;
   rel = rating;
   sprite = pic;
 }
 
 int getKeys(){
   return rel;
 }
 
 void addKeys(int keysToAdd){
   rel += keysToAdd;
 }
 
 void setRel(int sKey){
   rel = sKey;
 }
 
 String getNaWa(){
   return name;
 }
 
 PImage getSprite(){
   return sprite;
 }
 
 
}
