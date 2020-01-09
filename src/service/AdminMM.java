package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Forward;

public class AdminMM {
	HttpServletRequest request;
	HttpServletResponse response;
	
	
	public AdminMM(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
	}


	public Forward petapplylist() {
		// TODO Auto-generated method stub
		return null;
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
