void setup() {
}

void settings() {
  size (501, 501);
}

void draw() {
  background (255);
  
  stroke(0);
  strokeWeight(3);
  line (0,250,width,250);
  strokeWeight(1);
  numLine(0,270);
  noStroke();
  fill(255,0,9);
  ellipse (mouseX,250,7,7);
  
  text("USD= $" + mouseX + " \nEuro= € " + changeUsdToEuro(mouseX)+ "\nJPY= ¥" + changeUsdToJpy(mouseX) + "\nGBP= £" + changeUsdToGbp(mouseX)+ "\nCHF= CHF" + changeUsdToChf(mouseX)+ "\nSGD= $" + changeUsdToSgd(mouseX) + "\nCNY= ¥" + changeUsdToCny(mouseX), 50,50);
  
}

float changeUsdToSgd (float USD) {
  float SGD = (USD * 1.410689);
  return SGD;
}

float changeUsdToEuro (float USD) {
  float Euro = (USD * 0.888804);
  return Euro;
}

float changeUsdToCny (float USD) {
  float CNY = (USD * 6.355912);
  return CNY;
}

float changeUsdToJpy (float USD) {
    float JPY = (USD * 119.926462);
    return JPY;
}

float changeUsdToGbp (float USD){
  float GBP = (USD * 0.652664);
  return GBP;
}

float changeUsdToChf (float USD) {
  float CHF = (USD * 0.973232);
  return CHF;
}

void numLine(int xpos, int ypos){
  for (int i=0; i < 980; i += 50){
    text (i, i-5, ypos);
    line (i ,ypos-20,i,ypos-10);
  }
}