Ball ball;


void setup(){
  size(1200,1000);
  noStroke();
  ball = new Ball();
}

void draw() {

  background(#E3F5ED);

  fill(#A53216);
 
 ball.display();
 ball.move(); 


}
