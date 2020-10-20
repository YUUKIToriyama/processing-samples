/* motion.pde */

PVector p = new PVector(0, 0);
PVector v = new PVector(5, 0);
float g = 9.8;

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  frameRate(10);
}

void draw() {
  fadeToWhite(40);

  v.y = v.y + g / 2;
  p = PVector.add(p, v);

  fill(100, 100, 0);
  ellipse(p.x, p.y, 10, 10);

  if (width < p.x || p.x < 0) {
    v.x = v.x * (-1);
  }
  if (height < p.y || p.y < 0) {
    v.y = v.y * (-1);
  }
}

void fadeToWhite(int opacity) {
  fill(255, opacity);
  rect(0, 0, width, height);
}
