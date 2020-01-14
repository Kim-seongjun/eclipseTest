package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bean.Reservation;

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
	
	
	
	
	
	
}
