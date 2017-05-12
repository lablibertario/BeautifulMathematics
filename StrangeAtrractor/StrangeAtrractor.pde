import java.lang.Math;
import java.util.Arrays;

float a = 0.01;
float b = 1;
ArrayList<PVector> pointArray = new ArrayList();

void setup() {
  size(1000, 1000);
  for (int x = 0; x < 500; x++) {
    for (int y = 0; y < 500; y++) {
     // float x2 =map(1-a*y*y+b*x, 0.01, 2, 0, 1);
     // float y2 =map(y, 0.01, 2, 0, 1);
      pointArray.add(new PVector(x,y));
      point(x,y);
    }
  }
  for(int i = 0; i < 10; i++){
    print(i);
    drawMyMap((ArrayList<PVector>)pointArray.clone(), i);
  }
}

void drawMyMap(ArrayList<PVector> alP, int makeItBig){
  pointArray.clear();
  background(204);
  for(PVector vector : alP){
      //float x2 =map(1-a*vector.y*vector.y+b*vector.x, 0.01, 2, 0, 1);
     // float y2 =map(vector.y, 0.01, 2, 0, 1);
      pointArray.add(new PVector(vector.y,1-a*vector.y*vector.y+b*vector.x));
      point(vector.y+500,1-a*vector.y*vector.y+b*vector.x+800);
  }
}

void draw() {
}