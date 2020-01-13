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
			pstmt.setNString(1, value);
			pstmt.setNString(2, value);
			pstmt.setNString(3, value);
			pstmt.setNString(4, value);
			pstmt.setNString(5, value);
			pstmt.setNString(6, value);
			int result
		} catch (SQLException e) {
			System.out.println("예약 예외");
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	
	
	
}
