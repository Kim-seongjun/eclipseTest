package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		pa=aDao.petapplylist();
		return fw;
	}


	public Forward blackList() {
		// TODO Auto-generated method stub
		return null;
	}


	public Forward userlist() {
		// TODO Auto-generated method stub
		return null;
	}

}
