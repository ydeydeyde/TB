float x = 0;
float inc = 3;
void setup() {
  size(640, 190);
  colorMode(HSB, 100);
  background(0);
}

void draw() {
  x += inc;
  if (x < 0 || x > width) inc *= -1;

  strokeWeight(5);
  for (int i = 0; i < width; i+= 5) {
    float d =  40 + (width - abs(i - x)) / 10;
    //println("i: " + i + " : "  + d);
    float h =  50;
    stroke(h, 75, d);
    line(i, 0, i, height);
  }
}