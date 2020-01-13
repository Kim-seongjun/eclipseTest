package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ReservationDao;
import bean.Forward;

public class ReservationMM {
	HttpServletRequest request;
	HttpServletResponse response;
	
	
	public ReservationMM(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
	}


	public Forward reservation() {
		Forward fw=new Forward();
		ReservationDao rDao=new ReservationDao();
		HttpSession session=request.getSession();
		String res_id=(String)session.getAttribute("id");
		
		boolean result=rDao.reservation(res_id);
		return fw;
	}
	
	
	
	
	
	
}//class End
