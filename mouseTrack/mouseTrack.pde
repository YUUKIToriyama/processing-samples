/* mouseTrack.pde */

// 点1
PVector p1 = new PVector(0, 0);
// 点2
PVector p2 = new PVector(400, 400);
// 点1用の速度ベクトル
PVector v1 = new PVector(0, 0);

void setup() {
	size(600, 600);
}

void draw() {
	background(255);
	// マウスの座標に点2を配置
	p2.x = mouseX;
	p2.y = mouseY;

	fill(0, 0, 255);
	ellipse(p2.x, p2.y, 30, 30);
	// 点1から点2への方向ベクトルをv1に格納
	v1 = PVector.sub(p2, p1);
	// 正規化
  if (v1.mag() > 0) {
    v1 = PVector.div(v1, v1.mag());

  }

  // 点1を移動
  p1 = PVector.add(p1, v1);
	fill(0, 255, 0);
	ellipse(p1.x, p1.y, 30, 30);
}
