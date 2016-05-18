void setup(){
  size(900,400);
}

void draw(){
  background(0);
  drawRef();
  histEvent("Zuse Z3 (Germany) \n 1941","Program-controlled by punched \n35 mm film stock (but no conditional branch)",50,170,160,30,true);
  histEvent("Colossus Mark I(UK) \n 1944","Not programmable- single purpose",25,295,235,30,false);
  histEvent("Harvard Mark I – \nIBM ASCC (US) \n1944", "Program-controlled by 24-channel punched paper tape \n(but no conditional branch)",250,170,170,30,true);
  histEvent("Colossus Mark 2 (UK) \n1944","Program-controlled by patch cables and switches",270,295,240,30,false);
  histEvent("ENIAC (US) \n 1946","Program-controlled by patch cables and switches",450,170,175,30,true);
  histEvent("Manchester \nSmall-Scale \nExperimental Machine (Baby) (UK) \n1948","Stored-program in Williams cathode ray tube memory",520,295,155,30,false);
  histEvent("Manchester Mark 1 (UK) \n1949","Stored-program in Williams cathode ray tube memory\n and magnetic drum memory",650,170,115,30,true);
  histEvent("CSIRAC (Australia) \n 1949","Stored-program in mercury delay line memory",680,295,190,30,false);
}

void histEvent(String bText, String dText, int x, int y, int w, int h, boolean top){
  fill(178,158,103);
  strokeWeight(1);
  if (top){
    stroke(255);
    line (x+50,y+30,x+100,y+80);
  } else{
    stroke(255);
    line (x+50,y+30,x+100,y-45);
  }
  fill(255);
  textSize(15);
  text(bText,x+10,y+20);
  if(mouseX>x && mouseX<=x+w && mouseY>y && mouseY<=y+h){
    if (top){
      fill(176,226,252);
      textSize(9);
      text(dText,x,y-20);
    } else{
      fill(176,226,252);
      textSize(9);
      text(dText,x,y+55);
    }
  }
}

void drawRef(){
  fill(255);
  textSize(33);
  text("Historic Computer Systems",250,50);
  fill(255);
  textSize(13);
  text("by Joanna Soh",250,100);
  strokeWeight(3);
  stroke(255);
  line(50,250,850,250);
}