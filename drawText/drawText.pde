PFont f;
String str = "Hello";
int num = 100;

void setup() {
	size(500, 500);
	surface.setResizable(true);
	background(255);

	f = createFont("Noto Sans Italic", 70, true);
	textAlign(CENTER);
}

void draw() {
	fadeToWhite();

	for (int i = 0; i < num; i++) {
		PVector v = new PVector(width / 2, height /2);
		PVector p = new PVector(sin(2 * PI * frameCount / 100), cos(2 * PI * frameCount / 100));
		p = PVector.add(PVector.mult(p, width /3), v);
		fill(150, 150, random(150, 255));
		textFont(f);
		text(str, p.x, p.y);
	}
}

void fadeToWhite() {
	fill(255, 30);
	rect(0, 0, width, height);
}
