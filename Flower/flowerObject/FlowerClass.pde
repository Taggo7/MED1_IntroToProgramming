class Flower {

  // variabler
  float r;
  float x; 
  float y;
  float SpeedX = random(-7, 10);
  float SpeedY = random(-7, 10);
  int n_petals;
  int petalColor;

  Flower(float temp_r, int temp_n_petals, float temp_x, float temp_y, int temp_petalColor) {
    r = temp_r;
    n_petals = temp_n_petals;
    x = temp_x;
    y = temp_y;
    petalColor = temp_petalColor;
  }

  void display () {
    float CenterX;
    float CenterY;

    fill(petalColor);
    for (float i=0; i<PI*2; i+=2*PI/n_petals) {
      CenterX = x + r*cos(i);
      CenterY = y + r*sin(i);

      ellipse(CenterX, CenterY, r, r);
    }

    fill(200, 255, 50);
    ellipse(x, y, r*1.2, r*1.2);
  }

  // speed for the flower
  void move() {    
    x += SpeedX;
    y += SpeedY;
  }

//The flower bounces on the walls 
  void boundaries() {    
    if (x > width - r || x < 0 + r) {
      SpeedX = SpeedX * -1;    
    }
    if (y > height - r || y < 0 + r) {
      SpeedY = SpeedY * -1;    
    }
  }

}
