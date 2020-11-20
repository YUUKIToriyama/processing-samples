/* 対数螺旋 */

float a = 0.01;
float b = 0.5;

void setup(){
  background(255);
  size(500,500);
  noStroke();
  frameRate(60);
  println(1.0 / 100);
}

void draw(){
  fill(255,255,255,0.5);
  rect(0,0,width,height);
  fill(0);
  //ellipse(50,50,10,10);
  PVector p = new PVector(
    a * exp(b * (50 - frameCount / 100)) * cos(50 - float(frameCount) / 100) + width / 2,
    a * exp(b * (50 - frameCount / 100)) * sin(50 - float(frameCount) / 100) + height / 2
  );
  ellipse(p.x, p.y, 5, 5);
}
