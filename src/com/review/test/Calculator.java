package com.review.test;

public class Calculator {
	
	public int sum(Student s){
		return s.getkScore() + s.geteScore() + s.getmScore();
	}
	
	public double avg(Student s){
//		return this.sum(s) / 3; 
		return this.sum(s) / 3.0; 
		// 정수 나누기 정수는 정수니까,, 3.0으로 해야 나머지까지 나옴~
	}
	
}
