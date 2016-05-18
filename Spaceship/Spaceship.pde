//Class Name
class Spaceship {
  //Member Variables
  color c;
  float xpos;
  float ypos;
  float xspeed;
  //Constructor
  Spaceship(color tempC, float tempXpos, float tempYpos, float tempXspeed) {
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  //Visibility Method
  void display(){
    rectMode(CENTER);
    fill(c);
    rect(xpos,ypos,20,5);
    rect(xpos-2,ypos-5,15,5);
    fill(255);
    rect(xpos+2,ypos-5,5,3);
    rect(xpos-5,ypos-5,5,3);
    rect(xpos+9,ypos-5,1,5);
    fill(0);
    ellipse(xpos+5,ypos+5,5,5);
    ellipse(xpos-7,ypos+5,5,5);
  }
  //Behavior Method
  void fly(){
    xpos = xpos + xspeed;
    if(xpos> width){
      xpos = 0;
    }
  }
  void fly2(){
    xpos= xpos - xspeed;
    if(xpos>width){
      xpos = 0;
    }
  }
}