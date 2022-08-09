package com.itwillbs.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	// DAO (Data Access Object) :  정보 처리 객체
	// => DB에 관한 모~~든 정보를 처리하는 객체
	//  = DB에 관한 정보 처리하려면,, DB 연결하려면,,,, 얘를 써야만 한다!!
				// cf.  MemberBean = MemberDTO (Data Transfer Object) DB정보 전송하는!! 객체였죠
	
	// 성능 좀 좋게 해보자~!!
	// 공통으로 사용되는 객체를 선언
	Connection con = null;   // DB 연결 정보를 저장, 처리하는 놈
	PreparedStatement pstmt = null; // SQL 쿼리 실행, 처리하는 놈
	ResultSet rs = null; // select 구문 결과 저장하는 놈
	String sql =""; // sql 쿼리 저장하는 놈
	
	
	// DB 연결 메서드 만들기 getCon() 시작
	private Connection getCon() throws Exception{ 
								//앞에 뭐라뭐라는 지우고 젤 대가리인 Exception으로 바꾸기
								// 날 호출한 니가 모든 오류 처리해~~~~^^
		// DB 연결 정보
		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";
		
		//1. 드라이버 로드
		Class.forName(DRIVER);  
			// 오류,, throws~~ exception,, 얘를 호출하는 애한테! 예외처리 하도록
		System.out.println("드라이버 로드 성공");
		
		//2. DB 연결
		con = DriverManager.getConnection(DBURL, DBID, DBPW); 
		System.out.println("DB 연결 성공");
		System.out.println("con: " + con);
		
		return con;
		
	}// DB 연결 메서드 getCon() 끝
	
	
	
	// 회원 가입 동작 수행 .... insertMember() 메서드로 만들기
	// 실행하기 위해선, 회원 정보가 필요함,, 없으면? 정보 받아야 함,,,,,, MemberBean이 필요하겠군
	public void insertMember(MemberBean mb){
	// 외부에서도 쓸 거니까 public --- return 타입은 개발자 맘~
//		String DRIVER = "com.mysql.cj.jdbc.Driver";
//		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
//		String DBID = "root";
//		String DBPW = "1234";
		
		//1. 드라이버 로드
		try {
/*			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("드라이버 로드 성공");
			
			// 2. DB 연결
			Connection con = 
					DriverManager.getConnection(DBURL, DBID, DBPW); 
						// 오류 뜨네,,, add catch clause ~~~ 눌러 catch 구문만 추가
			System.out.println("DB 연결 성공");*/
			
			// 1. 2.  한번에! DB 연결
			con = getCon(); //예외 처리 해주고~
			
			// 3. sql 작성 & sql 실행하는 pstmt 객체 생성
			String sql = "insert into " 
						+ "itwill_member(id, pw, name, age, gender, email, regdate) "
						+ "values(?,?,?,?,?,?,?)";
							// 줄바꿈할 때 공백 주의!!
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// + 물음표 처리
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setInt(4, mb.getAge());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getEmail());
			pstmt.setTimestamp(7, mb.getRegdate());
			
			// 4. sql 실행
			pstmt.executeUpdate(); // insert니까,,
			
			System.out.println("my name is DAO: 회원 가입 성공^^ ㅊㅋㅊㅋ");
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}// 1. 드라이버 로드 예외 처리  
			// Class.forName(DRIVER);
								// Unhandled exception type ClassNotFoundException
								// 클래스가 혹시나 없을 상황에 대비를 안 해놨다,,, ㅡㅡ? 장난?
								// -> surround with try/catch 눌러서 고치기
		catch (SQLException e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}// 2. DB 연결 예외 처리
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}// 회원가입 - insertMember() 끝
	
	
	
	
	// 로그인 여부 체크 - loginMember() 시작
	public int loginMember(MemberBean mb){
		// 리턴값 = 1: 로그인 완 / 0: 비번 오류 / -1: 아이디 오류
		int result = -1; // -1,, 에러의 의미기도 합니다
		
/*		String DRIVER = "com.mysql.cj.jdbc.Driver";
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";*/
		
		try {
/*			//1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("드라이버 로드 성공");
			
			//2. DB 연결
			Connection con = 
					DriverManager.getConnection(DBURL, DBID, DBPW); 
			System.out.println("DB 연결 성공");*/
			
			//1. 2. 한번에 DB 연결 (getCon 실행 -> con 변수에 저장)
			con = getCon();
			
			//3. sql 작성 & sql 실행하는 객체 pstmt 생성
			String sql = "select pw from itwill_member where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			//   + 물음표 처리
			pstmt.setString(1, mb.getId());
			
			// 4. sql 쿼리 실행 + rs 객체에 그 select해서 가져온 정보 저장
			ResultSet rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()){
					// where 조건절에 적힌 아이디가,, select해서 가져온 rs에 있음!! = 회원임
					if(mb.getPw().equals(rs.getString("pw"))){
						/* pw컬럼에 들어있는 String 값을 가져와서, mb.getPw랑 같은가 비교 */
						// 아이디 같고, 비번도 같다
						// = 로그인 성공
						result = 1;
						System.out.println("1: 로그인 성공");
						// return 1; 아~~ 이렇게 말고 샘처럼 변수에 넣으면 됐겠네~  
						// session.set~~ 못 쓰죠 jsp 코드니까,,,
					} else {
						// 아이디 같고, 비번은 다르다
						// return 0;
						result = 0;
						System.out.println("0: 비번 틀림");
					}// if-else(pw)
					
			} else {
				// 아이디 없다,,, 아이디 오류
				// return -1;
				result = -1;
				System.out.println("-1: 아이디 틀림");
				
			}// if-else(id)
			
			System.out.println("로그인 체크 완료: " + result);
			
		} catch (ClassNotFoundException e) {
			System.out.println("1단계. 드라이버 로드 실패");
			e.printStackTrace();
 		} catch (SQLException e) {
			System.out.println("2단계. DB 연결 실패");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// return 0; 일단,, 오류 막으려고 암거나(0) 집어넣음,,
		return result;
	} // 로그인 여부 체크 loginMember() 끝
	
}// MemberDAO class 
