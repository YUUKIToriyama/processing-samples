void setup() {
  size(500, 500);
  background(255);
  colorMode(RGB, 256);
  noStroke();
  frameRate(10);
}

void draw() {
  fadeToWhite();
  PVector p = new PVector(random(width), random(height));
  int r = int(random(300));

  fill(randomRGBColor());
  ellipse(p.x, p.y, r, r);
}

color randomRGBColor() {
  color myColor = color(random(256), random(256), random(256));
  return myColor;
}

void fadeToWhite() {
  fill(255, 10);
  rect(0, 0, width, height);
}
