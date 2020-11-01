public class Rocket {
	PVector position;
	PVector velocity;
	PImage img;

	Rocket(PVector _position, PVector _velocity) {
		position = _position;
		velocity = _velocity;

		// 画像を読み出す
		img = loadImage("rocket.png");
		imageMode(CENTER);
	}

	public void display() {
		PVector target = new PVector(mouseX, mouseY);
		// マウスに向かってロケットの速度ベクトルを定義する
		velocity = PVector.sub(target, position);

		if (velocity.mag() > 0) {
			velocity = PVector.div(velocity, velocity.mag());
			position = PVector.add(position, velocity);
		}

		// 機体の傾きを計算する
		float angle = velocity.heading() + PI / 2;

		// 画像を描画
		drawImage(position, angle);
	}

	private void drawImage(PVector position, float angle) {
		pushMatrix();
		translate(position.x, position.y);
		rotate(angle);
		image(img, 0, 0);
		popMatrix();
	}
}

int n = 10;
Rocket[] rockets = new Rocket[n];

void setup() {
	size(600, 600);
	surface.setResizable(true);

	for (int i = 0; i < n; i++) {
		rockets[i] = new Rocket(new PVector(random(width), random(height)), PVector.random2D());
	}
}

void draw() {
	background(255);
	fill(0, 0, 255);
	ellipse(mouseX, mouseY, 30, 30);
	for (int i = 0; i < n; i++) {
		rockets[i].display();
	}
}

void mousePressed() {
	setup();
}
