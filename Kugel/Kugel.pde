import java.lang.Math;
private int counter = 0;
private float oldX;
private float oldY;

void setup() {
  size(780, 760, P3D);
  rotateX(80);
  // drawSuperEllipse(100, counter, 300,300, 4);
  oldX=480;
  oldY=380;
  //drawSprialTest(50,0.01,oldX,oldY);
  // drawEpizykloide();
  drawKugel();
  stroke(115,12,255);
  //noFill();
  //drawShell();
}

void draw() {
  //drawSuperEllipse(100,counter,300+random(15),300+random(15),4);
}


void drawKugel() {
  // for(float i = 0; i < 360; i++){
  // for(float j = 0; j < 360; j++){
  //  point(500+50*cos(j), 500+50*sin(j));
  //}
  for (float j = 0; j <360; j+=1) {    
    for (float i = 0; i < 360; i+=1) {
      stroke(100+sin(j)*sin(i));
      point(400+200*sin(i)*cos(j), 400+200*sin(j)*sin(i), 400+200*cos(i));
    }
  }
  // }
}