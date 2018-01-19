import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture cam;
OpenCV opencv;

void setup() {
  size(1280, 700, P3D);
  colorMode(HSB, 100);
  cam = new Capture(this, "  name=FaceTime HD Camera (Built-in),size=1280x720,fps=30");
  cam.start();
  opencv = new OpenCV(this, 1280, 700);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
}

void draw() {
  if (cam.available()) { 
    cam.read();
    opencv.loadImage(cam);
    opencv.updateBackground();
    opencv.dilate();
    opencv.erode();
    int h = int(millis() / 250) % 100;
    int v = 50 + ((int((millis() / 5))) % 50);
    color c = color(h, 100, v);
    fill(c);
    noStroke();
    for (Contour contour : opencv.findContours()) {
      contour.draw();
    }
  }
}
void movieEvent(Movie m) {
  m.read();
}
void captureEvent(Capture c) {
  c.read();
}