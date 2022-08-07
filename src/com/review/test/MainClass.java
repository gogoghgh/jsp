package com.review.test;

public class MainClass {
	public static void showInfo(Student s){
		System.out.println("-----showInfo(MainClass class)-----");
		System.out.println("name: " + s.getName());
		System.out.println("sum: " + (s.getkScore() + s.geteScore() + s.getmScore()));
		System.out.println("avg: " + (s.getkScore() + s.geteScore() + s.getmScore())/3.0);
	}
	
	
	public static void main(String[] args) {
		Student s = new Student();
		s.setName("가횬");
		s.seteScore(99);
		s.setkScore(97);
		s.setmScore(100);
		
		// 메서드 오버로딩,,
		showInfo(s); // static 메서드라서 객체 생성 안 해도 쓸 수 있지요
		s.showInfo();
		System.out.println();
		
		// toString 잘 나오나~~
		System.out.println(s);
		System.out.println(s.toString());
		System.out.println();
		
		// Calculator class 써서 계산해보기
		Calculator c = new Calculator();
		System.out.println("c.sum: " + c.sum(s));
		System.out.println("c.avg: " + c.avg(s));
		
	}// main

}// MainClass
