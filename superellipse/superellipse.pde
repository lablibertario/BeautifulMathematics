import java.lang.Math;
private int counter = 0;
private float oldX;
private float oldY;

void setup() {
  size(780, 760, P3D);
  camera(0, 0, 130, 50.0, 50.0, 0.0, 
       0.0, 1.0, 0.0);
  rotateX(80);
  // drawSuperEllipse(100, counter, 300,300, 4);
  oldX=480;
  oldY=380;
  //drawSprialTest(50,0.01,oldX,oldY);
  // drawEpizykloide();
  //drawKugel();
  stroke(115,12,255);
  //noFill();
  drawShell();
}

void draw() {
  //drawSuperEllipse(100,counter,300+random(15),300+random(15),4);
}

//Archimedian
void drawShell() {
  PImage img = loadImage("shell.jpg");
  float radius = 300; 
  float x =380;
  float y = 760;
  float z = -100;
  beginShape();
  //texture(img);
  int counter2 = 0;
  int counter = 0;
  int distance =35;
  
  for (float i = 1; i <20; i+=0.1) {
    if(i > 2){
      distance = 35;
    }
    for(int l = 0; l < 3; l++){
      switch(l){
        case 0:
          vertex(x+radius*cos(i), y+radius*sin(i), z+i*distance);
        break;
        case 1:
          vertex(380, 760, z+i*distance+500);
        break;
        case 2:
          vertex(x+radius*cos(i+0.1), y+radius*sin(i+0.1), z+(i+0.1)*distance);
           //Deckel
          vertex(x+radius*cos(i), y+radius*sin(i), z+i*distance);
          vertex(380, 760, z+i*distance);
          vertex(x+radius*cos(i+0.1), y+radius*sin(i+0.1), z+(i+0.1)*distance);        
        break;
      }
    }
    counter++;
    
    //point(x+radius*cos(i), y+radius*sin(i), z+i*12);
    radius=radius+0.2;
  }
  endShape(CLOSE);
}

void drawKugel() {
  // for(float i = 0; i < 360; i++){
  // for(float j = 0; j < 360; j++){
  //  point(500+50*cos(j), 500+50*sin(j));
  //}
  for (float j = 0; j <360; j+=1) {    
    for (float i = 0; i < 360; i+=1) {
      stroke(180-(1+200*cos(i)));
      point(500+200*sin(i)*cos(j), 500+200*sin(j)*sin(i), 1+200*cos(i));
    }
  }
  // }
}

void drawCircle(int radius, int winkel, int x, int y) {
  for (int i = 0; i <1080; i++) {
    point(x+radius*cos(i), y+radius*sin(i));
  }
}

void drawSuperEllipse(int radius, int winkel, int x, int y, float n) {
  for (float i = 0; i <1080; i+=0.1) {
    point(x+radius*pow(cos(i), 2/n), y+radius*pow(sin(i), 2/n));
    point(x+radius*pow(cos(i), 2/n), y+radius*-pow(sin(i), 2/n));
    point(x+radius*-pow(cos(i), 2/n), y+radius*pow(sin(i), 2/n));
    point(x+radius*-pow(cos(i), 2/n), y+radius*-pow(sin(i), 2/n));
  }
}
//Logarithmic
void drawSprialLog(float radius, float distance, float x, float y) {
  radius = 1;
  for (float i = 0; i <720; i+=0.001) {
    point(x+radius*cos(i), y+radius*sin(i));
    radius = 1*pow((float)Math.E, .53468*i);
  }
}
//Archimedian
void drawSprial(float radius, float distance, float x, float y) {
  for (float i = 0; i <720; i+=distance*0.1) {
    point(x+radius*cos(i), y+radius*sin(i));
    radius=(x+y*i)*0.01;
  }
}
//Test
void drawSprialTest(float radius, float distance, float x, float y) {
  float o = radius;
  for (float i = 0; i <10000; i+=0.01) {
    point(x+radius*cos(i), y+radius*sin(i));
    point(x+-radius*cos(i), y+-radius*sin(i));
    //radius=(x+y*i)*0.01;
    radius = o*pow(i, 0.5);
  }
}

//Kardiode
void drawKardioid() {
  for (float i = 0; i < 80000; i+=1) {
    point(500+2*100*(1-cos(i))*cos(i), 400+2*100*(1-cos(i))*sin(i));
  }
}/*
void drawEpizykloide() {
 float a= 50;
 float b= 360;
 float x;
 float y;   
 for (float i = 0; i < 100000; i+=1) {
 x = 400+(a+b)*cos(i)-a*cos((1+(b/a))*i);
 y = 400+(a+b)*sin(i)-a*sin((1+(b/a))*i);
 point(x, y);
 }
 }
 */
//Epizykloide
void drawEpizykloide() {
  int a = 50;
  int b = 360;
  float x;
  float y;
  for (float i = 0; i < 100000; i+=1) {
    // x = 400+(a+b)*cos(i)-a*cos((1+(b/a))*i);
    // y = 400+(a+b)*sin(i)-a*sin((1+(b/a))*i);
    x = 400+(a+b)*cos(i)-a*cos((1+(b/a))*i);
    y = 400+(a+b)*sin(i)-a*sin((1+(b/a))*i);
    point(x, y);
    // point(400+b*cos(i), 400+b*sin(i));
  }
}
/*void drawF(int x, int y, int length){
 int angle = 0;
 for(int i=0; i < 9000; i++){
 point(x+i*cos(angle),y+i*sin(angle)); 
 if(i%length == 0 && i != 0){
 angle=+54;
 }
 }
 }*/