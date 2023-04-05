
class Scene{
  Inventory myInv;
  boolean sceneDone;
  Scene nextScene;
  Scene(){
    
  }
  Scene(Inventory inv){
    sceneDone = false;
    myInv = inv;
  }
  
  void runScene(){
    display();
  }
  
  void display(){
    background(0);
  }
  
  void keyPressed() {
}

void mousePressed() {
  
}

 boolean sceneDone(){
  return sceneDone;
 }
 
 Scene nextScene(){
   return nextScene;
 }
  
  
}
