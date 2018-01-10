import processing.video.*; 
Capture cam; 

void setup() { 
  size(1280, 700); 
  cam = new Capture(this, "name=USB2.0 Camera,size=640x480,fps=30");
  cam.start();
} 

void draw() { 
  if (cam.available()) { 
    cam.read();
  } 
  image(cam, 0, 0);
} 