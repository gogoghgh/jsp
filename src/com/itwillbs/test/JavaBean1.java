package com.itwillbs.test;

public class JavaBean1 {
	
	private String id;
	private String name;
	private String addr;

	// 게터세터
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	//toString
	@Override
	public String toString() {
		return "JavaBean1 [id=" + id + ", name=" + name + ", addr=" + addr + "]";
	}
}
