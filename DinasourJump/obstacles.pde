public class cactus{
  
  float x = width+20;
  float y = random(200,230);
  float high = 100;
  float speed = 1.5;
  
  //create wall
  void create(){
   
    fill(0,255,0);
    rect(x,y,20, high);
    
  }
  
  //move wall
  void move(){
   
    x-= speed;
    
  }
  
}
