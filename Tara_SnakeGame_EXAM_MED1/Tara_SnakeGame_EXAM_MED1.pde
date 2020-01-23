//this code is inspired by Daniel Shiffmans snake game (The Coding train): https://www.youtube.com/watch?v=AaGK-fj-BAM and https://www.youtube.com/watch?v=VsWNhSDneGk

import processing.sound.*;

int elSize = 20; // The width and heigth of the ellipse
int rectSize = 20; // The size of the rectangle
PVector snack;    //PVector is a class that describes a two dimensional vector
PVector enemy;
int speed = 10;
boolean dead = true;
int highscore = 0;      //highscore starts at 0 everytime the program starts
Snake mysnake;
Rectangle rectangle;

SoundFile file; // SoundFile will hold the audio file - variable named file

void setup() {
  size(600, 600); // The size of the canvas 
  mysnake = new Snake();  // A new object mysnake of the datatype Snake is created
  snack = new PVector();
  newSnack();
  enemy = new PVector();
  newEnemy();
  rectangle = new Rectangle();
  file = new SoundFile(this, "Eating.mp3");
// sound from: https://freesound.org/people/Ondruska/sounds/360686/

}


void draw() {
  background(0);
  fill(255);
  if (!dead) {                          //! Returns true if the expression is false and returns false if the expression is true

    if (frameCount % speed == 0) {      //framecount contains the number of frames that have been displayed since the program started
      mysnake.update();
    }
    //displaying the different objects
    mysnake.show();
    mysnake.eat();
    mysnake.hitEnemy();
    rectangle.display();
    rectangle.move();
    fill(255, 0, 0);
    ellipse(snack.x, snack.y, elSize, elSize);
    rect(enemy.x, enemy.y, rectSize, rectSize);
    textAlign(LEFT);
    textSize(15);
    fill(255);
    //making the counter
    text("Score: " + mysnake.size, 10, 20);
  } else {
    textSize(25);
    textAlign(CENTER, CENTER);
    text("Snake Game\nClick to start" + "\nHighscore: " + highscore, width/2, height/2);
  }
}

void newSnack() {
  //makes the snack spawn randomly when a snack gets eaten
  snack.x = floor(random(width));
  snack.y = floor(random(height));
  snack.x = floor(snack.x/elSize) * elSize;
  snack.y = floor(snack.y/elSize) * elSize;
}
void newEnemy() {
  //makes the enemy spawn randomly when a new game begins
  enemy.x = floor(random(width));
  enemy.y = floor(random(height));
  enemy.x = floor(enemy.x/rectSize) * rectSize;
  enemy.y = floor(enemy.y/rectSize) * rectSize;
}

void mousePressed() {          
  //If you die and then press the screen the game start anew, snack and enemy gets new position
  if (dead) {
    mysnake = new Snake();
    newSnack();
    newEnemy();
    speed = 10;
    dead = false;
  }
}
