PVector p = new PVector(); //キャラクターの座標
PVector v = new PVector(); //キャラクターの速度
PVector a = new PVector(); //キャラクターの加速度
float k = 0.8; //反発係数
float r = 20; //ボールの半径

void setup() {
  size(800, 600); 
  p = new PVector(0, 0);
  v = new PVector(5, 5);
  a = new PVector(0, - 0.05);
}

void draw() {
  background(255);
  fill(255, 0, 0);

  v = PVector.add(v, a); //速度の更新
  p = PVector.add(p, v); //位置の更新
  ellipse(p.x, height - p.y, r, r); //y座標を通常の座標系に直してボールを描画

  //床との跳ね返り
  if (p.y < r / 2) {
    v.y = (- 1) * v.y;
    p.y = r / 2;
  }
  //壁との跳ね返り
  if (p.x > width || p.x < 0) {
    v.x = v.x * (-1);
  }
  //砲台
  line(0, height, mouseX, mouseY);
}

//マウスをクリックしたとき
void mousePressed() {
  //弾を発射しなおし
  p = new PVector(0, 0);
  v = new PVector(mouseX / 100, (height - mouseY) / 100);
}
