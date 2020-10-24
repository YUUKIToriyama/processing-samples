/* cardioid.pde */

void setup() {
  background(255);
  size(500, 500);
  noStroke();
  frameRate(60);
}

void draw() {
  fadeToWhite();

  PVector p = new PVector(cos(frameCount), sin(frameCount));
  PVector q = new PVector(cos(frameCount * 5), sin(frameCount * 5));
  PVector r = new PVector(width / 2, height / 2);
  PVector a = PVector.add(PVector.add(PVector.mult(p, 100), PVector.mult(q, 50)), r);

  fill(100, 0, 0);
  ellipse(a.x, a.y, 10, 10);
}

void fadeToWhite() {
  fill(255, 10);
  rect(0, 0, width, height);
}
