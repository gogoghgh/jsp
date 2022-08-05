package com.itwillbs.test;

public class MainClass2 {

	public static void main(String[] args) {
		Student kim = new Student();
		kim.setName("수달스");
		kim.setkScore(50);
		kim.seteScore(100);
		kim.setmScore(30);

		Calculator c = new Calculator();
		System.out.println(kim.getName() + "의 sum: " + c.sum(kim));
		System.out.println(kim.getName() + "의 avg: " + c.avg(kim));
	}

}
