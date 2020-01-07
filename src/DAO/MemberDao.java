package DAO;

import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
		
		public MemberDao() {
		con=jdbcUtil.getConnection();
			}
			
		public void close() {
			jdbcUtil.close(rs, pstmt, con);
		}


		public int access(String id, String pw) {
			String sql="SELECT * FROM M WHERE ID=?";
			int result=-1;
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setNString(1, id);
				rs=pstmt.executeQuery();	//실행
				if(rs.next()) {
					if(rs.getNString("PW").equals(pw)) 
						result=1; //모두일치
					else 
						result=0; //id는같지만 pw가 일치하지 않다	
				}else 
					result=-1; //id 불일치
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return result;
		}

//		public boolean memberJoin(Member mb) {
//			String sql="INSERT INTO MEMBER VALUES(?,?,?,?)";
//		      int result=0;
//		      try {
//		         pstmt=con.prepareStatement(sql);
//		         pstmt.setNString(1, mb.getId());
//		         pstmt.setNString(2, mb.getPw());
//		         pstmt.setNString(3, mb.getName());
//		         pstmt.setNString(4, mb.getGender());
//		         result=pstmt.executeUpdate();
//		         if(result!=0) {
//		            return true;
//		         }
//		      } catch (SQLException e) {
//		         System.out.println("회원가입 실패");
//		         e.printStackTrace();
//		      }
//		      return false;
//		}

}
