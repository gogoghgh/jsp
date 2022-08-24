package com.itwillbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 이 주소로 호출했을 때,  MyServlet을 부른다!!
// http://localhost:8088/JSP6/myservlet

public class MyServlet extends HttpServlet{
	// 1. 상속받기
	// 2. doGet(2), doPost(3) 오버라이딩
	// 3. web.xml에 매핑시키고 오삼
	// 4. init(1), destroy(4) 오버라이딩 (배치까지)
	// 5. 서버 재실행 후 서블릿 run(init 이 때 한번 하고 끝) -> stop(destroy) 
	// 6. 카운트 cnt 추가, 화면에 출력해보기
	// 7. PrintWriter myOut 써서 html 형태로
	
	
	// 카운트 정보
	private int cnt;
	
	
	// (1)
	@Override
	public void init() throws ServletException {
		// 최초의 서블릿이 생성될때 한 번만!! 실행됨
		System.out.println("(from. init) 서블릿 초기화 메서드 - 초기화 완");
		
		cnt = 0;
		System.out.println("(from. init) cnt = 0 초기화 완");
	}

	// (2)
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("(from. doGET) GET 방식 호출 발생!! ");
		
		// 카운트 변수 추가
		cnt++;
		System.out.println("(from. doGET) cnt: " + cnt);
		
		
/*		// 화면에 출력해보기
		response.setContentType("text/html; charset=UTF-8");
								// html 문서 젤 위에 있던 그거~~ 추가하면~ 태그 쓸 수 있네^^
		// => 응답하는 정보의 타입을 html 형태로 해석해라!!!
		// 마임 타입,, 걍 텍스트 덩어리지만, ㅇㅇㅇ타입으로 해석해라~!!
		// 그냥 글자에 불과하지만 -> html 형태로 읽으면 -> html 태그!!! 꺄호~~~ ╰(*°▽°*)╯
		response.getWriter().append("<h3> (from. doGET) cnt: " + cnt +"</h3>");
		
		// 이렇게 쓰면 html 문서처럼 된다!! 올~~
		PrintWriter myOut = response.getWriter();
		// output stream.. writer로 끝났으니까
		// 스트림 = 통로 만드는 거,, response에... 
		// response = 응답 정보!! 내가 보고 있는 이 웹 페이지!!!에 들어온 요청들을 이 페이지에다가 보여준다,,?
		
		myOut.println("<html>");
		myOut.println("<head>");
		myOut.println("</head>");
			myOut.println("<body>");
				myOut.println("<h1> MyServlet.java </h1>");
				myOut.println("<h3> (from. doGET) cnt: " + cnt +"</h3>");
			myOut.println("</body>");
		myOut.println("</html>");
		
		myOut.close(); // 입출력이 자바에서 가장 많은 리소스를 쓰기 때문에,, 
						// 우리는 지금 출력 중,, 자바를 통해 브라우저에 출력하는 중,,,,
						// 자바가 브라우저랑 통신하고 있는 중,, 
						// 내 영역인 콘솔창에 결과 내는 거랑 --- 저~멀리에 결과 내는 거랑,,
						//  메모리 소스 차지                 <<<
						//   -> 성능 떨어질 수밖에 없음~~ 그니까 쓰고 나서 닫아주는 것임^^,,,
		*/
		
		// 여기서 하기 넘 빡시니까 testServlet.jsp 페이지로 이동해서 하겠삼^^
		// 페이지 이동 방법(a태그 / js href.. / jsp sendRedirect.. OOO / jsp 액션태그 )
		//    response 객체가 있으니까,, sendRedirect()로 이동 고고싱
		// response.sendRedirect("servlet/testServlet.jsp"); // 경로 적어주기,,^^ 안그럼 404 에러남
		// 근데 ㄴ 이것도 별로네~~
		
		// forward 방식!!!!으로 찐으로 페이지 이동
		// RequestDispatcher dis = request.getRequestDispatcher("이동할 주소");
		// dis.forward(ServletRequest arg0, ServletResponse arg1);
/*		RequestDispatcher dis = request.getRequestDispatcher("servlet/testServlet.jsp");
		dis.forward(request, response);*/
		
		// cnt 변수 출력해보기,, 파라미터로 보내기
//		RequestDispatcher dis = request.getRequestDispatcher("servlet/testServlet.jsp?cnt="+ cnt);
		
		// 하지만 찐 정답은~~ 영역 객체 이용하는 것,,ㅋ
		request.setAttribute("cnt", cnt);
		
		RequestDispatcher dis = request.getRequestDispatcher("servlet/testServlet.jsp");
		dis.forward(request, response);
	}

	// (3)
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("(from. doPOST) POST 방식 호출 발생!! ");
	}

	// (4)
	@Override
	public void destroy() {
		// 서블릿 소멸 시 호출
		System.out.println("(from. destroy) 서블릿 소멸,,, ㅂ2");
	}
	
}
