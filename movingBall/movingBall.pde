/* movingBall.pde */

Ball[] balls = new Ball[20];

void setup() {
	size(500, 500);
	background(255);
	noStroke();

	// 1秒間に10回描画
	frameRate(30);

  // ボールの作成
  for (int i = 0; i < 20; i++) {
    balls[i] = new Ball(new PVector(0,0), new PVector(random(30), random(30)), 10, color(100,0,0));
  }
}

void draw() {
	fadeToWhite();
  for (int i = 0; i < 20; i++) {
    // それぞれのボールを動かし、
    balls[i].move();
    // それぞれ描画する
    balls[i].draw();
  }
}

void fadeToWhite() {
	fill(255, 30);
	rect(0, 0, width, height);
}
