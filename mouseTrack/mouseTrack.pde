/* mouseTrack.pde */

public class Circle {
	PVector position;
	float radius;
	color fillColor;

	Circle(PVector _position, float _radius) {
		position = _position;
		radius = _radius;
		fillColor = getRandomColor();
	}

	public void draw() {
		// マウスの座標を取得する
		PVector positionMouse = new PVector(mouseX, mouseY);
		// Circleの中心からマウスの座標への方向ベクトル
		PVector velocity = PVector.sub(positionMouse, position);
		if (velocity.mag() > 0) {
			velocity = PVector.div(velocity, velocity.mag());
		}
		// Circleをマウスの方にすこし近づける
		position = PVector.add(position, velocity);
		// 描画
		fill(fillColor);
		ellipse(position.x, position.y, radius, radius);
	}

	private color getRandomColor() {
		color c = color(int(random(255)), int(random(255)), int(random(255)));
		return c;
	}
}

// num個のCircleを生成する
int num = 10;
Circle[] circles = new Circle[num];

void setup() {
	size(500, 500);
	for (int i = 0; i < num; i++) {
		circles[i] = new Circle(new PVector(random(width), random(height)), (10 - random(5)) * 10);
	}
	noStroke();
}

void draw() {
	//background(255);
	fade();
	for (int i = 0; i < num; i++) {
		circles[i].draw();
	}
}

void mouseClicked() {
	// マウスをクリックすると画面が初期化される
	setup();
}

void fade() {
	fill(255, 10);
	rect(0, 0, width, height);
}
