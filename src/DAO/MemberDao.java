package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Member;

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
			}
			return sList;
		} 
		
		
		catch (SQLException e) {
			System.out.println("지원서 질문 예외");
			e.printStackTrace();
		}
		return null;
	}

}
