/* warpAffine.pde */

Point[] vertex = new Point[3];

void setup() {
	size(500,500);
	background(255);
	fill(0, 255, 0);

	vertex[0] = new Point(100, 40);
	vertex[1] = new Point(50, 20);
	vertex[2] = new Point(60, 80);
}

void draw() {
	triangle(
		vertex[0].x, vertex[0].y,
		vertex[1].x, vertex[1].y,
		vertex[2].x, vertex[2].y
	);
}

void mousePressed() {
	fill(0, random(255), 0);
	for (int i = 0; i < 3; i++) {
		vertex[i] = vertex[i].scale(2, 2);
	}

	triangle(
		vertex[0].x, vertex[0].y,
		vertex[1].x, vertex[1].y,
		vertex[2].x, vertex[2].y
	);
}
