import java.lang.Math;
import java.util.Arrays;

private int iterations = 100;
private int iterationCounter = 0;
//private color currentColor;
private float c = -0.75;
private int screenSize = 1000;
void setup() {
  size(1000, 1000);
  for (float x = -3; x < 3; x+=0.006) {
    for (float y = -3; y < 3; y+=0.006) {
      stroke(mandel(x,y));
      point(map(x,-3,3,0,1000),map(y,-3,3,0,1000));
    }
  }
}

private color mandel(float initialX, float initialY) {
 // currentColor = color(255, 255, 255);
   color adsfk = mandelRecursive(initialX, initialY);
  return adsfk;
}
private color mandelRecursive(float previousValueX, float previousValueY) {
  float newX =previousValueX*previousValueX+c-(previousValueY*previousValueY);
  float newY =previousValueX*previousValueY*2;
  if (iterationCounter <= iterations) {
    iterationCounter++;    
    mandelRecursive(newX,newY);
  }
  iterationCounter = 0;
  //println(newX+newY+c);
  //println(newX+newY-c);
 // print((newX+newY+c)+" __");
  color cO = Math.abs(-1*(newX*newX+-newY*newY)+c)<1.5 && newX*newY*2< Math.abs(0.866)?color(map(-1*(newX*newX+-newY*newY)+c,-1.5,1.5,0,255),0,0):color(255,0,0);
  return cO;
}

void draw() {
}