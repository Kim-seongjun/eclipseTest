package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ReservationDao;
import bean.Forward;
import bean.Reservation;

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
		Reservation res=new Reservation();
		HttpSession session=request.getSession();
		
		res.setUs_id(session.getAttribute("id").toString());
		res.setSitter_id(request.getParameter("sit_id"));
		res.setRes_no(request.getParameter("pet_num"));
		
		res.setRes_date_fr(request.getParameter("start_day"));
		res.setRes_date_to(request.getParameter("end_day"));
		res.setRes_price(request.getParameter("price"));
		res.setRes_price(request.getParameter("sit_addr"));
		
		
		boolean result=rDao.reservation(res);
		return fw;
	}
	
	
	
	
	
	
}//class End
