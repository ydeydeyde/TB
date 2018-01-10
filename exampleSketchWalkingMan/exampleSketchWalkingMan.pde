import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Movie movie;
OpenCV opencv;

ledStrip [] leds;
ArrayList<circle> circles = new ArrayList<circle>();
PImage base, comp;
int prevX, prevY;
int counter = 0;

PImage overlay;
PGraphics pg;
int r;
int col;
int inc;

void setup() {
  size(1280, 700, P3D);
  colorMode(HSB, 100);
  background(0, 0, 50);
  frameRate(20);
  noCursor();
  base = loadImage("data/base.jpg");
  comp = loadImage("data/comp.jpg");
  leds = new ledStrip[16];
  loadLedStripData();
  movie = new Movie(this, "out50.mov");
  opencv = new OpenCV(this, 1280, 700);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  pg = createGraphics(width, height, P3D);
  movie.loop();
  r = 0;
  col = 0;
  inc = 1;
}

void draw() {
  image(base, 0, 50, base.width, base.height);
  pg.beginDraw();
  pg.background(255);
  pg.pushMatrix();
  pg.translate(mouseX, mouseY);
  pg.rotate(radians(r));
  pg.image(movie, -86, - 47, 172, 94);
  pg.popMatrix();
  pg.endDraw();
  //Update OpenCV object with latest from camera
  opencv.loadImage(pg);
  opencv.updateBackground();

  opencv.dilate();
  opencv.erode();

  for (ledStrip l : leds) l.update();

  col += inc;
  if (col >= 55 || col <= 0) inc *= -1;

  //int h = int(millis() / 100) % 100;
  //println(h);
  //int v = 50 + ((int((millis() / 5))) % 50);
  color c = color(col + 40, 100, 100);
  fill(c);
  noStroke();

  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
  translate(0, height / 2);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

//void mouseMoved() {
//  int h = int(millis() / 250) % 100;
//  int v = 50 + ((int((millis() / 5))) % 50);
//  color c = color(h, 100, v);
//  noStroke();
//  fill(c);
//  ellipse(mouseX, mouseY + height / 2, 50, 50);
//}

void loadLedStripData() {
  leds[0] = new ledStrip(99, 206, 92);
  leds[1] = new ledStrip(242, 235, 24);
  leds[2] = new ledStrip(275, 235, 120);
  leds[3] = new ledStrip(333, 222, 182);
  leds[4] = new ledStrip(486, 250, 29);
  leds[5] = new ledStrip(523, 138, 91);
  leds[6] = new ledStrip(580, 194, 183);
  leds[7] = new ledStrip(606, 221, 92);
  leds[8] = new ledStrip(524, 264, 104);
  leds[9] = new ledStrip(863, 137, 93);
  leds[10] = new ledStrip(772, 153, 121);
  leds[11] = new ledStrip(982, 165, 31);
  leds[12] = new ledStrip(836, 222, 152);
  leds[13] = new ledStrip(772, 277, 97);
  leds[14] = new ledStrip(1019, 247, 77);
  leds[15] = new ledStrip(1128, 193, 122);
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed() {
  if (key == 'a' || key == 'A') r += 30;
  else r -= 30;
}