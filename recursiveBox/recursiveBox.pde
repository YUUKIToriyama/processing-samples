float f;
int m;
PVector[] polygon;

void setup() {
  size(512, 512);
  background(255);
  stroke(0);
  fill(0);
  text("Click to Update!", 10, 10);
  m = int(random(3, 10));
  f = random(0, 1);
  polygon = new PVector[m];
  for (int i = 0; i < m; i++) {
    polygon[i] = new PVector((width/2)*(1 + sin(2*PI*i/m)), (height/2)*(1 + cos(2*PI*i/m)) );
  }
}

void draw() {
  polygon = transformRect(polygon);
  stroke(random(255), random(255), random(255));
  for (int i = 0; i < m; i++) {
    line(polygon[i].x, polygon[i].y, polygon[(i+1)%m].x, polygon[(i+1)%m].y);
  }
}

void mousePressed() {
  setup();
}

PVector[] transformRect(PVector[] vertices) {
  PVector[] points = new PVector[m];
  for (int i = 0; i < m; i++) {
    PVector a = vertices[i];
    PVector b = vertices[(i + 1) % m];
    points[i] = PVector.add(PVector.mult(a, 1 - f), PVector.mult(b, f));
  }
  return points;
}