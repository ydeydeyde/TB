import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Movie movie;
OpenCV opencv;

PImage overlay;
PGraphics pg;
int r;

void setup() {
  size(1280, 700, P3D);
  colorMode(HSB, 100);
  frameRate(20);
  movie = new Movie(this, "out.mov");
  opencv = new OpenCV(this, 2560, 700);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  pg = createGraphics(width * 2, height, P3D);
  movie.loop();
  pg.beginDraw();
  pg.background(0, 0, 100);
  pg.endDraw();
  r = 0;
}

void draw() {
  fill(0);
  rect(0, 0, width, height / 2);
  pg.beginDraw();
  pg.background(255);
  pg.pushMatrix();
  pg.translate(mouseX * 2, mouseY);
  pg.rotate(radians(r));
  pg.image(movie, - 172, - 99, 344, 188);
  pg.popMatrix();
  pg.endDraw();
  //Update OpenCV object with latest from camera
  opencv.loadImage(pg);
  opencv.updateBackground();

  opencv.dilate();
  opencv.erode();

  int h = int(millis() / 250) % 100;
  int v = 50 + ((int((millis() / 5))) % 50);
  color c = color(h, 100, v);
  fill(c);
  noStroke();
  scale(0.5, 0.5);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
  translate(0, height);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}
void movieEvent(Movie m) {
  m.read();
}
void captureEvent(Capture c) {
  c.read();
}

void keyPressed(){
  if(key == 'a' || key == 'A') r += 15;
  else r -= 15;
}