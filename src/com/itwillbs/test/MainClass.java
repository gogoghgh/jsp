package com.itwillbs.test;

public class MainClass {
	// 학생 점수의 총합, 평균 출력
	//	public int sum = kScore + eScore+ mScore;
	//	public double avg = sum / 3.0;

	// => 위의 동작(이름, 총합, 평균)을 동일하게 수행하는 메서드 만들기
	public void show(String name, int kScore, int eScore, int mScore){
		System.out.println("이름: " + name);
		System.out.println("sum: " + (kScore + eScore + mScore));
		System.out.println("avg: " + (kScore + eScore + mScore) / 3.0);
	}
	
	// static으로 메서드 하나 더,,
	public static void show2(String name, int kScore, int eScore, int mScore){
		System.out.println("이름: " + name);
		System.out.println("sum: " + (kScore + eScore + mScore));
		System.out.println("avg: " + (kScore + eScore + mScore) / 3.0);
	}
	
	// 메서드 오버로딩.,,,,,, 매개변수 타입이 다르거나 조건이 다르면, 다른 걸로 본다~
	// 이름은 같지만,,,, 달라 달라
	public static void show2(Student s){
		System.out.println("이름: " + s.getName());
		System.out.println("sum: " + (s.getkScore() + s.geteScore() + s.getmScore()));
		System.out.println("avg: " + (s.getkScore() + s.geteScore() + s.getmScore()) / 3.0);
	}
	
	// 메인 메서드
	public static void main(String[] args) {
		// 학생 이름, 국, 영, 수 점수
		String name = "가현스";
		int kScore = 100;
		int eScore = 90;
		int mScore = 95;
		
		MainClass mc = new MainClass();
		mc.show(name, kScore, eScore, mScore);
		
		// static 메서드 써보기
		MainClass.show2(name, kScore, eScore, mScore);
		
		Student s1 = new Student();
		s1.setName("유가현");
		s1.setkScore(100);
		s1.seteScore(100);
		s1.setmScore(100);
//		s1.show(s1.getName(), s1.getkScore(), s1.geteScore(), s1.getmScore());
		MainClass.show2(s1);

		System.out.println("toString: " + s1);
		
		// 계산기 만들어서 그 안에 총점, 평균 계산할 수 있게
		Calculator c = new Calculator(); 
		c.sum(kScore, eScore, mScore);
		c.avg(kScore, eScore, mScore);
		System.out.println("c.sum(s1): " + c.sum(s1));
		System.out.println("c.avg(s1): " + c.avg(s1));
		
	} // main 메서드
	
} // MainClass
