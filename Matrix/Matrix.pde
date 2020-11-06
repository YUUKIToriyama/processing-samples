/* matrix calculation */
import java.lang.*;

static class PMat {
	float[][] matrix;
	int row;
	int col;

	PMat(float[][] _matrix) throws IllegalArgumentException {
		row = _matrix.length;
		col = _matrix[0].length;
		// ジャグ配列が与えられたときエラーを返す
		for (int r = 1; r < row; r++) {
			if (_matrix[r].length != col) {
				throw new IllegalArgumentException("【引数が誤っています】各行の要素の個数が一致しません");
			}
		}
		matrix = _matrix;
	}

	// 加法
	public PMat add(PMat m) throws IllegalArgumentException {
		// 行の数、列の数が一致していない場合エラーを返す
		if (row != m.row || col != m.col) {
			throw new IllegalArgumentException("【定義エラー】行列の型が異なるため行列の和を定義できません");
		}

		float[][] dst = new float[row][col];
		for (int r = 0; r < row; r++) {
			for (int c = 0; c < col; c++) {
				dst[r][c] = matrix[r][c] + m.matrix[r][c];
			}
		}

		return new PMat(dst);
	}

	// 減法
	public PMat sub(PMat m) throws IllegalArgumentException {
		// 行の数、列の数が一致していない場合エラーを返す
		if (row != m.row || col != m.col) {
			throw new IllegalArgumentException("【定義エラー】行列の型が異なるため行列の差を定義できません");
		}

		float[][] dst = new float[row][col];
		for (int r = 0; r < row; r++) {
			for (int c = 0; c < col; c++) {
				dst[r][c] = matrix[r][c] - m.matrix[r][c];
			}
		}

		return new PMat(dst);
	}

	// スカラー倍
	public PMat mult(float a) {
		float[][] dst = new float[row][col];
		for (int r = 0; r < row; r++) {
			for (int c = 0; c < col; c++) {
				dst[r][c] = a * matrix[r][c];
			}
		}

		return new PMat(dst);
	}

	// 積
	public PMat product(PMat m) throws IllegalArgumentException {
		// Aの列の数とBの行の数が一致したときのみ積は定義できる
		// それ以外の場合エラーを返す
		if (col != m.row) {
			throw new IllegalArgumentException("【定義エラー】行列の積が定義できません");
		}

		float [][] dst = new float[row][m.col];
		for (int r = 0; r < row; r++) {
			for (int c = 0; c < m.col; c++) {
				float sum = 0;
				for (int k = 0; k < col; k++) {
					sum = sum + matrix[r][k] * m.matrix[k][c];
				}
				dst[r][c] = sum;
			}
		}

		return new PMat(dst);
	}

	// 転置
	public PMat transpose() {
		float[][] dst = new float[col][row];
		for (int r = 0; r < row; r++) {
			for (int c = 0; c < col; c++) {
				dst[c][r] = matrix[r][c];
			}
		}

		return new PMat(dst);
	}

	// 行列をコンソールに表示
	public void display() {
		println("[");
		for (int r = 0; r < row; r++) {
			print("\t[");
			for (int c = 0; c < col; c++) {
				print(matrix[r][c] + " ");
			}
			print("]\n");
		}
		println("]");
	}

	public static void credit() {
		println("(C)Copyright 2020 YUUKIToriyama All Rights Reserved.");
	}
}


void setup() {
	PMat a = new PMat(new float[][] {
		{1, 3, 1}, 
		{2, 4, 2}, 
		{3, 0, 9}
	});
	PMat b = new PMat(new float[][] {
		{1, 2}, 
		{0, 3}, 
		{2, 8}
	});
	PMat c = a.product(b);
	c.display();
	PMat.credit();
}

void draw() {
}
