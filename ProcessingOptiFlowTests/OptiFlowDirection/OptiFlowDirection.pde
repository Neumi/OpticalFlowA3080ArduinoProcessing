
// Code by: Jan Neumann aka. Neumi
//          https://github.com/Neumi
// All code is published unter MIT license. Feel free to use!

float posX = 200;
float posY = 200;
float deg = 0;

int driftX = 0;
int driftY = 0;

int radius = 200; //radis in mm to center from sensors
float extent;

float trimFactorDeg = 0.1;

void setup() {

  size(400, 400);

  //noCursor();
  cursor(CROSS);
  
  someBasicCalc();
  
}

void draw() {
  background(80, 90, 100);
  strokeWeight(1);
  line(200, 0, 200, 400);
  line(0, 200, 400, 200);
  
  
  
  driftX = mouseX-200;
  driftY = mouseY-200;
  driftY = driftY*-1;
  
  
  calculatePos(driftX, driftY);
  
  drawRobot(posX, posY, deg);
  drawVectorCross(driftX, driftY);
}

void calculatePos(int driftX, int driftY) {
  deg = deg + driftX*trimFactorDeg;
  
  //posX = posX + ();
  
}


void drawRobot(float x, float y, float deg) {
  println(x);
  fill(24, 171, 196);
  ellipse(x, y, 60, 60);
  float cx = x;
  float cy = y;
  float h;
  int cr = 40;
  h = deg;
  h = h*-1;
  h = h + 90;
  strokeWeight(1);
  line((int)cx, (int)cy, (int)(cx+(cr-10)*cos(PI/180*h)), (int)(cy-(cr-10)*sin(PI/180*h)));
  
  
}

void drawVectorCross(float dirX, float dirY) {
  //dirX = dirX + 50; //to set on zero
  //dirY = dirY + 50; //to set on zero
  //dirY = dirY*-1;
  
  println("X: " + dirX);
  println("Y: " + dirY);
  
  dirY = dirY*-1;
  
  strokeWeight(1);
  fill(129, 139, 149);
  rect(0, 0, 100, 100);
  line(50, 0, 50, 100);
  line(0, 50, 100, 50);
  strokeWeight(2);
  line(50, 50, 50 + dirX, 50 + dirY);
}