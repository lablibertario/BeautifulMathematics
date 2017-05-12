import java.lang.Math;

int counter = 0;
int max = 100;
int secondMax = 200;
float startValue = 0.005;
float rMin = 1;
float rMax = 4;
float rPlus = 0.001;
float zoome = 1;
float zoomeOffset = 100;
void setup() {
  size(1000, 1000, P3D);
  
  /*for (float i = rMin; i < rMax; i += rPlus) {
    logist(startValue, i);
    counter = 0;
  }*/
 
  
}

void draw() {
  if(zoome <=2.2){
  background(204);
    rMin=rMin>=2?rMin+0.01:rMin;
    rMax= rMax<3?rMax-0.01:rMax;;
    zoome+=0.02;
    zoomeOffset+=2;
  for (float i = rMin; i < rMax; i += rPlus) {
      logist(startValue, i);
      counter = 0;
    }
  }
}

void logist(float p, float r) {
  if (counter < max) {
    float pnew = p+(r*p)*(1-p);
    counter++;
    logist(pnew, r);
  } else if (counter < secondMax) {
    float pnew = p+(r*p)*(1-p);
    beginShape(POINTS);
    vertex(r*300*zoome-500-zoomeOffset*zoome, pnew*500*zoome-(zoomeOffset-100)*zoome);
    endShape();
    counter++;
    logist(pnew, r);
  }
}