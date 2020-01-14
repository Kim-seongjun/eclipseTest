package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Member;
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
		String sql = "SELECT * FROM PU JOIN PS ON PU.US_ID = PS.SITTER_ID WHERE PU.US_TYPE = 1";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<PetApply> plist = new ArrayList<PetApply>();
			PetApply pa = null;
			while (rs.next()) {
				pa = new PetApply();
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

	public boolean petsitterppr(String id) {
		String sql = "UPDATE PU SET us_type = 2 WHERE US_ID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, id);
			int result = pstmt.executeUpdate();
			System.out.println("들어오냐");
			if (result != 0) {
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
		String sql = "DELETE FROM PS WHERE SITTER_ID= ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, id);
			int result = pstmt.executeUpdate();
			if (result != 0) {
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
		String sql = "UPDATE PU SET us_type = 0 WHERE US_ID = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, id);
			int result = pstmt.executeUpdate();
			if (result != 0) {
				System.out.println("거절한 회원타입변경 성공");
				return true;
			}
		} catch (SQLException e) {
			System.out.println("거절한 회원타입변경 예외");
			e.printStackTrace();
		}
		return false;
	}

	public List<Member> userlist() {
		String sql = "SELECT * FROM PU";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Member> ulist = new ArrayList<Member>();
			Member mb = null;
			while (rs.next()) {
				mb = new Member();
				mb.setId(rs.getNString("US_ID"));
				mb.setPw(rs.getNString("US_PW"));
				mb.setName(rs.getNString("US_NAME"));
				mb.setGender(rs.getNString("US_GENDER"));
				mb.setBirth(rs.getNString("US_BIRTH"));
				mb.setTel(rs.getNString("US_TEL"));
				mb.setMail(rs.getNString("US_MAIL"));
				mb.setAddr(rs.getNString("US_ADDRESS"));
				mb.setBlacklist(rs.getNString("US_BLACKLIST"));
				mb.setType(rs.getInt("US_TYPE"));
				ulist.add(mb);
			}
			System.out.println("유저리스트 불러오기 성공?");
			return ulist;

		}

		catch (SQLException e) {
			System.out.println("유저리스트 예외");
			e.printStackTrace();
		}
		return null;
	}

	public boolean black(String sit_id) {
		String sql = "update PET_USER set us_blacklist = 'Y' where us_id = ? ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, sit_id);
			int result = pstmt.executeUpdate();
			if (result != 0) {
				System.out.println("블랙리스트 적용되었습니다.");
				return true;
			}
		} catch (SQLException e) {
			System.out.println("블랙리스트변경 예외");
			e.printStackTrace();
		}
		return false;
	}

	public List<Member> userblacklist() {
		String sql = "select * from pu where us_blacklist = 'Y'";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Member> ublist = new ArrayList<Member>();
			Member ub = null;
			while (rs.next()) {
				ub = new Member();
				ub.setId(rs.getNString("US_ID"));
				ub.setPw(rs.getNString("US_PW"));
				ub.setName(rs.getNString("US_NAME"));
				ub.setGender(rs.getNString("US_GENDER"));
				ub.setBirth(rs.getNString("US_BIRTH"));
				ub.setTel(rs.getNString("US_TEL"));
				ub.setMail(rs.getNString("US_MAIL"));
				ub.setAddr(rs.getNString("US_ADDRESS"));
				ub.setBlacklist(rs.getNString("US_BLACKLIST"));
				ub.setType(rs.getInt("US_TYPE"));
				ublist.add(ub);
			}
			System.out.println("블랙리스트유저리스트 불러오기 성공?");
			return ublist;

		}

		catch (SQLException e) {
			System.out.println("블랙리스트유저리스트 예외");
			e.printStackTrace();
		}

		return null;

	}

	public boolean white(String sit_id) {
		String sql = "update PET_USER set us_blacklist = 'N' where us_id = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, sit_id);
			int result = pstmt.executeUpdate();
			if (result != 0) {
				System.out.println("화이트리스트 적용되었습니다.");
				return true;
			}
		} catch (SQLException e) {
			System.out.println("화이트리스트변경 예외");
			e.printStackTrace();
		}

		return false;
	}

	public List<String> question() {
		String sql = "SELECT * FROM PQ";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<String> sList = new ArrayList<String>();

			while (rs.next()) {
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
			System.out.println("질문수정창 예외");
			e.printStackTrace();
		}
		return null;
	}

	public boolean pqmodify(String col_num, String pq_modify) {
		String sql = "UPDATE PQ SET "+col_num+" = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setNString(1, pq_modify);
			int result = pstmt.executeUpdate();
			if (result != 0) {
				System.out.println("질문 수정 완료");
				return true;

			}
		} catch (SQLException e) {
			System.out.println("질문 수정 에러");
			e.printStackTrace();
		}
		return false;
	}

}
