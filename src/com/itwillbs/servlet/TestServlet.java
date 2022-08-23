package com.itwillbs.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/itwill.com")
public class TestServlet extends HttpServlet { 
							// 2번 규칙
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
    	// 생성자가 super 호출 ,, = 부모(HttpServlet) 생성자 호출 
    	// 생성자 목적: 객체 초기화!!!
    	// 부모 생성자 호출 -> 부모 객체 생김 -> 
    	// 상속 전제 조건: 상속할 부모가 존재하고 있어야 한다,,!! 아 그래서~ 생성자가 꼭 있는거군
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("GH BUSAN ").append(request.getContextPath());
		// 응답 정보. 출력하는 객체. 데이터 뒤에 추가. 추가 ;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
