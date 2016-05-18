void setup(){
  size(800,800);
}

void draw(){
  background(117,206,252);
  zoog(mouseX,mouseY);
  //zoog(int(random(width)),int(random(height)));
  
}

void zoog(int x,int y){
  rectMode(CENTER);
  
  stroke(0);
  fill(0);
  rect(x,y,20,100);
  
  stroke(0);
  fill(72,114,203);
  rect(x+5,y+50, 10,50);
  rect(x-5,y+50,10,50);
  
  stroke(0);
  fill(255);
  ellipse(x,y-30,60,60);
  
  fill(0);
  ellipse(x-19,y-30,16,32);
  ellipse(x+19,y-30,16,32);
  ellipse(x+9,y+75,15,6);
  ellipse(x-5,y+75,15,6);
  
  stroke(0);
  line(x-10,y+8,x-20,y+30);
  line(x+10,y+8,x+20,y+30);
  line(x-9,y-10,x+2,y-10);
  
}