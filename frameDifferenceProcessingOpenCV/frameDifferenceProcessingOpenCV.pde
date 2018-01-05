import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

PImage overlay;

void setup() {
  size(640, 480);
  colorMode(HSB, 100);
  frameRate(20);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  overlay = loadImage("overlay.png");
  video.start();
}

void draw() {
  //Update OpenCV object with latest from camera
  opencv.loadImage(video);
  opencv.updateBackground();

  opencv.dilate();
  opencv.erode();

  int h = int(millis() / 100) % 100;
  color c = color(h, 100, 100);
  fill(c);
  noStroke();
  translate(width, 0);
  scale(-2, 2);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }

  scale(0.5,0.5);
  image(overlay, 0,0);
}

void captureEvent(Capture c) {
  c.read();
}