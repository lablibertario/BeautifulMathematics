import java.lang.Math;
import java.util.Arrays;

private int iterations = 100;
private int iterationCounter = 0;
//private color currentColor;
private float c = -0.75;
private int screenSize = 1000;
private float saveX = 0;
private float saveY = 0;

void setup() {
  size(1000, 1000);
  for (float x = 0; x < 1000; x++) {
    for (float y = 0; y < 1000; y++) {
      float a = map(x, 0, 1000, -1.5, 1.5);
      float b = map(y, 0, 1000, -1.5, 1.5);
      float startA = a;
      float startB = b;
      int secondCount = 0;
      for (int i = 0; i<100; i++) {
        secondCount = i;
        float aa = a*a-b*b;
        float bb = a*b*2;
        a = aa+c;
        b = bb;
        if (Math.abs(a+b) > 5) {
          break;
        }
      }
      stroke(color(map(secondCount, 0, 100, 0, 255)));
      //stroke(mandel(map(x,0,1000,-4,4),map(y,0,1000,-4,4)));
      point(x, y);
    }
  }
}

private color mandel(float initialX, float initialY) {
  // currentColor = color(255, 255, 255);
  color adsfk = mandelRecursive(initialX, initialY, initialX, initialY);
  return adsfk;
}
private color mandelRecursive(float previousValueX, float previousValueY, float initialX, float initialY) {
  float newX =previousValueX*previousValueX-(previousValueY*previousValueY);
  float newY =previousValueX*previousValueY*2;
  newX += initialX;
  newY += initialY;
  if (iterationCounter <= iterations) { 
    iterationCounter++; 
    if (Math.abs(newX+newY) > 8) {
      return color(map(iterationCounter, 0, 100, 0, 255));
    } else {
      mandelRecursive(newX, newY, initialX, initialY);
    }
  }
  iterationCounter = 0;
  //println(newX+newY+c);
  //println(newX+newY-c);
  // print((newX+newY+c)+" __");
  //color cO = Math.abs(-1*(newX*newX+-newY*newY)+c)<1.5 && newX*newY*2< Math.abs(0.866)?color(map(-1*(newX*newX+-newY*newY)+c,-1.5,1.5,0,255),0,0):color(255,0,0);
  return color(0, 0, 0);
}

void draw() {
}