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
		res.setRes_no(request.getParameter("pet_no"));		
		res.setRes_date_fr(request.getParameter("start_day"));
		res.setRes_date_to(request.getParameter("end_day"));
		res.setRes_price(request.getParameter("price"));
		res.setRes_addr(request.getParameter("sit_addr"));
		
		System.out.println("예약자 id는 "+session.getAttribute("id").toString());
		System.out.println("펫시터 id는 "+request.getParameter("sit_id"));
		System.out.println("펫넘버는 "+request.getParameter("pet_no"));
		System.out.println("시작일는 "+request.getParameter("start_day"));
		System.out.println("종료일는 "+request.getParameter("end_day"));
		System.out.println("가격는 "+request.getParameter("price"));
		System.out.println("주소는 "+request.getParameter("sit_addr"));
		
		boolean result=rDao.reservation(res);
		
		if(result) {
			fw.setPath("rescomplete.jsp");
			fw.setRedirect(false);
		}
		else {
			fw.setPath("petsittersearchdetail.jsp");
			fw.setRedirect(false);
		}
		
		return fw;
	}


	public Forward rescheck() {		//예약 확인
		Forward fw=new Forward();
		
		return fw;
	}


	public Forward reviewinsert() {		//리뷰쓰기 
		Forward fw=new Forward();
		ReservationDao rDao=new ReservationDao();
		String ReservationDao=request.getParameter("rev_poient");
		String rev_title=request.getParameter("rev_title");
		String rev_cont=request.getParameter("rev_cont");
		System.out.println("rev_poient="+rev_poient);
		System.out.println("rev_title="+rev_title);
		System.out.println("rev_cont="+rev_cont);
		
		boolean result=rDao.reviewinsert();
		rDao.close();
		if(result) {
			fw.setPath("main.jsp");
			fw.setRedirect(false);
		}
		/*
		 * else { fw.setPath(); fw.setRedirect(false); }
		 */
		
		
		return fw;
	}
	
	
	
	
	
	
}//class End
