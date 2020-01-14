package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Forward;
import service.AdminMM;
import service.MemberMM;
import service.ReservationMM;

/**
 * Servlet implementation class Home
 */

@WebServlet({"/home","/access","/petsittersearch","/joinfrm","/logout",
			"/memberjoin","/petapply","/insetpetapply","/petapplylist",
			"/blacklist","/userlist","/petsitterappr","/deleteapply",
			"/petinsert","/petinsertshow","/petsitterdetail",
			"/reservation","/petsitter_reg","/black","/white",
			"/rescheck","/reviewinsert","/question"})


public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	String cmd=request.getServletPath();
	System.out.println("cmd = "+cmd);
	Forward fw=new Forward();
	MemberMM mm=new MemberMM(request,response);
	AdminMM am=new AdminMM(request,response);
	ReservationMM rm=new ReservationMM(request,response);
	switch(cmd) {
	case "/home":   //메인으로 가기
		fw=mm.home();
		break;
		
	case "/access":   //로그인
		fw=mm.access();
		break;
		
	case "/logout":   //로그아웃
		fw=mm.logout();
		break;
		
	case "/joinfrm":    //회원가입으로 이동 
		fw=mm.joinfrm();
		break;
	
	case "/memberjoin":    //회원가입하기
		fw=mm.memberjoin();
		break;
		
	case "/petapply":       //펫시터지원서
		fw=mm.petapply();
		break;

	case "/insetpetapply":  //펫시터지원서 신청
		fw=mm.insetPetApply();
		fw=mm.updateUser();
		break;
	 
	case "/petapplylist": //펫시터지원회원 리스트
		fw=am.petapplylist();
		break;
		
	case "/petsitterappr":	
		fw=am.petsitterappr();	  //펫시터 승인하기
	//	fw=am.deletePetApply();   //펫시터지원 삭제
		break;
	
	case "/deleteapply":
		fw=am.deletePetApply();   //펫시터지원 삭제(거절)
		fw=am.rejectedUser();		//거절한 회원타입을 1에서 0으로 변경
		break;
		
	case "/petsittersearch":   //펫시터 찾기
		fw=mm.petsittersearch();
		break;
				
	case "/petsitterdetail":
		fw=mm.petsitterdetail();  //펫시터상세 및 예약페이지
		break;
	
	case "/blacklist":
		fw=am.blackList();  //블랙리스트
		break;
		
	case "/black":
		fw=am.black();
		break;
		
	case "/petinsertshow":
		fw=mm.petinsertshow();
		break;
		
	case "/userlist":		//전체회원 리스트
		fw=am.userlist();
		break;
	case "/petinsert":
		fw=mm.petinsert();   //반려견 등록
		break;
		
	case "/reservation":
		fw=rm.reservation(); //예약
		break;
	
	case "/white":	//블랙리스트 해제
		fw=am.white();
		break;
		
	case "/reviewinsert":
		fw=rm.reviewinsert();	//리뷰쓰기
		break;
	
	case "/rescheck":
		fw=rm.rescheck();	//예약 확인
		break;
		
	case "/question":
		fw=am.question();	//질문수정
		break;
	
	}
	if(fw!=null) {
		if(fw.isRedirect()) {
			response.sendRedirect(fw.getPath());
		}
		else {
			RequestDispatcher dis=request.getRequestDispatcher(fw.getPath());
			dis.forward(request, response);
		}
	}
	
	
	
	}
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
