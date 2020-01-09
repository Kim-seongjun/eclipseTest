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

<<<<<<< HEAD
@WebServlet("/access,/petsittersearch,/joinfrm")
//깃데스크탑 테스트입니다.
=======
@WebServlet({"/home","/access","/petsittersearch","/joinfrm","/logout","/memberjoin","/petapply"})

>>>>>>> d3454525f06e30fc29080e04a6ec028ba59b2a3e
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
	 
		
	case "/petsittersearch":   //펫시터 찾기
		fw=mm.petsittersearch();
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
