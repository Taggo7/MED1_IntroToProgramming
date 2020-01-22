Object Flower;  // The flower object 
Object Bee; // The Bee object
Object JumpingBall; // The JumpingBall object

PVector storm;

int num = 15; // the number of bees (trail particles)
float[] x_ = new float[num];
float[] y_ = new float[num];



void setup() {
  size(1800, 1800); //Canvas

  //variables
  
  int _rF= 170; //radius of the flower ellipses
  int _rB=140; //radius of the bee
  float _x=width/2; //starting point for x-value
  float _y=height/2; //starting point for y-value
  int BeeColor=(#F7ED23);
  int _petals=7; //number of petals
  int _pc=#F5D5F3; //petals color
  int offset = 280; //Where the bee starts
  float _speedF=2; //the flowers speed
  float _speedB=8; //the bees speed


  Flower = new Object(_rF, _petals, _x, _y, _pc, _speedF); 
  Bee = new Object(_rB, _x, _y-offset, BeeColor, _speedB);
  JumpingBall = new Object(200,200);
  storm = new PVector(3,10);

  
}

void draw() {
  background(#A4C8CE);
  if(dist(Flower.x, Flower.y, x_[0], y_[0])<(Flower.r+140)) { // checking overlapping on the first bee
     background (#000405);
  }
 
JumpingBall.update();
JumpingBall.displayJumpingBall();
JumpingBall.chechEdges();
JumpingBall.applyForce(storm);

  Bee.bounce(2);
  
  // display, move and bounce the flower
  Flower.displayFlower();
  Flower.move();  
  Flower.bounce(1);


  for (int i = num-1; i > 0; i--) {
    
    x_[i] = x_[i-1];
    y_[i] = y_[i-1];
  }
  // Add the new values to the beginning of the array
  
  // if(mousePressed) {
    x_[0] = mouseX;
    y_[0] = mouseY;
  // }
  
  // Draw the circles
    push();
    float r = 2;
    // noStroke();
    fill(0);
    // for (int i = 0; i < num; i++) {
     for(int i = num-1; i > 0; i--) {
     Bee.displayBee(x_[i], y_[i], i * 5);
    }
    pop();
}
