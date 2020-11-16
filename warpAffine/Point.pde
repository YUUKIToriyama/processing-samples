/* Point.pde */

class Point {
	float x;
	float y;
	PMat v;

	Point(float _x, float _y) {
		x = _x;
		y = _y;
		v = new PMat(new float[][] {
			{_x},
			{_y},
			{ 1}
		});
	}

	Point translate(float _x, float _y) {
		PMat affine = new PMat(new float[][] {
			{1, 0, _x},
			{0, 1, _y},
			{0, 0, 1}
		});
		return calculate(affine, v);
	}

	Point rotate(float _theta) {
		float radian = _theta * PI / 180;
		PMat affine = new PMat(new float[][] {
			{cos(radian), -sin(radian), 0},
			{sin(radian), cos(radian), 0},
			{0, 0, 1}
		});
		return calculate(affine, v);
	}

	Point scale(float _a, float _b) {
		PMat affine = new PMat(new float[][] {
			{_a, 0, 0},
			{ 0, _b, 0},
			{ 0, 0, 1}
		});
		return calculate(affine, v);
	}

	private Point calculate(PMat _affine, PMat _v) {
		PMat product = _affine.product(_v);
		float[][] vec = product.matrix;
		return new Point(vec[0][0], vec[1][0]);
	}
}
