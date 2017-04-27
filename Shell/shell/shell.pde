import java.lang.Math;
private float oldX;
private float oldY;
private int counter = 1;
private PImage img;
void setup() {
  size(780, 760, P3D);
  rotateX(PI/2);
  img = loadImage("shell.jpg");
  drawSprial();
}

void draw() {
  //drawSuperEllipse(100,counter,300+random(15),300+random(15),4);
}

//Archimedian
void drawSprial() {
   
  float radius = 10; 
  float distance = 0.2;
  //float distance = 0.008;
  float x = 380;
  float y = 430;
  float z = -270;
  float radiusChanger =5;
  for (float i = distance; i <20.3; i+=distance) {
    z = z * 1.0025;   
    drawCircle(radiusChanger,x,y,z,distance, i, radius);
    radiusChanger+=0.15;
    radius=radius*1.015;
  }
  
}

void drawCircle(float radius, float x, float y, float z, float distance, float k, float realRad) {
 stroke(120,120,120);
 //noStroke();
 fill(255);
 int countUV1= 0;
 int countUV2 = 0;
beginShape(TRIANGLE_STRIP);
texture(img);
 vertex(x+realRad*cos(k)+radius*cos(0), y+realRad*sin(k)+radius*sin(0),z+radius*sin(0),x,y);
 vertex(x+realRad*1.015*cos(k+distance)+radius*cos(0), y+realRad*1.015*sin(k+distance)+radius*sin(0),z*1.0025+radius*sin(0),x,y);
  for (float i = .1; i <6.3; i+=.1) {  
       vertex(x+realRad*cos(k)+radius*cos(i), y+realRad*sin(k)+radius*sin(i),z+radius*sin(i),countUV1,countUV2);
       vertex(x+realRad*1.015*cos(k+distance)+radius*cos(i), y+realRad*1.015*sin(k+distance)+radius*sin(i),z*1.0025+radius*sin(i),countUV1+10,countUV2+50);
        countUV1+=10;
       if(i % 1.1 == 0){
         countUV2 +=50;
       }
  }
  endShape();
}