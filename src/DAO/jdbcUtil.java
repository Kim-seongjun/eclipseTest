package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//디비접속, 디비종료, TX(commit, rollback....)
public class jdbcUtil {
	
	static { // 초기화 1번만
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException cne) {
			System.out.println("드라이버 로딩 실패");
			cne.printStackTrace();
		}
	} // static End

	public static Connection getConnection() { //db접속
		Connection con=null;
		try {
			con = DriverManager.getConnection("jdbc:oracle:thin:@106.243.194.226:4200:xe", "ICIA", "1111");
			System.out.println("DB접속 성공");
			//con.setAutoCommit(false);  //트랜잭션 처리시 수동 커밋
		} catch (SQLException e) {
			System.out.println("DB접속 실패");
			e.printStackTrace();
		}	
		return con;
	}//getConnection() End

	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

		} catch (SQLException e) {
			System.out.println("close 에러");
			e.printStackTrace();
		}
		System.out.println("close Ok");		
	} //close() End
	
	public static void commit(Connection con) {
		try {
		con.commit();
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}  // commit() End

	
	
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (Exception e) {
		}
		
	}//rollback() End

	
	
	
}//class End