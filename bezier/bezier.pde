int count;
PVector[] controlPoints = new PVector[4];
int partSize = 100;

void setup() {
	size(512, 512);
	background(255);
	stroke(0);
	count = 0;
}

void draw() {
	// 四点指定し終わったら曲線を描画
	if (count == 4) {
		for (int m = 0; m < partSize; m++) {
			drawBezier(controlPoints, (0.5 + float(m))/partSize);
		}
	}
}

void drawBezier(PVector[] points, float t) {
	int c = points.length - 1;
	if (c == 0) {
		stroke(255, 0, 0);
		ellipse(points[0].x, points[0].y, 3, 3);
		//println(points);
	} else {
		PVector[] ps = new PVector[c];
		for (int i = 0; i < c; i++) {
			ps[i] = PVector.add(PVector.mult(points[i], 1 - t), PVector.mult(points[i+1], t));
		}
		drawBezier(ps, t);
	}
}

void mousePressed() {
	if (count < 4) {
		controlPoints[count] = new PVector(mouseX, mouseY);
		ellipse(mouseX, mouseY, 10, 10);
		count = count + 1;
	} else {
		// countが4のときリセットする
		setup();
	}
}