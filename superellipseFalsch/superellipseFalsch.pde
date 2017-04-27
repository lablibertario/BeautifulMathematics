private int counter = 0;

void setup() {
  size(760, 760);
  drawSuperEllipse(100, counter, 200,200, 2);
}

void drawCircle(int radius, int winkel, int x, int y) {
  for(int i = 0; i <1080; i++){
    point(x+radius*cos(i),y+radius*sin(i));
  }
}

void drawSuperEllipse(int radius, int winkel, int x, int y, float n) {
  for(int i = 0; i <1080; i++){
    point(x+radius*pow(cos(i),2/n),y+radius*pow(sin(i),2/n));
    point(x+radius*pow(cos(i),2/n),y+radius*pow(sin(i),2/-n));
    point(x+radius*pow(cos(i),2/-n),y+radius*pow(sin(i),2/n));
    point(x+radius*pow(cos(i),2/-n),y+radius*pow(sin(i),2/-n));
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