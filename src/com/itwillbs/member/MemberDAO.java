package com.itwillbs.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	
	///////////////////////////////////////////////////////////////////////////////
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
		System.out.println("드라이버 로드 성공 (from DAO.getCon())");
		
		//2. DB 연결
		con = DriverManager.getConnection(DBURL, DBID, DBPW); 
		System.out.println("DB 연결 성공 (from DAO.getCon())");
		System.out.println("con: " + con);
		
		return con;
		
	}// DB 연결 메서드 getCon() 끝
	
	
	///////////////////////////////////////////////////////////////////////////////
	// DB 자원 해제 closeDB() 시작
	//    실행되면 자원 해제하는 메서드
	public void closeDB(){
		// DB 연결할 때 필요한 애들 con, pstmt, rs,, 해제하기!!
		// rs.close(); -> error -> try-catch로
		try {
			if(rs != null) rs.close();		// 종료 순서는 연결했을 때랑 역순으로!! 하는 게 쫌 더 안정적이겠지요
			if(pstmt != null) pstmt.close();	// 연결:  con -> pstmt -> rs
			if(con != null) con.close();		// 종료:  rs  -> pstmt -> con
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} //close() 끝
	
	
	///////////////////////////////////////////////////////////////////////////////
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
			
			System.out.println("my name is DAO: 회원 가입 성공^^ ㅊㅋㅊㅋ (from DAO.insertMember())");
			
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패 (from DAO.insertMember())");
			e.printStackTrace();
		}// 1. 드라이버 로드 예외 처리  
			// Class.forName(DRIVER);
								// Unhandled exception type ClassNotFoundException
								// 클래스가 혹시나 없을 상황에 대비를 안 해놨다,,, ㅡㅡ? 장난?
								// -> surround with try/catch 눌러서 고치기
		catch (SQLException e) {
			System.out.println("DB 연결 실패 (from DAO.insertMember())");
			e.printStackTrace();
		}// 2. DB 연결 예외 처리
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			// 디비 처리에 대한 동작 끝!! 예외가 발생하든, 안하든 DB 에 대한 동작 끝나고 여기 온 거임
			// pstmt.close(); -> try catch 구문에 담고 -> con.close()
			// close()??? DB 연결되는 작업 종료하는 것~~ 다 썼으니까 없애는 것
			try {
				// 자원 해제  
				//    <<< 왜 함? 쿼리 실행할 때마다 mySQL에 프로세스 찍혔잖아요,,? 
				//        얘 쓰면 프로세스 안 남고 종료가 됨~ 오우 효율적인 자원 관리가 가능하겠군^^
//				pstmt.close();
//				con.close();  업글↓
				if(pstmt != null) { // 왜 nn일 때만 ?? 젤 위에 우리가 변수들을,, null로 설정했쥐요
					pstmt.close();  // 쭉~~ 다 하고 finally왔는데 nn이다? DB 썼는데, 자원 해제 안 한 것
				}					// => 정보가 남아있다면~ (남아있으면 안 되니까) 종료해라^^ 
				if(con != null) { 
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}// 회원가입 - insertMember() 끝
	
	
	///////////////////////////////////////////////////////////////////////////////
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
			
		} finally{
			closeDB(); // 자원해제 메서드 호출
		}
		
		// return 0; 일단,, 오류 막으려고 암거나(0) 집어넣음,,
		return result;
	} // 로그인 여부 체크 loginMember() 끝
	
	
	///////////////////////////////////////////////////////////////////////////////
	// 회원 정보 조회 메서드 getMember(id) 시작
	public MemberBean getMember(String id) {  // id로 식별하니까 매개변수 id
		// 리턴타입을 뭘로ㅡ,,? 정보 조회 -> 아이디, 이름, 성별,,, 이런 거 리턴해야 하니까 멤버빈을 걍 리턴해버리자!!
		// 메서드는 리턴 하나밖에 못 하는데, 멤버빈을 그 하나로 쳐가지고,, 멤버빈 안에 여러 정보들 담아서 리턴해주자는 말
		
		// 회원정보 저장할 객체,, 필통만 하나 만듦
		MemberBean mb = new MemberBean(); // 지역변수로 써서 날라가면 안되니까 여기ㅏ가 쓸게욤
		
		
		
		try {
			// 1. 드라이버 로드 + // 2. DB 연결 해서 Connection형 변수 con에 넣기
			con = getCon();
			
			// 3. sql(select) & pstmt + ?
			sql = "select * from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			// pstmt.setString(1, mb.getId()); 땡~~~ 
			pstmt.setString(1, id); 
				// info.jsp 페이지에 있는 id 정보를, DAO로 보내준다! 
				// 왜냐 dao에는 이 id 정보가 없거덩,, 
				// 그래서 매개변수로 받은 id정보를 가지고 dao가 db로 가서 찾아보는 것
			
			
			// 4. sql 실행.. 실행결과를 rs에 넣기
			rs = pstmt.executeQuery();
			
			// 5. ★select 쓰면 데이터 결과값이 생기니까 그 데이터 처리해주기★
			if(rs.next()){ // 커서 BOF -> 에서 하나 내렸을 때 데이터 있냐??
				// 데이터 있다! select 구문 날린 결과 해당하는 데이터가 있다~ (사진 참고)
				// 조회된 회원 정보 저장하기,,, 어떻게 전달할건디?
				// 리턴타입 멤버빈,, 필통에 담아서유
				mb.setId(rs.getString("id")); // rs의 id컬럼에서 데이터 꺼내서, 멤버빈의 id 변수에 넣어라
				mb.setPw(rs.getString("pw")); // rs의 pw컬럼에서 데이터 꺼내서, 멤버빈의 pw 변수에 넣어라
				mb.setName(rs.getString("name"));
				mb.setAge(rs.getInt("age"));
				mb.setGender(rs.getString("gender"));
				mb.setEmail(rs.getString("email"));
				mb.setRegdate(rs.getTimestamp("regdate"));
				
				System.out.println("DAO: 회원 정보 저장 완료 (from DAO.getMember(id)");
			}
			
			System.out.println("조회된 회원 정보 (from DAO.getMember(id): "); 
			System.out.println(mb);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally{
			closeDB();
		}
		
		return mb; // 멤버빈에 정보 담았으니까, 멤버빈 필통 리턴
		
	} // 회원 정보 조회 메서드 getMember(id) 끝
	
	
	///////////////////////////////////////////////////////////////////////////////
	// 정보 수정 메서드(이름, 나이, 성별, 이메일)  updateMember(MB) 시작
							// 받아와서 그걸 수정해야 하는데, 받아오는 게 하나가 아니니까,, MemberBean으로 받아오기
	public int updateMember(MemberBean mb){
		// 수정 결과 표시하는 변수 result
				// 1: 수정 성공    0: 수정 실패(비번때메,, =본인X)    -1: 수정 실패(회원이 X,,)
																// 근데~ -1인 경우는 거의 없을 것임^^ session 로그인 체크에서 함 거르니까~~
		int result = -1; 
		
		//DB에서 정보 조회 -> user 정보 수정
		// 1. 2. DB 연결, 연결 정보 con에 저장
		try {
			con = getCon();
			
			// 3. sql & pstmt 
				// 1) 수정하려는 정보가 회원인지 + 본인인지 체크
				// 2) 회원+본인일 때만 정보 수정!!!
					// ==> 로그인 로직이랑 같은 거
				
			sql = "select pw from itwill_member where id=?";
						// nn							pk ,, so id에 해당하는 비번 무조건 있어야 함,, 이게 없으면? 비회원
			pstmt = con.prepareStatement(sql);
					// ? 처리
			pstmt.setString(1, mb.getId()); // mb에 담아서 왔으니 필통에서 꺼내기~
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
				//select니까 rs에 담아서,, 결과 조회하기!! 
			
			// 5. select로 출력해와서 rs에 담은 데이터로 처리를 할 것임다 
				// 2) 본인일 때만 정보 수정 (위에 그거)
			if(rs.next()){
				// where 조건절 id에 해당하는 pw가 있다 = 회원 ㅇㅇ
				if(mb.getPw().equals(rs.getString("pw"))){ //mb에 있는 pw랑 == select해서 가져온 rs에 있는 pw랑 같나?
					// => 회원이면서 + 비밀번호 동일 -> 본인?? ㅇㅇ
					// 여기서!!! 정보 수정하면 되겠네!!!!!!!!!!!!!!!!
						// 1. 2. DB연결,,,,, 안 해도 됨 이 메서드 안에서 위에 해놨기 때메,,
						// 3. sql(update) & pstmt
							// 특정 사용자의 정보(이름, 나이, 성별, 이메일) 수정
							sql = "update itwill_member"
									+ " set name=?, age=?, gender=?, email=?"
									+ " where id=?"; // pw는 체크 안 해도 됨,, pw 참인 경우잖아요 지금!! 정신 차리삼
							// ★ pstmt ★ 까먹지 맙시다~~~ ★★★★★★★★★★★ sql과,, pstmt 는 한 쌍 ★★
							pstmt = con.prepareStatement(sql);
							
							// ? 처리
							// ? 5개니까 ---- set도 5개
							pstmt.setString(1, mb.getName());
							pstmt.setInt(2, mb.getAge());
							pstmt.setString(3, mb.getGender());
							pstmt.setString(4, mb.getEmail());
							pstmt.setString(5, mb.getId());
					
						// 4. sql 실행
							pstmt.executeUpdate();
							
							result = 1;
							System.out.println("DAO.updateMember : 정보 수정 완료");
					
					
				} else {
					// 회원O + 비번 오류 --> 본인 X,,
					result = 0;
				}// if-else(안에)
				
			} else {
				// 비회원
				result = -1;
				
			}// if-else(밖에)
			
			System.out.println("DAO.updateMember(): DB 동작(수정 기능) 처리 끝 ,,, result: " + result);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			closeDB(); // 자원해제까지
		}
		
		return result; // 일단은 0으로,, -> result
	}
	// 수정,, 삭제,, 조심!! 일단 우리 회원인지 + 본인이 맞는지 보고, 그 때만 수정할 것입니다
	// 정수로 리턴~~~ 로그인할 때 1, 0, -1
	// 정보 수정 메서드(이름, 나이, 성별, 이메일)  updateMember(MB) 끝
	
	
	///////////////////////////////////////////////////////////////////////////////
	// 정보 삭제 메서드 deleteMember() 시작
	public int deleteMember(String id, String pw){
		int result = -1;
		// 정상 삭제 완: 1   /  비번 잘못됨: 0     / 아이디 잘못됨: -1
		
		try {
			// 1+2 
			con = getCon();
			
			// 3. sql 생성(select) & pstmt & ?
				// 삭제하려는 회원 정보가 있는지!! select로 함 봅시다
			sql = "select pw from itwill_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. select해서 가져온 결과값이 있으니 그거 데이터 처리
			if (rs.next()){
				if(rs.getString("pw").equals(pw)){ 
					// 내가 매개변수로 받아온 pw랑 =  DB에서 꺼내온 rs에 있는 pw랑 같나?
					// id, 비번 다 일치!! -> 탈퇴시켜주기!!!!!!!!!
						// 3. sql(delete) & pstmt 객체 & ?
						sql = "delete from itwill_member where id=? and pw=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.setString(2, pw);
						
						// 4. sql 실행
						// pstmt.executeUpdate();
						result = pstmt.executeUpdate();
									// 얘 리턴값: int!!! insert, update, delete 구문이 영향을 준 row 수를 리턴,,
									// ==> 몇 줄 삭제됐냐??? 여기선 무조건 한 줄이지! id가 pk니까~~
									// so 여기서 result = 1 무족권^^
						// result = 1; 그니까 얜 필요 X
						System.out.println("(from DAO.deleteMember) 삭제 완료  result: " + result);
						
				} else {
					//id일치, 비번 불일치
					result = 0;
					System.out.println("(from DAO.deleteMember) 삭제 실패,,  result: " + result);
					
				} // if-else (안)
				
			} else {
				// id 불일치,, 비회원쓰
				result = -1;
				System.out.println("(from DAO.deleteMember) 삭제 실패,,  result: " + result);
			} // if-else (밖)
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			closeDB();
		}
		
		return result;
	} // 정보 삭제 메서드 deleteMember() 끝
	
	///////////////////////////////////////////////////////////////////////////////
	// 전체 회원 정보 조회 메서드 getMemberList() 시작
	public ArrayList<MemberBean> getMemberList(){
		// 리턴타입을 뭘로 해줘야 하남,,? 멤버빈이 1개가 아니라 여러~~~개일테니,,, 배열!!
		// 그중에서도~~ 가변 길이 배열!! 만들기
		// 1.    try-catch 밖에다가 선언해야,, 리턴할 수 있껬죵
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>(); 
			// 멤버빈만! 가져올 수 있게 멤버빈 전용!! 박스 만들기,, 다른 애들은 못 들어와~~~
		// ArrayList<MemberBean> memberList = new ArrayList<>();
		// List<MemberBean> memberList = new ArrayList<MemberBean>();
		
		// 2. DB에서 데이터 꺼내오기
			try {
				// 1+2. DB 연결
				con = getCon();
				
				// 3. sql 쿼리(select~) 작성 & pstmt & ?
				sql = "select * from itwill_member order by regdate";
				pstmt = con.prepareStatement(sql);
				
				// 4. sql 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				while(rs.next()){ // rs에 데이터 여러 개니까~~ (select *이자넴!!!) if 말고 while문으로^^
									// 쿼리 돌려봤는데 row 하나뿐? if문^^
					// DB에서 조회한 회원 정보를 저장~~ ArrayList에!! 바로 담는 게 아니라
					// DB 데이터 (rs) -> MemberBean 객체에 저장하고! -> ArrayList에 멤버빈 필통 통째로 담겠다
					MemberBean mb = new MemberBean();
					
					mb.setId(rs.getString(1));
					mb.setPw(rs.getString(2));
					mb.setName(rs.getString("name"));
					mb.setAge(rs.getInt(4));
					mb.setGender(rs.getString(5));
					mb.setEmail(rs.getString("email"));
					mb.setRegdate(rs.getTimestamp(7));
					
					// while문 실행하고 mb에 정보들 싹 저장 잘 했는데~ 
					// bof -> row1 -> row2.. 다음 while 돌 때는? 이 필통이 싹 사라짐,, 지역변수라,,ㅋ,,,,
					// 사라지기 전에 ArrayList에 옮겨 담기!!
					memberList.add(mb); // memberList는 안 사라지나요? 넴~ lv가 아니라 전역변수라서~~
				}
				System.out.println("(from DAO.getMemberList) 회원 목록 조회 성공쓰");
				System.out.println("(from DAO.getMemberList) 총 회원 수: " + memberList.size());

			} catch (Exception e) {
				e.printStackTrace();
			} finally{
				closeDB();
			}
			
		return memberList;
	} // 전체 회원 정보 조회 메서드 getMemberList() 끝
	
	
}// MemberDAO class 
