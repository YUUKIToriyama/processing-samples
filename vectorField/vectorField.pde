/* vectorField.pde */

// ベクトル場の定義
// 時計回りに渦巻きながら座標中心に落ちてゆく力が働いているとする
PVector velocity(PVector position) {
	PVector v = new PVector(
		position.x * (-0.1) + position.y * (-1), 
		position.x + position.y * (-0.1)
	);
	return v.div(v.mag());
}

// 動点Pを定義
// 点Pの位置ベクトルと、その軌跡を描画する色の情報を格納
class Point {
	PVector position;
	color fillColor;

	Point(PVector _position) {
		position = _position;
		fillColor = color(random(255), random(255), random(255));
	}
}

// 可変リストに動点Pを保存
ArrayList<Point> points = new ArrayList<Point>();


void setup() {
	size(500, 500);
	background(255);
	frameRate(200);
	noStroke();
	// 投下地点をランダムに選び、ベクトル場にPを投下
	points.add(new Point(new PVector(random(width) - width / 2, random(height) - height / 2)));
}

void draw() {
	// コードをすっきりさせるため、原点を画面の中心に持ってくる
	translate(width / 2, height / 2);
	for (int i = 0; i < points.size(); i++) {
		Point p = points.get(i);
		fill(p.fillColor);
		// ベクトル場から力を受けて点Pは移動する
		p.position = p.position.add(velocity(p.position));
		ellipse(p.position.x, p.position.y, 1, 1);
	}
}

// 好きな点でマウスをクリックすると、新たに動点をベクトル場に追加することが出来る
void mousePressed() {
	points.add(new Point(new PVector(mouseX - width / 2, mouseY - height / 2)));
}
