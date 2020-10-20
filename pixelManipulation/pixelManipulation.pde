/* pixelManipulation.pde */

PImage image;

void setup() {
  image = loadImage("sample.jpg");
  image.loadPixels();
  size(500, 500);
  size(image.width, image.height);
  background(255);
  noStroke();
}

void draw() {
  loadPixels();

  int x = int(random(image.width));
  int y = int(random(image.height));
  int p = x + y * image.height;
  color c = image.pixels[p];

  int r = int(random(30));
  fill(c);
  ellipse(x, y, r, r);
}
