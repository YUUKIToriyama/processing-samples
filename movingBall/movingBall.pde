/* movingBall.pde */

public class Ball {
  PVector position;
  PVector velocity;
  float radius;
  color ballColor;

  Ball(PVector _position, PVector _velocity, float _radius, color _ballColor) {
    position = _position;
    velocity = _velocity;
    radius = _radius;
    ballColor = _ballColor;
  }

  public void move() {
    position = PVector.add(position, velocity);

    // ボールの跳ね返りを計算
    if (position.x > width || 0 > position.x) {
      velocity.x = velocity.x * (-1);
      changeColor();
    }
    if (position.y > height || 0 > position.y) {
      velocity.y = velocity.y * (-1);
      changeColor();
    }
  }

  public void draw() {
    fill(ballColor);
    ellipse(position.x, position.y, radius, radius);
  }

  private void changeColor() {
    ballColor = color(random(255), random(255), random(255));
  }
}

Ball myBall = new Ball(new PVector(0,0), new PVector(10, 20), 10, color(100,0,0));

void setup() {
	size(500, 500);
	background(255);
	noStroke();

	// 1秒間に10回描画
	frameRate(30);
}

void draw() {
	fadeToWhite();
  myBall.move();
  myBall.draw();
}

void fadeToWhite() {
	fill(255, 30);
	rect(0, 0, width, height);
}
