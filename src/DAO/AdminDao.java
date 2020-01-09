package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	public PetApply petapplylist() {
		//PetApply pa=new PetApply();
		String sql="SELECT * FROM PS";
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
