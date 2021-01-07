float f;
PVector[] arr = new PVector[4];

void setup() {
	size(512, 512);
	background(255);
	stroke(0);
	f = random(0, 1);
	arr[0] = new PVector(0, 0);
	arr[1] = new PVector(width, 0);
	arr[2] = new PVector(width, height);
	arr[3] = new PVector(0, height);
}

void draw() {
	arr = transformRect(arr);
	stroke(random(255), random(255), random(255));
	for (int i = 0; i < 4; i++) {
		line(arr[i].x, arr[i].y, arr[(i+1)%4].x, arr[(i+1)%4].y);
	}
}

void mousePressed() {
	setup();
}

PVector[] transformRect(PVector[] vertices) {
	PVector[] points = new PVector[4];
	for (int i = 0; i < 4; i++) {
		PVector a = vertices[i];
		PVector b = vertices[(i + 1) % 4];
		points[i] = PVector.add(PVector.mult(a, 1 - f), PVector.mult(b, f));
	}
	return points;
}
