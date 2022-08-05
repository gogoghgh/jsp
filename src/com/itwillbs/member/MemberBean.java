package com.itwillbs.member;

import java.sql.Timestamp;

public class MemberBean {
	// member 정보를 저장하는 객체
	// ㄴ (DB-테이블!!) 
	// 자바빈 목적: DB 테이블에 정보 저장하려고 근데!! 더 쉽게 들고가기 위해 ㅎㅎ
	
	// 변수 만들기
	// 테이블에 있는 컬럼 그대로~~ 
	// so 테이블을 잘 만들어야 함~!!!!!!! 그래야 자바빈을 잘 만들 수 있겠죵
	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String email;
	private Timestamp regdate; // int 아니고^^ java.sql 밑에 있음
	
	// get() set()
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	//toString
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", pw=" + pw + ", name=" + name + ", age=" + age + ", gender=" + gender
				+ ", email=" + email + ", regdate=" + regdate + "]";
	}
	
	// 이렇게 3개 하면,, 자바빈 완성~!!!!!!!
	// memberBean ㅇㅇㅇBean 보면?
	// : member 객체 저장하기 위한 거구나~~~~ 이렇게 아시오
	// = DTO(Data Transfer Object) 데이터 전송 객체
	// 빈 역할: 데이터 보내기 위한 객체에 불과,,, 하니까!! 같은 말 맞네~
}
