private int gridSize = 160;
private int paintSize = 640;
private PVector[][] gradientArr = new PVector[ceil(paintSize/gridSize)+1][ceil(paintSize/gridSize)+1];
private float customColor = 0;

void setup() {
  float ksdlf;
  float mapping = gridSize*gridSize;
  float lowest = 100;
  size(760, 760, P3D);
  for (int i = 0; i <= paintSize; i+=gridSize) {
    for (int j = 0; j <= paintSize; j+=gridSize) {
      gradientArr[floor(i/gridSize)][floor(j/gridSize)] = gradiantVector(i, j);
    }
  }
 //println(customColor = (noise2d(159, 1)+mapping)/(mapping*2)*255);
 //println(customColor = (noise2d(161, 1)+mapping)/(mapping*2)*255);
  for (int i = 0; i < paintSize; i++) {
    for (int j = 0; j < paintSize; j++) {
      //das mappen muss noch gemacht werden gradiant werte scheinen zu gross zu sein
      customColor = (noise2d(i, j)+mapping)/(mapping*2)*255;
      stroke(customColor);
      point(i, j);
      lowest = lowest < customColor?lowest:customColor;
    //  println(customColor);
    }
  }
}
void draw() {
}

private float noise2d(int xU, int yU) {
  int x = xU/gridSize;
  int y = yU/gridSize;
  float x2 = (float)xU;
  float y2 = (float)yU;

  PVector gradiantOL = gradientArr[xU/gridSize][yU/gridSize];
  PVector gradiantUL = gradientArr[(xU/gridSize)][((yU+gridSize)/gridSize)];
  PVector gradiantOR = gradientArr[((xU+gridSize)/gridSize)][(yU/gridSize)];
  PVector gradiantUR = gradientArr[((xU+gridSize)/gridSize)][((yU+gridSize)/gridSize)];
  //print(floor(x2/gridSize)+" "+floor(y2/gridSize)+"...."+floor((x2+gridSize)/gridSize)+" "+floor((y2+gridSize)/gridSize)+":: ");

  PVector oLVector = new PVector(xU-x*gridSize, yU-y*gridSize);
  PVector uLVector = new PVector(xU-x*gridSize, yU-(y*gridSize+gridSize));
  PVector oRVector = new PVector(xU-(x*gridSize+gridSize), yU-y*gridSize);
  PVector uRVector = new PVector(xU-(x*gridSize+gridSize), yU-(y*gridSize+gridSize));


  float oRDot = oRVector.dot(gradiantOR)/100;
  float uRDot = uRVector.dot(gradiantUR)/100;
  float oLDot = oLVector.dot(gradiantOL)/100;
  float uLDot = uLVector.dot(gradiantUL)/100;
  //print(floor(oRDot)+":"+floor(uRDot)+":"+floor(oLDot)+":"+floor(uLDot)+"::");
  //print(gradiantOL.x+" "+gradiantOR.x+" "+gradiantUL.x+" "+gradiantUR.x+"::");
 /* println("xU yU:"+ xU+" "+yU+" ...gOL:"+gradiantOL+" ...gUL"+gradiantUL+" ...gOR"+gradiantOR+" ...gUR"+gradiantUR);
  println("xU yU:"+ xU+" "+yU+" ...OL:"+oLVector+" ...UL"+uLVector+" ...OR"+oRVector+" ...UR"+uRVector);
  println("or:"+oRDot+" ur:"+uRDot+" ol:"+oLDot+" ul"+uLDot);*/

  float bla = 3*(xU - xU/gridSize*gridSize)^2-2*(xU-xU/gridSize*gridSize)^3;
  float bla2 = uLDot + bla*(uRDot - uLDot);
  float bla3 = oLDot + bla*(oRDot - oLDot);
  return (bla2+bla3)/2;
}

private PVector gradiantVector(int startX, int startY) {
  float x = random(startX-gridSize, startX+gridSize)-startX;
  float y = random(startY-gridSize, startY+gridSize)-startY;
  return new PVector(x,y);
}