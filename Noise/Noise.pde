import java.util.*;
private int gS = 20;
private int fS = 320;
private PVector[][] vecArr = new PVector[gS][gS];
private  Set setA = new HashSet();

void setup() {
  size(780, 760, P3D);
  for(int i = 0; i < gS; i++){
    if(i%2==0){
      for(int j = 0; j<gS;j++){
        if(j%2==0){
          vecArr[i][j] = gradiantVector(i,j);
        }else{
          vecArr[i][j] = gradiantVector(i,j+gS);
        }
      }
    }else{
      for(int j = 0; j<gS;j++){
        if(j%2==0){
          vecArr[i][j] = gradiantVector(i+gS,j);
        }else{
          vecArr[i][j] = gradiantVector(i+gS,j+gS);
        }
      } 
    }
  }
  for(int i = 0; i < fS; i++){
    for(int j = 0; j<fS;j++){
     float k = perlin(i,j);
     stroke(k,k,k);
     point(i,j);
    }
  }
}
void draw(){
}
public float perlin(final int xU,final int yU){
   int x = xU%gS;
   int y = yU%gS;
   
   /*PVector gradiantOL = gradiantVector(x*gS,y*gS);
   PVector gradiantUL = gradiantVector(x*gS,y*gS+gS);
   PVector gradiantOR = gradiantVector(x*gS+gS,y*gS);
   PVector gradiantUR = gradiantVector(x*gS+gS,y*gS+gS);*/
   //obenlinks obenrechts obenlinks obenrechts
   //untenlinks untenrechts untenlinks untenrechts
   //muss mit modulo arbeiten
   PVector gradiantOL = vecArr[x%2==0?x:x-1][y%2==0?y:(y-1)];
   PVector gradiantUL = vecArr[x%2==0?x:x-1][y%2==0?y+1:(y)];//gradiantVector(x*gS,y*gS+gS);
   PVector gradiantOR = vecArr[x%2==0?x+1:x][y%2==0?y:(y-1)];//gradiantVector(x*gS+gS,y*gS);
   PVector gradiantUR = vecArr[x%2==0?x+1:x][y%2==0?y+1:(y)];//gradiantVector(x*gS+gS,y*gS+gS);
   
   PVector oLVector = new PVector(xU-x*gS,yU-y*gS);
   PVector uLVector = new PVector(xU-x*gS,yU-(y*gS+gS));
   PVector oRVector = new PVector(xU-(x*gS+gS),yU-y*gS);
   PVector uRVector = new PVector(xU-(x*gS+gS),yU-(y*gS+gS));
   
   
   float oRDot = oRVector.dot(gradiantOR);
   float uRDot = uRVector.dot(gradiantUR);
   float oLDot = oLVector.dot(gradiantOL);
   float uLDot = uLVector.dot(gradiantUL);
   return (oRDot+uRDot+oLDot+uLDot)/4;
}

public PVector gradiantVector(int startX,int startY){
  return new PVector(random(startX-gS,startX+gS)-startX,random(startY-gS,startY+gS)-startY);
}