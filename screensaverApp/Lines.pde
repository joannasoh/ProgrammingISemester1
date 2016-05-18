class Lines {
  //class variables
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;

  //constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }
  //display 
  void display() {
    strokeW = random(1,2);
    //strokeW= 5;
    lineLength = random(1, 45);
    //stroke(0,255,248);
    stroke(random(0), random(255), random(248));
    if (xpos>width || xpos<0 || ypos> height || ypos<0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      if (random(100)>90) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else if (random(100)>80) {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      } else if (random(100)>70) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (random(100)>60) {
        strokeWeight(strokeW);
        moveDownRight(xpos, ypos, lineLength);
      } else if (random(100)>50) {
        strokeWeight(strokeW);
        moveDownLeft(xpos, ypos, lineLength);
      } else if (random(100)>40) {
        strokeWeight(strokeW);
        moveUpLeft(xpos, ypos, lineLength);
      } else if (random(100)>30) {
        strokeWeight(strokeW);
        moveUpRight(xpos, ypos, lineLength);
      } else {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      }
    }
  }


  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX-i;
      ypos = startY;
    }
  }
  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX+i;
    }
  }
  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY -i;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY +i;
    }
  }
   void moveDownRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      xpos = startX+i;
      ypos = startY +i;
    }
  }
  void moveDownLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY+i);
      xpos = startX-i;
      ypos = startY +i;
    }
  }
  void moveUpLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      xpos = startX-i;
      ypos = startY -i;
    }
  }
  void moveUpRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      xpos = startX+i;
      ypos = startY-i;
    }
  }
}