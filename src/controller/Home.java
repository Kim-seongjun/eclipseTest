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

@WebServlet({"/home","/access","/petsittersearch","/joinfrm","/logout"})

public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	String cmd=request.getServletPath();
	System.out.println("cmd = "+cmd);
	Forward fw=new Forward();
	MemberMM mm=new MemberMM(request,response);
	
	switch(cmd) {
	case "/home":
		fw=mm.home();
		break;
		
	case "/access":
		fw=mm.access();
		break;
		
	case "/joinfrm":
		fw=mm.joinfrm();
		break;
		
	case "/logout":
		fw=mm.logout();
		break;
		
	case "/petsittersearch":
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
