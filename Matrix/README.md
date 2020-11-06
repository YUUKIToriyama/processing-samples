# Matrix.pde
クラス`PMat`の使い方  
## 行列オブジェクトの作成
```processing
PMat a = new PMat(new float[][] {
	{2, 4, 6},
	{1, 6, 9},
	{3, 8, 2}
});
PMat b = new PMat(new float[][] {
	{1, 0, 0},
	{0, 1, 0},
	{0, 0, 1}
});
```

## 行列をコンソールに出力する
```processing
a.display();
//[
//	[2 4 6]
//	[1 6 9]
//	[3 8 2]
//]
```

## 積を計算する
```processing
// a*b
a.product(b);
```

## 和を計算する
```processing
// a+b
a.add(b);
```
