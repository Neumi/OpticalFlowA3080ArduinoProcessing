
// Code by: Jan Neumann aka. Neumi
//          https://github.com/Neumi
//          https://www.youtube.com/user/NeumiElektronik
// All code is published unter MIT license. Feel free to use!

import processing.serial.*;

Serial myPort;

String myRawString = "-00,+00";

float posX = 200;
float posY = 200;

int driftX = 0;
int driftY = 0;


void setup() {
  size(400, 400);
  String portName = Serial.list()[1];    //Change this port depending on your system.
  myPort = new Serial(this, portName, 38400);
}

void draw() {
  background(0, 150, 200);
  
  while (myPort.available() > 0) {
    myRawString = myPort.readStringUntil('\n');
    if (myRawString != null) {
      //println(myRawString);
    }
  }
  
  
  //myRawString = "-23,+10";
  
  String strX = myRawString.substring(0, 3);
  String strY = myRawString.substring(4, 7);
  
  driftX = parseInt(strX)*-1;
  driftY = parseInt(strY);
  
  println("X: "+ driftX);
  println("Y: "+ driftY);
  
  posX = posX + ((driftX) * 1);
  posY = posY + ((driftY) * 1);
  
  if (mousePressed) {     //reset position
    posX = 200; 
    posY = 200;
  }
  
  line(200, 0, 200, 400);
  line(0, 200, 400, 200);
  fill(210, 0, 0);
  ellipse(posX, posY, 10, 10);
  
  
  text("PosX: " + posX, 10, 15);
  text("PosY: " + posY, 10, 30);
  text("DriftX: " + driftX, 10, 50);
  text("DriftY: " + driftY, 10, 65);
}