package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import bean.Member;
import bean.Pet;
import bean.PetApply;


public class MemberDao {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDao() {
		con = jdbcUtil.getConnection();
	}

	public void close() {
		jdbcUtil.close(rs, pstmt, con);
	}

	public int access(String id, String pw) {
		String sql = "SELECT * FROM PU WHERE US_ID=?";
		int result = -1;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, id);
			rs = pstmt.executeQuery(); // 실행
			
			if (rs.next()) {
				if (rs.getNString("us_pw").equals(pw)) {
					result = 1; // 모두일치
					System.out.println("리절트값 " + result);
				} else {
					result = 0; // id는같지만 pw가 일치하지 않다
					System.out.println("리절트값 " + result);
				}
			}
			else {
				result = -1; // id 불일치
				System.out.println("리절트값 " + result);
			}

		} catch (SQLException e) {
			System.out.println("로그인 예외");
			e.printStackTrace();
		}

		return result;
	}

	public boolean memberJoin(Member mb) {
		String sql = "INSERT INTO PU VALUES(?,?,?,?,?,?,?,?,DEFAULT,DEFAULT)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, mb.getId());
			pstmt.setNString(2, mb.getPw());
			pstmt.setNString(3, mb.getName());
			pstmt.setNString(4, mb.getGender());
			pstmt.setNString(5, mb.getBirth());
			pstmt.setNString(6, mb.getTel());
			pstmt.setNString(7, mb.getMail());
			pstmt.setNString(8, mb.getAddr());

			result = pstmt.executeUpdate();
			if (result != 0) {
				return true;
			}
		} catch (SQLException e) {
			System.out.println("회원가입 실패");
			e.printStackTrace();
		}
		return false;
	}

	public List<String> petapply() {
		String sql ="SELECT * FROM PQ";
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			List<String> sList=new ArrayList<String>();
				
			while(rs.next()) {	
				sList.add(rs.getNString("QUESTION1"));
				sList.add(rs.getNString("QUESTION2"));
				sList.add(rs.getNString("QUESTION3"));
				sList.add(rs.getNString("QUESTION4"));
				sList.add(rs.getNString("QUESTION5"));
				sList.add(rs.getNString("QUESTION6"));
				sList.add(rs.getNString("QUESTION7"));
			}
			return sList;
		} 
		
		
		catch (SQLException e) {
			System.out.println("지원서 질문 예외");
			e.printStackTrace();
		}
		return null;
	}

	public boolean insetPetApply(PetApply pa) {
		String sql = "INSERT INTO PS VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, pa.getId());
			pstmt.setNString(2, pa.getTitle());
			pstmt.setNString(3, pa.getCont());
			pstmt.setNString(4,pa.getPrice());
			pstmt.setNString(5,pa.getImgFile());
			pstmt.setNString(6,pa.getQuestions1());
			pstmt.setNString(7,pa.getQuestions2());
			pstmt.setNString(8,pa.getQuestions3());
			pstmt.setNString(9,pa.getQuestions4());
			pstmt.setNString(10,pa.getQuestions5());
			pstmt.setNString(11,pa.getQuestions6());
			pstmt.setNString(12,pa.getQuestions7());
			
			int result=pstmt.executeUpdate();
			if(result!=0) {
				System.out.println("펫시터 지원 성공");
				return true;
			}
			
		} 	
		catch (SQLException e) {
			System.out.println("펫시터 지원 예외");
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateUser(String id) {
			String sql="UPDATE PU SET us_type = 1 WHERE US_ID = ?";
			
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setNString(1,id);
				int result=pstmt.executeUpdate();
				if(result!=0) {
					System.out.println("회원타입변경 성공");
					return true;
				}
			} 					
			catch (SQLException e) {
				System.out.println("회원타입변경 예외");
				e.printStackTrace();
			}
			
		return false;
	}
	//검색창에서 지역 선택
	public List<HashMap<String, String>> petsittersearch(String region) {
		
		
		if("전체".equals(region)) {
		String sql="SELECT * from PS JOIN PU ON ps.sitter_id = pu.us_id WHERE US_TYPE = 2";
		
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			List<HashMap<String, String>> sList=new ArrayList<HashMap<String, String>>();
			
			while(rs.next()) {
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put("SITTER_ID", rs.getNString("SITTER_ID"));
				hm.put("SITTER_TITLE",rs.getNString("SITTER_TITLE"));
				hm.put("SITTER_BODY",rs.getNString("SITTER_BODY"));
				hm.put("US_ADDRESS",rs.getNString("US_ADDRESS"));
				hm.put("SITTER_PRICE",rs.getNString("SITTER_PRICE"));
				hm.put("SITTER_PHOTO",rs.getNString("SITTER_PHOTO"));
				hm.put("ANSWER1",rs.getNString("ANSWER1"));
				hm.put("ANSWER2",rs.getNString("ANSWER2"));
				hm.put("ANSWER3",rs.getNString("ANSWER3"));
				hm.put("ANSWER4",rs.getNString("ANSWER4"));
				hm.put("ANSWER5",rs.getNString("ANSWER5"));
				hm.put("ANSWER6",rs.getNString("ANSWER6"));
				hm.put("ANSWER7",rs.getNString("ANSWER7"));
				sList.add(hm);
			}
		
			System.out.println("펫시터검색 성공");
			return sList;
			
			
		} catch (SQLException e) {
			System.out.println("펫시터검색 예외");
			e.printStackTrace();
		}
		
		}else {
			System.out.println(region);
			System.out.println("asdasdasxcv");
			String sql="SELECT * from PS JOIN PU ON ps.sitter_id = pu.us_id WHERE US_TYPE = 2 and US_ADDRESS LIKE ?||'%'";
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setNString(1, region);
				rs=pstmt.executeQuery();
				
				List<HashMap<String, String>> sList=new ArrayList<HashMap<String, String>>();
				
				while(rs.next()) {
					HashMap<String, String> hm = new HashMap<String, String>();
					hm.put("SITTER_ID", rs.getNString("SITTER_ID"));
					hm.put("SITTER_TITLE",rs.getNString("SITTER_TITLE"));
					hm.put("SITTER_BODY",rs.getNString("SITTER_BODY"));
					hm.put("US_ADDRESS",rs.getNString("US_ADDRESS"));
					hm.put("SITTER_PRICE",rs.getNString("SITTER_PRICE"));
					hm.put("SITTER_PHOTO",rs.getNString("SITTER_PHOTO"));
					hm.put("ANSWER1",rs.getNString("ANSWER1"));
					hm.put("ANSWER2",rs.getNString("ANSWER2"));
					hm.put("ANSWER3",rs.getNString("ANSWER3"));
					hm.put("ANSWER4",rs.getNString("ANSWER4"));
					hm.put("ANSWER5",rs.getNString("ANSWER5"));
					hm.put("ANSWER6",rs.getNString("ANSWER6"));
					hm.put("ANSWER7",rs.getNString("ANSWER7"));
					sList.add(hm);
				}
			
				System.out.println("펫시터검색 성공");
				return sList;
				
				
			} catch (SQLException e) {
				System.out.println("펫시터검색 예외");
				e.printStackTrace();
			}
		}
		
		return null;
	}


	public boolean petinsert(Pet p) {
		String sql="INSERT INTO PP VALUES (PP_SEQ.nextval,?,?,?,?,?)";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, p.getId());
			pstmt.setNString(2, p.getPet_name());
			pstmt.setNString(3, p.getPet_type());
			pstmt.setNString(4, p.getPet_gender());
			pstmt.setNString(5, p.getPer_request());
			int result = pstmt.executeUpdate();
			if (result != 0) {
				System.out.println("애완동물 등록 성공");
				return true;
			}
			
			
		} catch (SQLException e) {
			System.out.println("애완동물 등록 예외");
			e.printStackTrace();
		}
		
		
		return false;
	}

	public HashMap<String, String> petsitterdetail(String petsitter_id) {
		String sql="SELECT * from PS JOIN PU ON ps.sitter_id = pu.us_id WHERE US_TYPE = 2 and SITTER_ID=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, petsitter_id);
			rs=pstmt.executeQuery();
			HashMap<String, String> hm=new HashMap<String, String>();
			if(rs.next()) {
				hm.put("SITTER_ID",rs.getNString("SITTER_ID"));
				hm.put("SITTER_TITLE",rs.getNString("SITTER_TITLE"));
				hm.put("SITTER_BODY",rs.getNString("SITTER_BODY"));
				hm.put("SITTER_PRICE",rs.getNString("SITTER_PRICE"));
				hm.put("SITTER_PHOTO",rs.getNString("SITTER_PHOTO"));
				hm.put("US_NAME",rs.getNString("US_NAME"));
				hm.put("US_TEL",rs.getNString("US_TEL"));
				hm.put("US_ADDRESS",rs.getNString("US_ADDRESS"));
//				sList.add(rs.getNString("")); 평점
			}
			return hm;
		} catch (SQLException e) {
			System.out.println("예약상세 예외");
			e.printStackTrace();
		}
		return null;
	}

	public int idcheck(String id) {
		String sql="SELECT * FROM PU WHERE US_ID=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			            return 1;
		}
			
		else if(id.equals("")){ //id가 공백이면
            return -1;
         }else {
            return 0;
         }
			
		
		}
			catch (SQLException e) {
			System.out.println("중복검사 예외");
			e.printStackTrace();
		}
		
		return 0;
	}
	//검색시 지역값 입력 안할시
	public List<HashMap<String, String>> petsittersearch() {
		
		String sql="SELECT * from PS JOIN PU ON ps.sitter_id = pu.us_id WHERE US_TYPE = 2";
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			List<HashMap<String, String>> sList=new ArrayList<HashMap<String, String>>();
			
			while(rs.next()) {
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put("SITTER_ID", rs.getNString("SITTER_ID"));
				hm.put("SITTER_NAME",rs.getNString("US_NAME"));
				hm.put("SITTER_TITLE",rs.getNString("SITTER_TITLE"));
				hm.put("SITTER_BODY",rs.getNString("SITTER_BODY"));
				hm.put("US_ADDRESS",rs.getNString("US_ADDRESS"));
				hm.put("SITTER_PRICE",rs.getNString("SITTER_PRICE"));
				hm.put("SITTER_PHOTO",rs.getNString("SITTER_PHOTO"));
				hm.put("ANSWER1",rs.getNString("ANSWER1"));
				hm.put("ANSWER2",rs.getNString("ANSWER2"));
				hm.put("ANSWER3",rs.getNString("ANSWER3"));
				hm.put("ANSWER4",rs.getNString("ANSWER4"));
				hm.put("ANSWER5",rs.getNString("ANSWER5"));
				hm.put("ANSWER6",rs.getNString("ANSWER6"));
				hm.put("ANSWER7",rs.getNString("ANSWER7"));
				sList.add(hm);
			}
		
			System.out.println("펫시터검색 성공");
			return sList;
			
			
		} catch (SQLException e) {
			System.out.println("펫시터검색 예외");
			e.printStackTrace();
		}
		return null;
	}

	public List<HashMap<String, String>> pet(String id) {
		String sql="SELECT * FROM PP WHERE USER_ID=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1,id);
			rs=pstmt.executeQuery();
			List<HashMap<String, String>> sList=new ArrayList<HashMap<String, String>>();
			if(rs.next()) {
				HashMap<String, String> hm = new HashMap<String, String>();
				hm.put("USER_ID",rs.getNString("USER_ID"));
				hm.put("PET_NAME",rs.getNString("PET_NAME"));
				hm.put("PET_NO",rs.getNString("PET_NO"));
				hm.put("PET_TYPE",rs.getNString("PET_TYPE"));
				hm.put("PET_GENDER",rs.getNString("PET_GENDER"));
				hm.put("PET_REQUEST",rs.getNString("PET_REQUEST"));
				sList.add(hm);
			}
			System.out.println("반려견 불러오기 성공");
			return sList;
		} catch (SQLException e) {
			System.out.println("반려견 불러오기 실패");
			e.printStackTrace();
		}
		
		return null;
	}

}
