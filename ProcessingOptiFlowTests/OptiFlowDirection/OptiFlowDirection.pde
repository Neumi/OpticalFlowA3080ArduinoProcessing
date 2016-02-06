

int posX = 200;
int posY = 200;
int deg = 0;

int driftX = 0;
int driftY = 0;



int radius = 200; //radis in mm to center from sensors
float extent;

void setup() {

  size(400, 400);

  noCursor();
  //cursor(CROSS);
  
  someBasicCalc();
  
}

void draw() {
  background(80, 90, 100);
  
  posX = mouseX;
  posY = mouseY;
  //deg = mouseX;
  
  driftX = mouseX-200;
  driftY = mouseY-200;
  
  
  
  
  drawRobot(posX, posY, mouseX);
  //drawVectorCross(mouseX, mouseY);
}



void drawRobot(int x, int y, int deg) {
  println(x);
  fill(24, 171, 196);
  ellipse(x, y, 80, 80);
  int cx = x;
  int cy = y;
  int h;
  int cr = 40;
  h = deg;
  h = h*-1;
  h = h + 90;
  strokeWeight(1);
  line((int)cx, (int)cy, (int)(cx+(cr-10)*cos(PI/180*h)), (int)(cy-(cr-10)*sin(PI/180*h)));
  strokeWeight(3);
  cr = 55;
  h = h+55;
  line((int)(cx+(cr)*cos(PI/180*h+20)), (int)(cy-(cr)*sin(PI/180*h+20)), (int)(cx+(cr)*cos(PI/180*h)), (int)(cy-(cr)*sin(PI/180*h)));
  h = h+180;
  line((int)(cx+(cr)*cos(PI/180*h+20)), (int)(cy-(cr)*sin(PI/180*h+20)), (int)(cx+(cr)*cos(PI/180*h)), (int)(cy-(cr)*sin(PI/180*h)));
}

void drawVectorCross(float dirX, float dirY) {
  //dirX = dirX + 50; //to set on zero
  //dirY = dirY + 50; //to set on zero
  //dirY = dirY*-1;
  
  dirY = dirY*-1;
  
  println("X: " + dirX);
  println("Y: " + dirY);
  
  strokeWeight(1);
  fill(129, 139, 149);
  rect(0, 0, 100, 100);
  line(50, 0, 50, 100);
  line(0, 50, 100, 50);
  strokeWeight(2);
  line(50, 50, 50 + dirX, 50 + dirY);
}