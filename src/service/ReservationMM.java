package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.ReservationDao;
import bean.Forward;
import bean.Reservation;
import bean.Review;

public class ReservationMM {
	HttpServletRequest request;
	HttpServletResponse response;

	public ReservationMM(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public Forward reservation() {
		Forward fw = new Forward();
		ReservationDao rDao = new ReservationDao();
		Reservation res = new Reservation();
		HttpSession session = request.getSession();

		res.setUs_id(session.getAttribute("id").toString());
		res.setSitter_id(request.getParameter("sit_id"));
		res.setRes_no(request.getParameter("pet_no"));
		res.setRes_date_fr(request.getParameter("start_day"));
		res.setRes_date_to(request.getParameter("end_day"));
		res.setRes_price(request.getParameter("price"));
		res.setRes_addr(request.getParameter("sit_addr"));

		System.out.println("예약자 id는 " + session.getAttribute("id").toString());
		System.out.println("펫시터 id는 " + request.getParameter("sit_id"));
		System.out.println("펫넘버는 " + request.getParameter("pet_no"));
		System.out.println("시작일는 " + request.getParameter("start_day"));
		System.out.println("종료일는 " + request.getParameter("end_day"));
		System.out.println("가격는 " + request.getParameter("price"));
		System.out.println("주소는 " + request.getParameter("sit_addr"));

		boolean result = rDao.reservation(res);

		if (result) {
			fw.setPath("rescomplete.jsp");
			fw.setRedirect(false);
		} else {
			fw.setPath("petsittersearchdetail.jsp");
			fw.setRedirect(false);
		}

		return fw;
	}

	public Forward reviewinsert() { // 리뷰쓰기
		Forward fw = new Forward();
		ReservationDao rDao = new ReservationDao();
		Review rv=new Review();
		
		rv.setRes_no(request.getParameter("res_no"));
		rv.setRes_poient(request.getParameter("rev_poient"));
		rv.setRes_title(request.getParameter("rev_title"));
		rv.setRes_cont(request.getParameter("rev_cont"));

		System.out.println("res_no=" +request.getParameter("res_no"));
		System.out.println("rev_poient=" +request.getParameter("rev_poient"));
		System.out.println("rev_title=" +request.getParameter("rev_title"));
		System.out.println("rev_cont=" +request.getParameter("rev_cont"));

		
		  boolean result=rDao.reviewinsert(rv);
		  rDao.close(); 
		  
		  if(result) {
		  fw.setPath("main.jsp"); 
		  fw.setRedirect(false); 
		  }
		  
		  else { 
			  fw.setPath("review.jsp"); 
			  fw.setRedirect(false);
			  }
		 

		return fw;
	}

	public Forward goreview() {
		Forward fw = new Forward();
		System.out.println("리뷰쓰기페이지로 이동");
		String res_no = request.getParameter("res_no");
		request.setAttribute("res_no", res_no);
		fw.setPath("review.jsp");
		fw.setRedirect(false);
		return fw;
	}

	public Forward reviewshow() {
		Forward fw = new Forward();
		ReservationDao rDao = new ReservationDao();
		String petsitter_id=request.getParameter("petsitter_id");
		System.out.println("petsitter_id="+petsitter_id);	
		List<HashMap<String, String>> hList =rDao.reviewshow(petsitter_id);
		Gson g = new Gson();
		String review = g.toJson(hList);
		
		if(hList!=null) {
			request.setAttribute("json_review",review);
			fw.setPath("petsittersearchdetail.jsp");
			fw.setRedirect(false);
		}
		else {
			fw.setPath("petsittersearch");
			fw.setRedirect(false);		
		}
		return fw;
		
	}

}// class End
