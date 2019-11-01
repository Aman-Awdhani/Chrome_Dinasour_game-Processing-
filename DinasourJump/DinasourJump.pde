

ArrayList<cactus> cList = new ArrayList<cactus>();

float x;
float y;
float vel;
float acc;
float num = 400;
int score;
boolean inAir;


void setup() {

  size(800, 300);
  frameRate(100);
  cList.add(new cactus());
  x= 50;
  y=height/1.3;
}

void draw() {

  background(0);
  stroke(150);
  line(0, height/1.3+30, width, height/1.3+30);
  
  score=floor(frameCount);
  scoreText();  
  
  for (cactus cac : cList) {
    cac.create();
    cac.move();
  }
  
  addForce(.1);
  update();
  display();
  lose();
  
  //create new wall
  if (frameCount % num <= 0) {
    cList.add(new cactus());
    num = floor(random(500, 800));
  }    
}

//score text
void scoreText() {

  stroke(255);
  textSize(50);
  text(score, width/2-40, 50);
  
}

//jump and gravity
void update() {

  vel +=acc;
  y+=vel;
  acc=0;

 //keep box to the ground
  if (y>height/1.3) {
    vel=0;
    y=height/1.3; 
    inAir=false;
  }
}


void keyReleased() {
  if (key == ' ' && !inAir){
    addForce(-5);
    inAir=true;
  }
}

//add force to jump && gravity
void addForce(float force) {

  acc+=force;  
}

//create box
void display() {

  fill(255);
  rect(x, y+5, 30, 30);
  
}

//check collision 
void lose() {

  for (cactus cac : cList) {
    if (dist(cac.x, cac.y, x, y)<35) {

      print("Lost");
      cList.clear();
      score=0;
      frameCount=0;
      return;      
    }
  }
}
