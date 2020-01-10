package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.AdminDao;
import DAO.MemberDao;
import bean.Forward;
import bean.PetApply;

public class AdminMM {
	HttpServletRequest request;
	HttpServletResponse response;
	
	
	public AdminMM(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
	}


	public Forward petapplylist() {
		Forward fw=new Forward();
		AdminDao aDao=new AdminDao();
		PetApply pa=new PetApply();
		List<PetApply> plist=aDao.petapplylist();
		
		/*
		 * for(int i=0;i<plist.size();i++) {
		 * System.out.println(i+"번째 pList = "+plist.get(i)); }
		 */
		Gson g = new Gson();
		String r = g.toJson(plist);
		System.out.println("===========");
		System.out.println(r);
		request.setAttribute("json_plist" , r);
		if(plist.size()>=0) {
		fw.setPath("petapplylist.jsp");
        fw.setRedirect(false);
		}
		else {
			System.out.println("지원서 불러오기 실패");
			fw.setPath("main.jsp");
	        fw.setRedirect(false);
		}
		return fw;
	}


	public Forward blackList() {
		Forward fw=new Forward();
		fw.setPath("blacklist.jsp");
        fw.setRedirect(false);
		return fw;
	}


	public Forward userlist() {
		Forward fw=new Forward();
		fw.setPath("userlist.jsp");
        fw.setRedirect(false);
		return fw;
	}


	public Forward petsitterappr() {
		Forward fw=new Forward();
		String id=request.getParameter("sit_id");
		System.out.println("승인할 id = "+id);
		AdminDao aDao=new AdminDao();
		boolean result= aDao.petsitterppr(id);
		aDao.close();
		 if(result) {
	         fw.setPath("petapplylist");
	         fw.setRedirect(false);
	      }else {
	         fw.setPath("petapplylist.jsp");
	         fw.setRedirect(false);
	      }
		return fw;
	}


	public Forward deletePetApply() {
		Forward fw=new Forward();
		String id=request.getParameter("sit_id");
		System.out.println("지원삭제할 id = "+id);
		AdminDao aDao=new AdminDao();
		boolean result= aDao.deletePetApply(id);
		aDao.close();
		 if(result) {
	         fw.setPath("petapplylist");
	         fw.setRedirect(false);
	      }else {
	         fw.setPath("petapplylist.jsp");
	         fw.setRedirect(false);
	      }
		return fw;
	}


	public Forward rejectedUser() {
		Forward fw=new Forward();
		AdminDao aDao=new AdminDao();
		String id=request.getParameter("sit_id");
		System.out.println("거절할회원타입 변경 id="+id);
		boolean result= aDao.rejectedUser(id);
		aDao.close();
		 if(result) {
	         fw.setPath("petapplylist");
	         fw.setRedirect(true);
	      }else {
	         fw.setPath("petapplylist.jsp");
	         fw.setRedirect(false);
	      }
		return fw;
	}

}
