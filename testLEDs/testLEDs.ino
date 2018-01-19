#include <Adafruit_NeoPixel.h>
#define NUMPIX_1 180
#define PIN_1 9
Adafruit_NeoPixel strip1 = Adafruit_NeoPixel(NUMPIX_1, PIN_1, NEO_GRB + NEO_KHZ800);
//#define NUMPIX_2 60
//#define PIN_2 8
//Adafruit_NeoPixel strip2 = Adafruit_NeoPixel(NUMPIX_2, PIN_2, NEO_GRB + NEO_KHZ800);
//#define NUMPIX_3 58
//#define PIN_3 12
//Adafruit_NeoPixel strip3 = Adafruit_NeoPixel(NUMPIX_3, PIN_3, NEO_GRB + NEO_KHZ800);

int pix1, pix2, pix3;
int inc1, inc2, inc3;
int counter;

void setup() {
  Serial.begin(9600);
  strip1.begin();
  strip1.show();
  //  strip2.begin();
  //  strip2.show();
  //  strip3.begin();
  //  strip3.show();
  inc1 = 1;
  inc2 = 1;
  inc3 = 1;
}

void loop() {
  counter++;
  if (counter == 10) {
    counter = 0;
    pix1 += inc1;
    if (pix1 == NUMPIX_1 || pix1 == 0) inc1 *= -1;
    //    pix2 += inc2;
    //    if (pix2 == NUMPIX_2 || pix2 == 0) inc2 *= -1;
    //    pix3 += inc3;
    //    if (pix3 == NUMPIX_3 || pix3 == 0) inc3 *= -1;

    // strip1.setPixelColor(pix - 1, strip1.Color(50, 0, 120)); // bright green color.
    strip1.setPixelColor(pix1, strip1.Color(80 - millis() / 100 % 79, 0, millis() / 100 % 250)); // bright green color.
    // strip1.setPixelColor(pix + 1, strip1.Color(120, 0, 255)); // bright green color.
    strip1.show(); // This sends the updated pixel color to the hardware.
    //  strip2.setPixelColor(pix2, strip2.Color(75, 0,  millis() / 150 % 255)); // bright green color.
    //  strip2.show(); // This sends the updated pixel color to the hardware.
    //  strip3.setPixelColor(pix3, strip3.Color(75, 0,  millis() / 200 % 255)); // bright green color.
    //  strip3.show(); // This sends the updated pixel color to the hardware.
  }
}
