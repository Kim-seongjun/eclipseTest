package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Forward;
import service.MemberMM;

/**
 * Servlet implementation class Home
 */

@WebServlet({"/home","/access","/petsittersearch","/joinfrm","/logout",
			"/memberjoin","/petapply","/insetpetapply","/petapplylist","/blacklist","/userlist"})


public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	String cmd=request.getServletPath();
	System.out.println("cmd = "+cmd);
	Forward fw=new Forward();
	MemberMM mm=new MemberMM(request,response);
	
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
		fw=mm.petapplylist();
		break;
		
	case "/petsittersearch":   //펫시터 찾기
		fw=mm.petsittersearch();
		break;
	
	case "/blacklist":
		fw=mm.blackList();
		break;
		
	case "/userlist":
		fw=mm.userlist();
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
