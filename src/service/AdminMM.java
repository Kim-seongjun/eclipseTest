package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.AdminDao;
import DAO.MemberDao;
import bean.Forward;
import bean.Member;
import bean.PetApply;

public class AdminMM {
	HttpServletRequest request;
	HttpServletResponse response;

	public AdminMM(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public Forward petapplylist() {
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		PetApply pa = new PetApply();
		List<PetApply> plist = aDao.petapplylist();

		Gson g = new Gson();
		String r = g.toJson(plist);
		System.out.println("===========");
		System.out.println(r);
		request.setAttribute("json_plist", r);
		if (plist.size() >= 0) {
			fw.setPath("petapplylist.jsp");
			fw.setRedirect(false);
		} else {
			System.out.println("지원서 불러오기 실패");
			fw.setPath("main.jsp");
			fw.setRedirect(false);
		}
		return fw;
	}

	public Forward blackList() {
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		List<Member> ublist = aDao.userblacklist();
		Gson g = new Gson();
		String r = g.toJson(ublist);
		request.setAttribute("json_ublist", r);
		fw.setPath("blacklist.jsp");
		fw.setRedirect(false);
		return fw;
	}

	public Forward userlist() {
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		List<Member> ulist = aDao.userlist();
		Gson g = new Gson();
		String r = g.toJson(ulist);
		request.setAttribute("json_ulist", r);
		fw.setPath("userlist.jsp");
		fw.setRedirect(false);
		return fw;
	}

	public Forward petsitterappr() {
		Forward fw = new Forward();
		String id = request.getParameter("sit_id");
		System.out.println("승인할 id = " + id);
		AdminDao aDao = new AdminDao();
		boolean result = aDao.petsitterppr(id);
		aDao.close();
		if (result) {
			fw.setPath("petapplylist");
			fw.setRedirect(false);
		} else {
			fw.setPath("petapplylist.jsp");
			fw.setRedirect(false);
		}
		return fw;
	}

	public Forward deletePetApply() {
		Forward fw = new Forward();
		String id = request.getParameter("sit_id");
		System.out.println("지원삭제할 id = " + id);
		AdminDao aDao = new AdminDao();
		boolean result = aDao.deletePetApply(id);
		aDao.close();
		if (result) {
			fw.setPath("petapplylist.jsp");
			fw.setRedirect(false);
		} else {
			fw.setPath("petapplylist.jsp");
			fw.setRedirect(false);
		}
		return fw;
	}

	public Forward rejectedUser() {
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		String id = request.getParameter("sit_id");
		System.out.println("거절할회원타입 변경 id=" + id);
		boolean result = aDao.rejectedUser(id);
		aDao.close();
		if (result) {
			fw.setPath("petapplylist");
			fw.setRedirect(true);
		} else {
			fw.setPath("petapplylist");
			fw.setRedirect(false);
		}
		return fw;
	}

	public Forward black() {
		String sit_id = request.getParameter("sit_id");
		System.out.println("sit_id =" + sit_id);
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		boolean result = aDao.black(sit_id);
		aDao.close();
		if (result) {
			fw.setPath("userlist");
			fw.setRedirect(true);
		} else {
			fw.setPath("userlist");
			fw.setRedirect(false);
		}
		return fw;

	}
	
	public Forward white() {
		String sit_id = request.getParameter("sit_id");
		System.out.println("sit_id =" + sit_id);
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		boolean result = aDao.white(sit_id);
		aDao.close();
		if (result) {
			fw.setPath("blacklist");
			fw.setRedirect(true);
		} else {
			fw.setPath("blacklist");
			fw.setRedirect(false);
		}
		return fw;
	
	}

	public Forward question() {
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		List<String> sList=null;
		sList=aDao.question();
		for(int i=0;i<sList.size();i++) {
			System.out.println(i+"번째 sList = "+sList.get(i));
			
			}
		Gson g = new Gson();
		String r = g.toJson(sList);
		System.out.println("===========");
		System.out.println(r);
		request.setAttribute("json_question" , r);
		
		fw.setPath("question.jsp");
        fw.setRedirect(false);
		return fw;
	}

	public Forward pqmodify() {
		String pq_modify = request.getParameter("questions");
		String col_num = request.getParameter("questions_no");
		System.out.println("col_num = "+col_num);
		System.out.println("pq_modify="+pq_modify);
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		
		boolean result = aDao.pqmodify(col_num,pq_modify);
		aDao.close();
		if (result) {
			fw.setPath("question");
			fw.setRedirect(true);
		} else {
			fw.setPath("question");
			fw.setRedirect(false);
		}
		return fw;
	}

	public Forward showquestion() {		//질문 삭제
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		
		return fw;
	}

	public Forward deleteQuestion() {	//질문 삭제
		Forward fw = new Forward();
		AdminDao aDao = new AdminDao();
		
		String id = request.getParameter("sit_id");
		System.out.println("질문삭제할 id = " + id);
		
		boolean result = aDao.deleteQuestion(id);
		aDao.close();
		if (result) {
			fw.setPath("petapplylist.jsp");
			fw.setRedirect(false);
		} else {
			fw.setPath("petapplylist.jsp");
			fw.setRedirect(false);
		}
		return fw;
	}

	
}
