/* matrix calculation */

class PMat {
	float[][] matrix;
	int row;
	int col;

	PMat(float[][] _matrix) throws Exception{
		row = _matrix.length;
		col = _matrix[0].length;
		for (int i = 1; i < row; i++) {
			if (_matrix[i].length != col) {
				throw new Exception("row1 has " + row + " elements, but row" + (i + 1) + " has " + _matrix[i].length + " elements.");
			}
		}
		matrix = _matrix;
	}

	PMat add(PMat m) throw Exeption {
		if (row != m.row || col != m.col) {
			throw new Exception("cannot define add() between the two matrix");
		}

		float[][] dst;
		for (int i = 0; i < row; i++) {
			FloatList[] v = new FloatList();
			for (int n = 0; n < col; n++) {
				v.append(matrix[i][n] + m[i][n]);
			}
			dst[i] = v.array();
		}
		return new PMat(dst);
	}
}
