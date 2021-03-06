private int gridSize = 8;
private int paintSize = 640;
private PVector[][] gradientArr = new PVector[ceil(paintSize/gridSize)+1][ceil(paintSize/gridSize)+1];
private float customColor = 0;

void setup() {
  size(760, 760, P3D);
  float customColor;
  for (int i = 0; i <= paintSize; i+=gridSize) {
    for (int j = 0; j <= paintSize; j+=gridSize) {
      gradientArr[floor(i/gridSize)][floor(j/gridSize)] = gradiantVector(i, j);
    }
  }
 for(int i = 0; i < paintSize; i++){
    for(int j = 0; j < paintSize; j++){
      customColor = noise2d(i,j)*255;
      stroke(customColor);
      point(i,j);
    }
  }
}
void draw() {
}

private float noise2d(int xU, int yU) {
  float x = (float)xU%gridSize/100;
  float y = (float)yU%gridSize/100;
  float size = (float)gridSize/100-0.001;
  PVector gradiantOL = gradientArr[xU/gridSize][yU/gridSize];
  PVector gradiantUL = gradientArr[(xU/gridSize)][((yU+gridSize)/gridSize)];
  PVector gradiantOR = gradientArr[((xU+gridSize)/gridSize)][(yU/gridSize)];
  PVector gradiantUR = gradientArr[((xU+gridSize)/gridSize)][((yU+gridSize)/gridSize)];
   
  float vOL = sqrt(x*x+(y-1)*(y-1));//0,1
  float vOR = sqrt((x-size)*(x-size)+(y-size)*(y-size));//1,1
  float vUL = sqrt(x*x+y*y);//0,0
  float vUR = sqrt((x-size)*(x-size)+y*y);//1,0
 // println("vOL:"+vOL+"  vOR:"+vOR+"    vUL:"+vUL+"    vUR:"+vUR);

  float oRDot = vUL*gradiantOR.x+vUL*gradiantOR.y;
  float uRDot = vOL*gradiantUR.x+vOL*gradiantUR.y;
  float oLDot = vUR*gradiantOL.x+vUR*gradiantOL.y;
  float uLDot = vOR*gradiantUL.x+vOR*gradiantUL.y;
  
  /*float ix0;
  float ix1;
  ix0 = lerp(uLDot,uRDot,xU%gridSize/100);
  ix1 = lerp(oLDot,oRDot,xU%gridSize/100);
  
  return lerp(ix0,ix1,yU%gridSize/100);*/
  return (oRDot+uRDot+oLDot+uLDot)/4;
}

private PVector gradiantVector(int startX, int startY) {
  //ist eigentlich egal muss einfach random und zwischen 1 und -1 sein
  float newX = (float)startX%gridSize/100;
  float newY = (float)startY%gridSize/100;
  float size = gridSize/100;
  float x = random(newX-size, newX+size)-newX;
  float y = random(newY-size, newY+size)-newY;
  return new PVector(x,y);
}