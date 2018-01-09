PImage img;
int px, py;
int clickCounter = 0;
int arrayCounter = 0;

void setup() {
  size(1280, 700);
  img = loadImage("data/comp.jpg");
  image(img,0,50);
}

void draw() {
}

void mouseReleased() {
  if (clickCounter % 2 == 1) {
    println("leds[" + arrayCounter + "] = new ledStrip(" + px + " , " + mouseY + " , " + (mouseX - px) + ");");
    arrayCounter++;
  }
  clickCounter++;
  px = mouseX;
  py = mouseY;
}