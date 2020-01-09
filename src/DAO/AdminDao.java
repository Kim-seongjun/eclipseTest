package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.PetApply;

public class AdminDao {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public AdminDao() {
		con = jdbcUtil.getConnection();
	}

	public void close() {
		jdbcUtil.close(rs, pstmt, con);
	}

	public List<PetApply> petapplylist() {
		String sql="SELECT * FROM PS";
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			List<PetApply> plist=new ArrayList<PetApply>();
			PetApply pa=null;
			while(rs.next()) {	
				pa=new PetApply();
				pa.setId(rs.getNString("SITTER_ID"));
				pa.setTitle(rs.getNString("SITTER_TITLE"));
				pa.setCont(rs.getNString("SITTER_BODY"));
				pa.setPrice(Integer.toString(rs.getInt("SITTER_PRICE")));
				pa.setImgFile(rs.getNString("SITTER_PHOTO"));
				pa.setQuestions1(rs.getNString("ANSWER1"));
				pa.setQuestions2(rs.getNString("ANSWER2"));
				pa.setQuestions3(rs.getNString("ANSWER3"));
				pa.setQuestions4(rs.getNString("ANSWER4"));
				pa.setQuestions5(rs.getNString("ANSWER5"));
				pa.setQuestions6(rs.getNString("ANSWER6"));
				pa.setQuestions7(rs.getNString("ANSWER7"));
				plist.add(pa);
			}
			System.out.println("지원서 불러오기 성공?");
			return plist;
			
			
		} 
		
		
		catch (SQLException e) {
			System.out.println("펫시터 지원서 예외");
			e.printStackTrace();
		}
		return null;
	}

	public boolean petsitterappr(String id) {
		String sql="UPDATE PU SET us_type = 2 WHERE US_ID = ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, id);
			int result=pstmt.executeUpdate();
			if(result!=0) {
				System.out.println("펫시터승인 성공");
				return true;
			}
		} catch (SQLException e) {
			System.out.println("펫시터승인 예외");
			e.printStackTrace();
		}
		return false;
	}

	public boolean deletePetApply(String id) {
		String sql="DELETE FROM PS WHERE SITTER_ID= ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, id);
			int result=pstmt.executeUpdate();
			if(result!=0) {
				System.out.println("지원삭제 성공");
				return true;
			}
		} catch (SQLException e) {
			System.out.println("지원삭제 예외");
			e.printStackTrace();
		}
		return false;
	}

	public boolean rejectedUser(String id) {
		String sql="UPDATE PU SET us_type = 0 WHERE US_ID = ?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1,id);
			int result=pstmt.executeUpdate();
			if(result!=0) {
				System.out.println("거절한 회원타입변경 성공");
				return true;
			}
		} 					
		catch (SQLException e) {
			System.out.println("거절한 회원타입변경 예외");
			e.printStackTrace();
		}
		return false;
	}
	
}
