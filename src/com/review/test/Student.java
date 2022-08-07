package com.review.test;

public class Student {
	private String name;
	private int kScore;
	private int eScore;
	private int mScore;

	// showInfo 메서드
	public void showInfo() {
		System.out.println("-----showInfo(Student class)-----");
		System.out.println("name: " + name);
		System.out.println("sum: " + (kScore + eScore + mScore));
		System.out.println("avg: " + (kScore + eScore + mScore)/3.0);
	}

	// toString 재정의
	@Override
	public String toString() {
		return "Student [name=" + name + ", kScore=" + kScore + ", eScore=" + eScore + ", mScore=" + mScore + "]";
	}

	// 게터세터
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getkScore() {
		return kScore;
	}

	public void setkScore(int kScore) {
		this.kScore = kScore;
	}

	public int geteScore() {
		return eScore;
	}

	public void seteScore(int eScore) {
		this.eScore = eScore;
	}

	public int getmScore() {
		return mScore;
	}

	public void setmScore(int mScore) {
		this.mScore = mScore;
	}

}
