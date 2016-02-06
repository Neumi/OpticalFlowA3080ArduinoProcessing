
import processing.serial.*;

Serial myPort;

String myRawString = "-00,+00";


int driftX = 0;
int driftY = 0;

float posX = 200;
float posY = 200;



int posXLeft = 100;
int posYLeft = 100;

int posXRight = 0;
int posYRight = 0;

float centerXpos = 0;
float centerYpos = 0;

int deg = 0;

int cx = 50;
int cy = 50;
int cr = 55;

int displX = 1500;
int displY = 800;

void setup() {
  size(1500,800);
  
  
  String portName = Serial.list()[1];    //Change this port depending on your system.
  myPort = new Serial(this, portName, 38400);
  
}

void draw() {
  background(80, 90, 100);
  
  /*
  while (myPort.available() > 0) {
    myRawString = myPort.readStringUntil('\n');
    if (myRawString != null) {
      //println(myRawString);
    }
  }
  */
  
  String strX = myRawString.substring(0, 3);
  String strY = myRawString.substring(4, 7);
  
  driftX = parseInt(strX)*-1;
  driftY = parseInt(strY);
  
  println("X: "+ driftX);
  println("Y: "+ driftY);
  
  posX = posX + ((driftX) * 1);
  posY = posY + ((driftY) * 1);
  
  if (mousePressed) {     //reset position
    posX = displayWidth/2; 
    posY = displayHeight/2;
  }
  
  
  
  centerXpos = posX;
  centerYpos = posY;
  
  deg = 0;
  
  drawRobot(centerXpos, centerYpos, deg);
  
  
  translate(10,10);
  drawVectorCross(driftX, driftY);
  translate(110,0);
  drawVectorCross(driftX, driftY);
  translate(-110, 110);
  drasCompass(mouseX);    //deg 0 bis 360 uebergeben 
  
  
}

void drawRobot(float centerX, float centerY, int deg) {
  fill(24,171,196);
  strokeWeight(2);
  
  ellipse(centerX, centerY, 120, 120); //main body
  
  
  
  
  
  
}
void drasCompass(int h) {
  h = h*-1;
  h = h + 90;
  strokeWeight(1);
  fill(129,139,149);
  rect(0,0,100,100);
  ellipse(50,50,95,95);
  line((int)cx,(int)cy,(int)(cx+(cr-10)*cos(PI/180*h)),(int)(cy-(cr-10)*sin(PI/180*h)));
  fill(250);
  text("Deg: " ,37,70);
  text((h-90)*-1,37,84);
}

void drawVectorCross(float dirX, float dirY) {
  dirX = dirX + 50; //to set on zero
  dirY = dirY + 50; //to set on zero
  strokeWeight(1);
  fill(129,139,149);
  rect(0,0,100,100);
  line(50,0,50,100);
  line(0,50,100,50);
  strokeWeight(2);
  line(50,50, dirX, dirY);
}