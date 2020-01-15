package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import bean.Reservation;
import bean.Review;

public class ReservationDao {

	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public ReservationDao() {
		con = jdbcUtil.getConnection();
	}

	public void close() {
		jdbcUtil.close(rs, pstmt, con);
	}

	public boolean reservation(Reservation res) {
		String sql="INSERT INTO PR VALUES(PR_SEQ.nextval,?,?,?,?,?,?)";
		try {
			
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, res.getUs_id());
			pstmt.setNString(2, res.getSitter_id());
			pstmt.setNString(3, res.getRes_no());
			pstmt.setNString(4, res.getRes_date_fr());
			pstmt.setNString(5, res.getRes_date_to());
			pstmt.setNString(6, res.getRes_price());
			int result=pstmt.executeUpdate();
			if(result!=0) {
				System.out.println("예약 성공");
				return true;	
			}
		} catch (SQLException e) {
			System.out.println("예약 예외");
			e.printStackTrace();
		}
		
		return false;
	}


	public boolean reviewinsert(Review rv) {
		String sql="INSERT INTO PH VALUES(?,?,?,?)";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, rv.getRes_no());
			pstmt.setNString(2, rv.getRes_poient());
			pstmt.setNString(3, rv.getRes_title());
			pstmt.setNString(4, rv.getRes_cont());
			int result=pstmt.executeUpdate();
			if(result!=0) {
				System.out.println("리뷰쓰기 성공");
				return true;
			}
			
			
		} 	
		catch (SQLException e) {
			System.out.println("리뷰쓰기 예외");
			e.printStackTrace();
		}
		
		return false;
	}

	public List<HashMap<String, String>> reviewshow(String petsitter_id) {
		String sql="SELECT * FROM PH JOIN PR ON PH.RES_NO = PR.RES_NO JOIN PU ON PR.US_ID=PU.US_ID WHERE PR.SITTER_ID =?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, petsitter_id);
			rs=pstmt.executeQuery();
			List<HashMap<String, String>> hList=new ArrayList<HashMap<String, String>>();
			while(rs.next()) {
				HashMap<String, String> hm=new HashMap<String, String>();
				hm.put("RES_POINT",rs.getNString("RE_POINT"));
				hm.put("RES_TITLE",rs.getNString("RE_TITLE"));
				hm.put("RES_CONT",rs.getNString("RE_BODY"));
				hm.put("US_NAME",rs.getNString("US_NAME"));
				hList.add(hm);
			}
			System.out.println("리뷰 불러오기 성공");
			return hList;
			
		} catch (SQLException e) {
			System.out.println("리뷰 불러오기 예외");
			e.printStackTrace();
		}
	
		
		return null;
	}
	
	
	
	
	
	
}
