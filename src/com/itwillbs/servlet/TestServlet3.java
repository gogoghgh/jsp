package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("/test3"): web.xml에서 구구절절 매핑했던 거 이 한 줄로 가능
@WebServlet("/test3")
// http://localhost:8088/JSP6/test3

public class TestServlet3 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("(from. TestServlet3) doGET() 호출");
		
		// request 영역에 number = 100 값 Arrays.jsp로 전달
		request.setAttribute("number", 100);
		
		// request 영역에 배열 정보를 전달
		String[] menu = {"김밥", "칸다소바..존맛", "마파두부", "라면", "로제떡볶이", "순두부찌개" };
		request.setAttribute("menu", menu);
		
		ArrayList<String> movies = new ArrayList<>();
		movies.add("디지몬");
		movies.add("놉");
		movies.add("헌터");
		movies.add("어벤져스");
		request.setAttribute("movies", movies);
		
		
		// 페이지 이동
		RequestDispatcher dis = request.getRequestDispatcher("servlet/Arrays.jsp");
		dis.forward(request, response);
		System.out.println("(from. TestServlet3) Arrays.jsp로 페이지 이동 완");
		
		
	}
}
