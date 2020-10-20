/* movingBall.pde */

int r = 10;
PVector p = new PVector(0, 0);
PVector v = new PVector(random(10), random(10));
color ballColor = color(random(255), random(255), random(255));

void setup() {
  size(500, 500);
  background(255);
  noStroke();

  // 1秒間に10回描画
  frameRate(30);
}

void draw() {
  fadeToWhite();

  p = PVector.add(p, v);
  fill(ballColor);
  ellipse(p.x, p.y, r, r);

  if (p.x > width || 0 > p.x) {
    v.x = v.x * (-1);
    ballColor = color(random(255), random(255), random(255));
  }
  if (p.y > height || 0 > p.y) {
    v.y = v.y * (-1);
    ballColor = color(random(255), random(255), random(255));
  }
}

void fadeToWhite() {
  fill(255, 30);
  rect(0, 0, width, height);
}
