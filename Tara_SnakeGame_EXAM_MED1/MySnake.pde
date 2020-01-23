class Snake {
  PVector position;              // Vector that points from the origin to its location
  PVector velocity;              // The rate at which the object's position changes per time unit
  ArrayList<PVector> history;    // Arraylist stores PVector obejcts
  int size;                      // Snakes tale
  int moveX = 0;                 // Starting position of the snake
  int moveY = 0;                 // Starting position of the snake

  Snake() {
    position = new PVector(0, 0);
    velocity = new PVector();
    history = new ArrayList<PVector>();
    size = 0;
  }

  void update() {
    history.add(position.copy());        // History keeps track of the tail, add the current position
                                         // then removing the last to that, the tail of the snake will follow the front of it
    // moves the snake
    position.x += velocity.x*elSize;     
    position.y += velocity.y*elSize;
    moveX = int(velocity.x);
    moveY = int(velocity.y);

    position.x = (position.x + width) % width;      // Uses modulo operator, which takes the remainder of division
    position.y = (position.y + height) % height;    // this allows the snake to go through the walls 
                                                    // adding width and height allows it to travel through all the walls

    if (history.size() > size) {
      history.remove(0);                            // Removes the given item from the list
    }


    for (PVector a : history) {                      // Iterate every value of history set to the local variable a. 
// Snake dies if touching its own tale               //Result in displaying all of the snake, not just the front.
      if (a.x == position.x && a.y == position.y) {  // == means it's equivalent and is only used with booleans
        dead = true;
      }
    }
  }

// when the snake hits the snack the tail grows by 1
  void eat() {
    if (position.x == snack.x && position.y == snack.y) {        // && Compares two expressions and returns true only if both expressions are to true.
      size++;                                                    // Increase the length of the snake by one
      if (speed > 5) speed--;
      newSnack();                                                // Calls the function to move the snack to a new place
      file.play();                                               // playing the sound everytime the snake hits the snack
    }
  }
  
  void hitEnemy() {
    if (position.x == enemy.x && position.y == enemy.y) {       // The snake dies if it hits the enemy (rectangle)
      dead = true;                                              // If dead is true the game start over
      if (size > highscore) highscore = size;                  //Saves the highscore everytime you die, if you surpass it
       }
  }

  void show() {
    noStroke();
    fill(125);
    ellipse(position.x, position.y, elSize, elSize);     // Making the start snake
    for (int i = 0; i < history.size(); i++) {           // For-loop that reads each elemt of an array, it's looping over the history-F
      PVector a = history.get(i);                        // array and setting the variable a to each element of history (the tail)         
      ellipse(a.x, a.y, elSize, elSize);                 // then displaying that as an ellipse
    }
  }
}

void keyPressed() {
  if (keyCode == LEFT && mysnake.moveX != 1) {           // Makes sure the snake moves left when left key is pressed and makes sure the snake can't go backwards
    mysnake.velocity.x = -1;                             // ! : Inverts the Boolean value of an expression
    mysnake.velocity.y = 0;                              //keyCode is used to detect special keys  
  } else if (keyCode == RIGHT && mysnake.moveX != -1) {  // Makes sure the snake moves right when right key is pressed and makes sure the snake can't go backwards
    mysnake.velocity.x = 1;
    mysnake.velocity.y = 0;                              //makes sure that the snake cant go on the y-axis, this insures that the snake only go horizontal
  } else if (keyCode == UP && mysnake.moveY != 1) {      // Makes sure the snake moves up when up key is pressed and makes sure the snake can't go backwards
    mysnake.velocity.y = -1;
    mysnake.velocity.x = 0;                              //makes sure the snake only go vertical
  } else if (keyCode == DOWN && mysnake.moveY != -1) {   // Makes sure the snake moves down when down key is pressed and makes sure the snake can't go backwards
    mysnake.velocity.y = 1;
    mysnake.velocity.x = 0;                              //it also makes sure that it can't go diagonal
  }
}
