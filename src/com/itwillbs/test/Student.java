package com.itwillbs.test;

public class Student { 
	// Student class는? 학생 정보를 한방에 다 들고 다닐 수 있는 필통쓰
	
	// 학생 정보를 저장
	private String name;
	private int kScore;
	private int eScore;
	private int mScore;
	
	// 생성자
//	public Student(String name, int kScore, int eScore, int mScore) {
//		super();
//		this.name = name;
//		this.kScore = kScore;
//		this.eScore = eScore;
//		this.mScore = mScore;
//	}

	// alt  shift  s  + s
	// toString Override
	@Override
	public String toString() {
		return "Student [name=" + name + ", kScore=" + kScore + ", eScore=" + eScore + ", mScore=" + mScore + "]";
	}
		// 얘 왜 쓰나? 뭐 있나 알고싶은데
		// 얘 없으면,, getName~~ getKScore~~` 다 불러야 함,, 매우 귀찮 
		// toString 하는걸 권해드립니다~~ 아예~

	// alt  shift  s  + r
	// 게터 세터 메서드
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
