
// Code by: Jan Neumann aka. Neumi
//          https://github.com/Neumi
// All code is published unter MIT license. Feel free to use!

import processing.serial.*;

Serial myPort;

String myRawString = "-00,+00";

float posX = 200;
float posY = 200;
float deg = 0;

float driftX = 0;
float driftY = 0;

int radius = 156; //radis in mm to center from sensors
int robotRadius = 140;
float extent;

float trimFactorDeg = 1;

void setup() {

  size(800, 600);

  //noCursor();
  cursor(CROSS);

  someBasicCalc();

  println(Serial.list());
  String portName = Serial.list()[2];    //Change this port depending on your system.
  myPort = new Serial(this, portName, 57600);
}

void draw() {
  background(80, 90, 100);
  strokeWeight(1);

  line(200, 0, 200, height);
  line(0, 200, width, 200);
  line(0, 356, width, 356);

  getSerial();

  if (mousePressed) {
    posX = 200;
    posY = 200;
    deg = 0;
  }


  /*
  driftX = mouseX-200;
   driftY = mouseY-200;
   */



  calculatePos(driftX, driftY);


  drawRobot(posX, posY, deg);

  drawVectorCross(driftX, driftY);
}

void calculatePos(float driftX, float driftY) {
  float val = 1.2;
  driftX = driftX/4 * val;
  driftY = driftY/4 * val;
  deg = deg + driftX*trimFactorDeg;
  //println((cos(radians(45))*30));
  /*
  println("Deg: " + deg);
   println("SpedVec: " + driftY);
   */
  println(deg);
  posX = posX + (cos(radians(deg+90))*driftY);

  posY = posY + (sin(radians(deg+90))*driftY);
  //ellipse(posX+100, posY+100,10,10);
}


void drawRobot(float x, float y, float deg) {
  //println(x);

  noFill();
  ellipse(x, y, radius*2, radius*2);
  fill(24, 171, 196);
  ellipse(x, y, robotRadius*2, robotRadius*2);
  float cx = x;
  float cy = y;
  float h;
  int cr = radius;
  h = deg;
  h = h*-1;
  h = h + 90;
  strokeWeight(4);
  line((int)cx, (int)cy, (int)(cx+(cr-10)*cos(PI/180*h)), (int)(cy-(cr-10)*sin(PI/180*h)));
  strokeWeight(1);
}

void drawVectorCross(float dirX, float dirY) {
  //dirX = dirX + 50; //to set on zero
  //dirY = dirY + 50; //to set on zero
  //dirY = dirY*-1;

  /*
  println("X: " + dirX);
   println("Y: " + dirY);
   */
  dirY = dirY*+1;

  strokeWeight(1);
  fill(129, 139, 149);
  rect(0, 0, 100, 100);
  line(50, 0, 50, 100);
  line(0, 50, 100, 50);
  strokeWeight(2);
  line(50, 50, 50 + dirX, 50 + dirY);
}

void getSerial() {

  while (myPort.available() > 0) {
    myRawString = myPort.readStringUntil('\n');
    if (myRawString != null) {
      println(myRawString);
    }
  }

  //myRawString = "-23,+10";

  String strX = myRawString.substring(0, 3);
  String strY = myRawString.substring(4, 7);

  driftX = parseInt(strX)*-1;
  driftY = parseInt(strY);
}