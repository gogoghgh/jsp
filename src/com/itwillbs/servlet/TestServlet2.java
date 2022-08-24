package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// http://localhost:8088/JSP6/test2.com

public class TestServlet2 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("(from. doGET) doGET 호출됨");
		// get방식 호출됐을 때, 강제로 doPost 호출해서 얘도 자동으로 실행되도록!!
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("(from. doPOST) doPOST 호출됨");
		
		// request영역에 정보 저장
		request.setAttribute("cnt", 1000);
//		request.setAttribute("cnt", new Integer(1000)); 같은 말~,, 오토박싱 -> 업캐스팅ㅋ 하ㅏ하
		
		// session영역에도 정보 저장
		HttpSession session = request.getSession(); // 뭐 모르겠으면 request한테 가서 물어보삼,, ㅋ 
								// 이렇게 하면,, session 내장객체랑 같은 게 만들어 진 것이다~
		session.setAttribute("cnt", 2000);
		
		// doPost 호출 시, servlet/Attribute.jsp로 페이지 이동 (forward 이용)
		RequestDispatcher dis = request.getRequestDispatcher("servlet/Attribute.jsp");
		dis.forward(request, response);
		System.out.println("(from. doPOST) Attribute.jsp로 페이지 이동 완");
	}
	
}
