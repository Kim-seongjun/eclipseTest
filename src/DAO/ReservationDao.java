package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

	public boolean reservation(String res_id) {
		String sql="";
		
		return false;
	}
	
	
	
	
	
	
}
