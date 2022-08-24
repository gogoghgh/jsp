package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost:8088/JSP6/busan.com

public class ItwillServlet extends HttpServlet {
	// STEP2. HttpServlet 상속받은 순간부터, 나는 클래스 -> 서블릿이 된 거예요^^
	
	// STEP3. doGet(), doPost() 메서드 오버라이딩
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자가 get방식으로 호출할 때 실행되는 메서드
		response.getWriter().append("GH BUSAN ");
		response.getWriter().append("GH BUSAN ").append(request.getContextPath());
		// 왜 get방식이지? 폼태그에 method post 이 때 빼고는! 다~ get방식,, 
		// post방식으로 하면 안 보일거임^^
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사용자가 post방식으로 호출할 때 실행되는 메서드
	
	}
	
}
