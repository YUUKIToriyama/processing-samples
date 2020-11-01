// マウスの座標 
PVector p1 = new PVector(0, 0);
// ロケットの座標
PVector p2 = new PVector(400, 400);
// 飛行速度
PVector v = new PVector(0, 0);

PImage img;

void setup() {
	size(600, 600);
	img = loadImage("rocket.png");
	imageMode(CENTER);
}

void draw() {
	background(255);
	fill(0, 0, 255);

	// マウスの座標をプロット
	p2.x = mouseX;
	p2.y = mouseY;
	ellipse(p2.x, p2.y, 30, 30);

	// マウスに向かってロケットの速度ベクトルを定義する
	v = PVector.sub(p2, p1);
	
	if (v.mag() > 0) {
		v = PVector.div(v, v.mag());
		p1 = PVector.add(p1, v);
	}

	// 機体の傾きを計算する
	float angle = v.heading() + PI / 2;

	drawRocket(p1.x, p1.y, angle);
}

void drawRocket(float x, float y, float angle) {
	pushMatrix();
	translate(x, y); // 原点をキャラクタ座標まで移動
	rotate(angle);
	image(img, 0, 0);
	popMatrix();
}
