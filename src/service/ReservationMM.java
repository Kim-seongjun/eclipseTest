package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Forward;

public class ReservationMM {
	HttpServletRequest request;
	HttpServletResponse response;
	
	
	public ReservationMM(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
	}


	public Forward reservation() {
		
		return null;
	}
	
	
	
	
	
	
}//class End
