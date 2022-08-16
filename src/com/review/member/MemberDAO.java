package com.review.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	// for 성능,, getCon() 메서드를 위한 빌드업 시작
	// 메서드들에서 공통으로 사용되는 객체 여기다가!! 선언,, iv로~~~
	Connection con = null;			 // DB 연결 정보를 저장, 처리하는 놈
	PreparedStatement pstmt = null;  // SQL 쿼리 실행, 처리하는 놈
	ResultSet rs = null;  			 // select 구문 결과 저장하는 놈
	String sql = "";  				 // sql 쿼리 저장하는 놈
	
	// DB 연결 메서드 getCon() 시작
	private Connection getCon() throws Exception{
		// DB 연결 정보
		String DRIVER = "com.mysql.cj.jdbc.Driver"; 
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("(from DAO.getCon) 드라이버 로드 완");
		
		// 2. DB 연결
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("(from DAO.getCon) DB 연결 완");
		System.out.println("(from DAO.getCon) con: " + con);
		
		return con;
		
	} // DB 연결 메서드 getCon() 끝
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DB 자원 해제 closeDB() 시작
	public void closeDB(){
		try {
			if(rs != null) rs.close(); // rs 기본값 null이었는데,, nn!? 썼네!! 근데 자원 해제 안 했으니 close^^
			if(pstmt != null) pstmt.close(); 
			if(con != null) con.close();
			// 연결은 con -> pstmt -> rs 였으니
			// 종료는 rs  -> pstmt -> con 역순으로!! 이래야,, 좀 더 안정적이겠죠
			System.out.println("(from DAO.closeDB) 자원 해제 완^^ 안녕히 가세요~");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	} // DB 자원 해제 closeDB() 끝
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	//회원 가입 동작 수행 insertMember() 메서드 시작
	public void insertMember(MemberBean mb){
/*		String DRIVER = "com.mysql.cj.jdbc.Driver"; 
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";*/
		
		try {
/*			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("(from DAO.insertMember) 드라이버 로드 완");
			
			// 2. DB 연결
			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("(from DAO.insertMember) DB 연결 완");*/
			
			// 1+2 한방에! getCon() 써서 DB 연결
			con = getCon();
			
			// 3. sql 쿼리 작성 & sql 실행하는 pstmt 객체 생성
			sql = "insert into itwill_member(id, pw, name, age, gender, email, regdate) "
					+ "values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
 			
			// + 물음표 처리
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setInt(4, mb.getAge());
			pstmt.setString(5, mb.getGender());
			pstmt.setString(6, mb.getEmail());
			pstmt.setTimestamp(7, mb.getRegdate());
			
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("(from DAO.insertMember) 회원가입 성공쓰~  id:" + mb.getId());
			
		} /*catch (ClassNotFoundException e) {
			System.out.println("(from DAO.insertMember) 1단계 드라이버 로드 실패,,");
			e.printStackTrace();
			
		} catch (SQLException e) {
			System.out.println("(from DAO.insertMember) 2단계 DB 연결 실패 ㅠ");
			e.printStackTrace();
			
		} */
		  catch (Exception e) {
			System.out.println("(from DAO.insertMember) 1+2단계 getCon()으로 DB 연결 실패 ㅠ");
			e.printStackTrace();
			
		} finally {
			try { // 자원해제 빌드업이었고요,, 다음부턴 걍 closeDB 자원해제 메서드 만들어놨으니 이거 쓰시오^^
				/*
				pstmt.close();
				con.close(); */
				
				// 위에거 업글!!
				if(pstmt != null){ // 작업 쭉~ 다 하고 finally왔는데 pstmt가 nn?? DB 썼네! 근데 자원 해제 안 했네~
					pstmt.close(); // 그니까 닫아줍시다~~ 정보 남아있으면 안 되니까,,
				}
				
				if(con != null){
					con.close();
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}//t-c-finally
		
	}// 회원가입 메서드 insertMember() 끝
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	// 로그인 메서드 loginMember() 시작
	public int loginMember(MemberBean mb){
		// 리턴값=  1: 로그인 성공 / 0: 비번 오류 / -1: 아이디 오류,, (-1이 에러 의미이기도 함)
		int result = -1;
		
/*		String DRIVER = "com.mysql.cj.jdbc.Driver"; 
		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		String DBID = "root";
		String DBPW = "1234";*/
		
		try {
/*			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println("(from DAO.loginMember) 드라이버 로드 완");
			
			// 2. DB 연결
			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("(from DAO.loginMember) DB 연결 완");*/
			
			// 1+2 한번에 DB 연결
			con = getCon();
			
			// 3. sql 쿼리 작성 & sql 실행하는 객체 pstmt 생성 + 물음표 처리
			String sql = "select pw from itwill_member where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			
			// 4. sql 쿼리 실행 + rs에 select 해서 갖고 온 레코드셋 저장
			ResultSet rs = pstmt.executeQuery();
//			System.out.println("(from DAO.loginMember)  rs: " + rs);
			
			// 5. 데이터 처리 
			// select 썼으니 데이터 결과값(레코드셋)이 생기니까 -> 그 데이터 처리해주기!!)
			if(rs.next()){
				if(rs.getString("pw").equals(mb.getPw())){
					// id일치+ pw도 일치 = 로그인 성공
					// session에 로그인 정보 저장 + 공유.. 못하지요 여긴 jsp가 아니니까ㅠ
					result = 1;
					System.out.println("(from DAO.loginMember) 로그인 성공");
					
				} else {
					// id일치 + pw는 불일치
					result = 0;
					System.out.println("(from DAO.loginMember) 비번 틀림");
					
				}// if-else 안에거 끝
			} else {
				// id도 불일치,,
				result = -1;
				System.out.println("(from DAO.loginMember) 아이디 틀림");
				
			}// if-else 밖에거 끝
			
			System.out.println("(from DAO.loginMember) 로그인 체크 완~  result: " + result);
			
			
		} /*catch (ClassNotFoundException e) {
			System.out.println("(from DAO.loginMember) 드라이버 로드 실패ㅠ");
			e.printStackTrace();
			
		} catch (SQLException e) {
			System.out.println("(from DAO.loginMember) DB 연결 실패ㅠ");
			e.printStackTrace();
			
		} */catch (Exception e) {
			System.out.println("(from DAO.loginMember) 1+2단계 getCon()으로 DB 연결 실패ㅠ");
			e.printStackTrace();
			
		} finally {
			closeDB(); // 자원해제 메서드 호출
		}
		
		return result;
		
	} // 로그인 메서드 loginMember() 끝
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	// 회원 정보 조회 메서드 getMemberInfo() 시작
	public MemberBean getMemberInfo(String id){
		// 아이디, 이름, 나이, 이멜,, 이런거 리턴해줘야 하니까 걍 한방에~ MemberBean으로~~~ 리턴해버리자
		// 메서드는 리턴 하나밖에 못 하는데,, 그걸 멤버빈으로 해줘부러~!!! 다 되게 걍
		
		// 횐 정보 저장할 객체,, 젤 껍데기 필통 하나 만들고(lv 안 되게 try-catch-finally 메서드 위에서^^)
		MemberBean mb = new MemberBean();
		
		try {
			// 1+2 DB 연결 메서드 호출~ Connection형 변수 con에 넣기
			con = getCon();
			
			// 3. sql 쿼리 작성 & pstmt & ?
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); 
				// info.jsp에 저장되있는 id 정보를 매개변수로 받아와서~~ 
				// -> DAO가 이 매개변수로 받은 id를 select 구문에 넣어서 DB로 날리고 
				// -> DB에서 얘랑 일치하는 id 있나 찾아보고 일치하는 애 정보를 쏵 가져옴
			
			// 4. sql 실행 & 실행결과를 rs에 넣기
			rs = pstmt.executeQuery();
			
			// 5. select 썼으니 데이터 결과값(레코드셋)이 생기니까 -> 그 데이터 처리해주기!!
			if(rs.next()){
				// BOF에서 커서 하나 내렸을 때,, row 있다!!
				// 그러면 이 row 데이터들을 -> 멤버빈 필통에 담아서 -> 멤버빈 필통을 리턴!!
				mb.setId(rs.getString("id")); // rs의 id 컬럼에서 데이터 꺼내서 -> 멤버빈의 id 변수에 저장
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGender(rs.getString("gender"));
				mb.setEmail(rs.getString("email"));
				mb.setRegdate(rs.getTimestamp("regdate"));
				
				System.out.println("(from DAO.getMemberInfo) 회원 정보 mb에 저장 완");
			}
			
			System.out.println("(from DAO.getMemberInfo) 조회된 회원 정보:");
			System.out.println("                                         " + mb);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			closeDB();
		}
		
		return mb; // 멤버빈 필통에 데이터들 담았으니, 멤버빈 필통 고대로 리턴
		
	} // 회원 정보 조회 메서드 getMemberInfo() 끝
	
}// MemberDAO class 끝
