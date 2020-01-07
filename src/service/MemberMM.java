package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.MemberDao;
import bean.Forward;

public class MemberMM {
	HttpServletRequest request;
	HttpServletResponse response;
	
	
	public MemberMM(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
	}


	public Forward access() {
		Forward fw=new Forward();
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		MemberDao mDao=new MemberDao();
		
		int result=mDao.access(id,pw);	//1:성공, -1:id부재,  0:pw부재
		mDao.close();
		if(result==-1) {
			request.setAttribute("msgAccess", "id존재하지 않아요!");
		}
		else if(result==0){
			request.setAttribute("msgAccess", "pw가 틀립니다.");
		}
		else {//로그인 성공시 
			HttpSession session=request.getSession();
			session.setAttribute("id", id);
		}
		fw.setPath("main.jsp");
		fw.setRedirect(false);
		return fw;
	}
	
	
	
	

}
