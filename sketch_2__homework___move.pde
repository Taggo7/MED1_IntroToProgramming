float fast_circle_x = 300;
float fast_circle_y = 20;

float move_x = -3;
float move_y = 3;

float slow_circle_x = 0;


void setup(){
  size(300,300);
  noStroke();
  
}

void draw() {
  background(#E3F5ED);
  
  float slow_circle_size = 50;
  
  if(random(10) > 9.9) {
    slow_circle_size = 200;
  }
  
  fill(#A53216);
  
  ellipse(fast_circle_x, fast_circle_y, 30, 30);
  fast_circle_x = fast_circle_x + move_x;
  fast_circle_y = fast_circle_y + move_y;
  
  fill(#B414AA);
  ellipse(slow_circle_x, 200, slow_circle_size, slow_circle_size);
  slow_circle_x = slow_circle_x + 1;


  if(fast_circle_x > width) {
    fast_circle_x = width;
    move_x = -move_x;
    }
  
   if(fast_circle_y > height) {
     fast_circle_y = height;
     move_y = -move_y;
    }
   
    if(fast_circle_x < 0) {
      fast_circle_x = 0;
      move_x = -move_x;
    }
  
     if(fast_circle_y < 0) {
       fast_circle_y = 0;
       move_y = -move_y;
     }




  if(slow_circle_x > 300) {
     slow_circle_x = 0;
  }
}
