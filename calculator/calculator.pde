// Calculator by Joanna Soh
// There is an error with my special buttons

CalcButton[] numButtons = new CalcButton[10];
CalcButton[] opButtons = new CalcButton[7];
CalcButton[] spButtons = new CalcButton[4];

String displayValue = "0";
String valueToCompute = "";
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float result = 0;
char opValue = ' ';

boolean firstNum;

void setup() {
  size(250, 345);
  background(240, 251, 255);
  noFill();
  strokeWeight(0);
  stroke(200);

  numButtons[0] = new CalcButton(100, 290, 35, 35).asNumber(0);
  numButtons[1] = new CalcButton(150, 263, 35, 35).asNumber(1);
  numButtons[2] = new CalcButton(100, 240, 35, 35).asNumber(2);
  numButtons[3] = new CalcButton(50, 263, 35, 35).asNumber(3);
  numButtons[4] = new CalcButton(50, 213, 35, 35).asNumber(4);
  numButtons[5] = new CalcButton(100, 190, 35, 35).asNumber(5);
  numButtons[6] = new CalcButton(150, 213, 35, 35).asNumber(6);
  numButtons[7] = new CalcButton(50, 163, 35, 35).asNumber(7);
  numButtons[8] = new CalcButton(100, 140, 35, 35).asNumber(8);
  numButtons[9] = new CalcButton(150, 163, 35, 35).asNumber(9);


  opButtons[0] = new CalcButton(200, 263, 40, 35).asOperator("+");
  opButtons[1] = new CalcButton(150, 310, 100, 40).asOperator("=");
  opButtons[2] = new CalcButton(50, 80, 135, 40).asOperator("C");
  opButtons[3] = new CalcButton(200, 177, 40, 35).asOperator("×");
  opButtons[4] = new CalcButton(200, 133, 40, 35).asOperator("÷");
  opButtons[5] = new CalcButton(200, 220, 40, 35).asOperator("-");
  opButtons[6] = new CalcButton(200, 80, 60, 35).asOperator("±");

  spButtons[0] = new CalcButton(0, 310, 80, 40).asSpecial(".");
  spButtons[1] = new CalcButton(5, 190, 35, 35).asSpecial("sq");
  spButtons[2] = new CalcButton(5, 140, 35, 35).asSpecial("√");
  spButtons[3] = new CalcButton(5, 240, 35, 35).asSpecial("%");


  firstNum = true;
}

void draw() {
  background(240, 251, 255);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].click(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].click(mouseX, mouseY);
  }
  for (int i=0; i<spButtons.length; i++) {
    spButtons[i].display();
    spButtons[i].click(mouseX, mouseY);
  }
  updateDisplay();
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].click(mouseX, mouseY);
    if (numButtons[i].overBox) {
      if (firstNum) {
        valueToCompute += int(numButtons[i].numVal);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(numButtons[i].numVal);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].click(mouseX, mouseY);
    if (opButtons[i].overBox) {
      if (opButtons[i].opVal == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI = 0;
        result = 0;
        firstNum = true;
      } else if (opButtons[i].opVal == "=") {
        // Perform calculation
        firstNum = true;
        performCalc();
      } else if (opButtons[i].opVal == "+") {
        if (result != 0) {
          opValue = '+'; 
          valueToCompute2 = "";
          firstNum = false;
        } else {
          opValue = '+'; 
          firstNum = false;
        }
      } else if (opButtons[i].opVal == "-") {
        if (result != 0) {
          opValue = '-'; 
          valueToCompute2 = "";
          firstNum = false;
        } else {
          opValue = '-'; 
          firstNum = false;
        }
      } else if (opButtons[i].opVal == "÷") {
        if (result != 0) {
          opValue = '/'; 
          valueToCompute2 = "";
          firstNum = false;
        } else {
          opValue = '/'; 
          firstNum = false;
        }
      } else if (opButtons[i].opVal == "×") {
        if (result != 0) {
          opValue = '*'; 
          valueToCompute2 = "";
          firstNum = false;
        } else {
          opValue = '*'; 
          firstNum = false;
        }
      } else if (opButtons[i].opVal == "±") {
        opValue = 'n';
        performCalc();
      }
    }
  }
  //for (int i=0; i<spButtons.length; i++) {
  //  spButtons[i].click(mouseX, mouseY);
  //  if (spButtons[i].overBox) {
  //    if (spButtons[i].spVal ==".") {
  //      if (spButtons[i].overBox && firstNum == true) {
  //        valueToCompute += spButtons[i].spVal;
  //        displayValue = valueToCompute;
  //      } else if (spButtons[i].overBox && firstNum == false) {
  //        valueToCompute2 += spButtons[i].spVal;
  //        displayValue = valueToCompute2;
  //      }
  //    }
  //  } else if (spButtons[i].spVal == "%") {
  //    if (result != 0) {
  //      opValue = 'p'; 
  //      valueToCompute2 = "";
  //      firstNum = false;
  //      performCalc();
  //    } else {
  //      opValue = 'p'; 
  //      firstNum = false;
  //      performCalc();
  //    }
  //  } else if (spButtons[i].spVal == "sq") {
  //    if (result != 0) {
  //      opValue = 's'; 
  //      valueToCompute2 = "";
  //      firstNum = false;
  //      performCalc();
  //    } else {
  //      opValue = 's'; 
  //      firstNum = false;
  //      performCalc();
  //    }
  //  } else if (spButtons[i].spVal == "√") {
  //    if (result != 0) {
  //      opValue = 'r'; 
  //      valueToCompute2 = "";
  //      firstNum = false;
  //      performCalc();
  //    } else {
  //      opValue = 'r'; 
  //      firstNum = false;
  //      performCalc();
  //    }
  //  }
  //}
}
void performCalc() {
  // set string values to integers
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  // perform calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 's') {
    if (firstNum) {
      valueToComputeI = sq(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sq(valueToComputeI2);
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 'r') {
    if (firstNum) {
      valueToComputeI = sqrt(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sqrt(valueToComputeI2);
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 's') {
    if (firstNum) {
      valueToComputeI = sq(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sq(valueToComputeI2);
      displayValue = str(valueToComputeI);
    }
  } else if (opValue == 'p') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*0.010000000;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*0.010000000;
      displayValue = str(valueToComputeI);
    }
  } 
  // let = work multiple times
  //if (firstNum) {
  //  valueToCompute = displayValue;
  //} else {
  //  valueToCompute = displayValue;
  //  valueToCompute2 = "";
  //}
}

void updateDisplay() {
  fill(80, 80, 80);
  rect(0, 0, 310, 80);
  fill(255);
  textSize(50);
  text(displayValue, 10, 55);
}