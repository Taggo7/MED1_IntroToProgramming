class Ball{
  
  
  //start position of the ball
float ball_x = 0;
float ball_y = 0;

//how fast the ball moves
float move_x = -8;
float move_y = 8;

void display() {
   ellipse(ball_x, ball_y, 60, 60);
  ball_x = ball_x + move_x;
  ball_y = ball_y + move_y;
}

void move(){
  if(ball_x > width) {
    ball_x = width;
    move_x = -move_x;
    }
  
   if(ball_y > height) {
     ball_y = height;
     move_y = -move_y;
    }
   
    if(ball_x < 0) {
      ball_x = 0;
      move_x = -move_x;
    }
  
     if(ball_y < 0) {
       ball_y = 0;
       move_y = -move_y;
     }
}
}
