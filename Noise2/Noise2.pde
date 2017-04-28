private int gridSize = 32;
private int paintSize = 640;
private PVector[][] gradientArr = new PVector[ceil(paintSize/gridSize)+1][ceil(paintSize/gridSize)+1];
private float customColor = 0;

void setup() {  
  float bigest = 0;
  float ksdlf;
  float mapping = gridSize*gridSize;
  size(760, 760, P3D);
  for (int i = 0; i <= paintSize; i+=gridSize) {
    for (int j = 0; j <= paintSize; j+=gridSize) {
      gradientArr[floor(i/gridSize)][floor(j/gridSize)] = gradiantVector(i, j);
    }
  }
  for (int i = 0; i < paintSize; i++) {
    for (int j = 0; j < paintSize; j++) {
      //das mappen muss noch gemacht werden gradiant werte scheinen zu gross zu sein
      customColor = (noise2d(i, j)+mapping)/(mapping*2)*255;
      stroke(customColor);
      point(i, j);
    }
  }
}
void draw() {
}

private float noise2d(int xU, int yU) {
  int x = xU/(int)gridSize;
  int y = yU/(int)gridSize;
  float x2 = (float)xU;
  float y2 = (float)yU;

  PVector gradiantOL = gradientArr[floor(x2/gridSize)][floor(y2/gridSize)];
  PVector gradiantUL = gradientArr[floor(x2/gridSize)][floor((y2+gridSize)/gridSize)];
  PVector gradiantOR = gradientArr[floor((x2+gridSize)/gridSize)][floor(y2/gridSize)];
  PVector gradiantUR = gradientArr[floor((x2+gridSize)/gridSize)][floor((y2+gridSize)/gridSize)];
  //print(floor(x2/gridSize)+" "+floor(y2/gridSize)+"...."+floor((x2+gridSize)/gridSize)+" "+floor((y2+gridSize)/gridSize)+":: ");

  PVector oLVector = new PVector(xU-x*gridSize, yU-y*gridSize);
  PVector uLVector = new PVector(xU-x*gridSize, yU-(y*gridSize+gridSize));
  PVector oRVector = new PVector(xU-(x*gridSize+gridSize), yU-y*gridSize);
  PVector uRVector = new PVector(xU-(x*gridSize+gridSize), yU-(y*gridSize+gridSize));


  float oRDot = oRVector.dot(gradiantOR);
  float uRDot = uRVector.dot(gradiantUR);
  float oLDot = oLVector.dot(gradiantOL);
  float uLDot = uLVector.dot(gradiantUL);
  //print(gradiantOL.x+" "+gradiantOR.x+" "+gradiantUL.x+" "+gradiantUR.x+"::");
  return (oRDot+uRDot+oLDot+uLDot)/4;
}

private PVector gradiantVector(int startX, int startY) {
  return new PVector(random(startX-gridSize, startX+gridSize)-startX, random(startY-gridSize, startY+gridSize)-startY);
}