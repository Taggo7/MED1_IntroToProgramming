class Rectangle{
  
float rectangle_x = 0;        //start position of the rectangle
float rectangle_y = 0;        //start position of the rectangle
int size = 200;               //The rectangles size

//how fast the rectangle moves
float move_x = -2;
float move_y = 2;

void display() {
  //making the rectangle and making it move
   rect(rectangle_x, rectangle_y, size, size);   
  rectangle_x = rectangle_x + move_x;
  rectangle_y = rectangle_y + move_y;
}

void move(){
  // makes the boundaries for the rectangle, making sure it's bouncing back and moving the opposite direction
  if(rectangle_x > width) {
    rectangle_x = width;
    move_x = -move_x;
    }
  
   if(rectangle_y > height) {
     rectangle_y = height;
     move_y = -move_y;
    }
   
    if(rectangle_x < 0) {
      rectangle_x = 0;
      move_x = -move_x;
    }
  
     if(rectangle_y < 0) {
       rectangle_y = 0;
       move_y = -move_y;
     }
}
}
