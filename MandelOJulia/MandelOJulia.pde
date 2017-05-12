import java.lang.Math;

//(x+iy)(x+iy) = x*x - y*y + 2*i*x*y
//z = z1+i*z2 => x+i*y
//c = c1+i*c2

//z*z = (x+i*y)(x+i*y)
void setup() {
  size(1000, 1000);
  for (int x = 0; x < 500; x++) {
    for (int y = 0; y < 500; y++) {
      point(x,y);
    }
  }
}

void draw() {
}