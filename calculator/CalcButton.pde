class CalcButton {
  // Class variables
  boolean isNum, isSp, overBox;
  float numVal, x, y;
  String opVal, spVal;
  int bSize, w, h;

  CalcButton(float x, float y, int tempW, int tempH) {
    this.x = x;
    this.y = y;
    w = tempW;
    h = tempH;
  }

  //Constructor for numbers
  CalcButton asNumber(float tempNumVal) {
    isNum = true;
    numVal = tempNumVal;
    return this;
  }

  //Constructor for operators
  CalcButton asOperator(String tempOpVal ) {
    opVal = tempOpVal;
    return this;
  }
  //Constructor for special buttons
  CalcButton asSpecial(String buttonValue) {
    isSp = true;
    spVal = buttonValue;
    return this;
  }
  //Draw the button on the canvas
  void display() {
    if (isNum) {
      // Rollover effect
      if (overBox) {
        fill(122);
      } else {
        fill(186);
      }
      stroke(0);
      rect(x, y, w, h);
      fill(0);
      textSize(22);
      text(int(numVal), x+10, y+25);
    } else if ( isSp) {
      if (overBox) {
        fill(170,88,10);
      } else {
        fill(255, 136, 18);
      } 
      
      stroke(0);
      rect(x, y, w, h);
      fill(0);
      textSize(22);
      text(spVal, x+10, y+28);
    } else {
      if (overBox) {
        fill(170,88,10);
      } else {
        fill(255, 136, 18);
      }
      rect(x, y, w, h);
      if (w>90) {
        fill(0);
        textSize(22);
        text(opVal, x+40, y+25);
      } if (x<=50) {
        
        fill(0);
        rect(x, y, w, h);
        if (overBox) {
        fill(128);
      } else {
        fill(255);
      }
        textSize(22);
        text(opVal, x+60, y+25);
      }else {
        fill(0);
        textSize(22);
        text(opVal, x+11, y+25);
      }
    }
  }
  void click(int xpos, int ypos) {
    overBox = xpos>x && xpos<x+w && ypos>y && ypos<y+h;
  }
}




//Handle} mouse actions