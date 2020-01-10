package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import bean.Member;
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

	public List<HashMap<String, String>> petsittersearch() {
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

}
