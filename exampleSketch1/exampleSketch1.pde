ledStrip [] leds;
ArrayList<circle> circles = new ArrayList<circle>();
PImage img;
int prevX, prevY;
int counter = 0;

void setup() {
  size(1280, 700);
  colorMode(HSB, 100);
  background(0);
  img = loadImage("data/layoutBaseCropped.jpg");
  leds = new ledStrip[14];
  loadLedStripData();
}

void draw() {
  noStroke();
  for (int i = 0; i < circles.size(); i++) {
    circle c = circles.get(i);
    c.update();
    if (c.r > height / 2) {
      circles.remove(i);
    }
  }
  image(img, 0, 50, img.width, img.height);
  for (ledStrip l : leds) l.update();
  strokeWeight(50);
  stroke(0);
  noFill();
  rect(0, height / 2 + 15, width, height / 2);

  fill(100, 100, 100);
  noStroke();
  ellipse(260, 192, 10, 10);
  ellipse(647, 147, 10, 10);
  ellipse(905, 267, 10, 10);
  ellipse(1151, 245, 10, 10);
}

void mouseMoved() {
  if (dist(260, 192, mouseX, mouseY) < 30 ||
    dist(647, 147, mouseX, mouseY) < 30 ||
    dist(905, 267, mouseX, mouseY) < 30 ||
    dist(1151, 245, mouseX, mouseY) < 30) {
    int h = int(millis() / 250) % 100;
    int s = 50 + ((int((millis() / 5))) % 50);
    //  println("hue: " + h + " sat: " + s); 
    color c = color(h, 100, s);
    circles.add(new circle(mouseX, height / 2 + mouseY, c));
  }
}
void mousePressed() {
  println(mouseX + " , " + mouseY);
}

void loadLedStripData() {
  leds[0] = new ledStrip(167, 360, 101);
  leds[1] = new ledStrip(257, 337, 75);
  leds[2] = new ledStrip(388, 349, 125);
  leds[3] = new ledStrip(368, 373, 105);
  leds[4] = new ledStrip(511, 273, 92);
  leds[5] = new ledStrip(600, 275, 82);
  leds[6] = new ledStrip(732, 287, 74);
  leds[7] = new ledStrip(766, 312, 166);
  leds[8] = new ledStrip(704, 324, 186);
  leds[9] = new ledStrip(964, 398, 152);
  leds[10] = new ledStrip(1016, 421, 152);
  leds[11] = new ledStrip(924, 436, 151);
  leds[12] = new ledStrip(1145, 437, 122);
  leds[13] = new ledStrip(1272, 373, 82);
}