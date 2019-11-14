//Flower classes
Flower Flower0;    
Flower Flower1;    
Flower Flower2;    

void setup() {
  // The Size of the canvas
  size(800, 800);   

  // variabler
  int r0 = 60;
  int r1 = 20;
  int r2 = 40;
  int petals = 8;
  int pc = #982E2E;
  float x = width/2;
  float y = height/2;

  Flower0 = new Flower(r0, petals, x, y, pc);
  Flower1 = new Flower(r1, petals, x+random(-100, 100), y, pc);
  Flower2 = new Flower(r2, petals, x + 50, y, pc);
}

void draw() {
  background(#67D1B2); 

  Flower0.display();//The look of the flower
  Flower0.move(); //getting the flower to move
  Flower0.boundaries(); //bouncing on walls

  Flower1.display(); 
  Flower1.move();
  Flower1.boundaries();

  Flower2.display();  
  Flower2.move();
  Flower2.boundaries();

}
