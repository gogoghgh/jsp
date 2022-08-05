package com.itwillbs.test;

public class Calculator {
	// 내가 한거
	public void sum(int kScore, int eScore, int mScore) {
		int sum = kScore + eScore + mScore;
		System.out.println("sum: " + sum);
	}

	public void avg(int kScore, int eScore, int mScore) {
		double avg = (kScore + eScore + mScore) / 3.0;
		System.out.println("avg: " + avg);
	}

	// 샘이 한거.. 메서드 오버로딩 이용
	public int sum(Student s) {
		return s.getkScore() + s.geteScore() + s.getmScore();
//		return sum(int kScore, int eScore, int mScore) / 3;
	}

	public double avg(Student s) {
//		return (s.getkScore() + s.geteScore() + s.getmScore()) / 3.0;
		return sum(s)/3.0; 
			// sum() 호출해서 나누기 3
	}
}
