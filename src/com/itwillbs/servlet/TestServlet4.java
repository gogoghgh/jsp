package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test4") // test4 주소 호출했을 때 이 서블릿이 보일 것이다~~
// http://localhost:8088/JSP6/test4
public class TestServlet4 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Phone 객체 생성
		Phone samsung = new Phone();
		samsung.setModel("폴드4");
		samsung.setColor("black");
		samsung.setPrice(200);
		
		// 사람 정보 생성
		Person kim = new Person();
		kim.setName("김학생");
		kim.setAge(20);
		kim.setPhone(samsung);
		
		// 이 사람의 정보를 Beans.jsp 페이지로 정보 전달 -> 출력하기
		request.setAttribute("kim", kim);
		
		// 페이지 이동 (forward)
		RequestDispatcher dis = request.getRequestDispatcher("servlet/Beans.jsp");
		dis.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
