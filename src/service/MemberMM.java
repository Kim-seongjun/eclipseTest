package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.MemberDao;
import bean.Forward;
import bean.Member;
import bean.Pet;
import bean.PetApply;

public class MemberMM {
	HttpServletRequest request;
	HttpServletResponse response;
	
	
	public MemberMM(HttpServletRequest request, HttpServletResponse response) {
		this.request=request;
		this.response=response;
	}


	public Forward access() {
		Forward fw=new Forward();
		String id=request.getParameter("id");
		System.out.println("id="+id);
		String pw=request.getParameter("pw");
		System.out.println("pw="+pw);
		MemberDao mDao=new MemberDao();
		int result=mDao.access(id,pw);	//1:성공, -1:id부재,  0:pw부재
		mDao.close();
		if(result==-1) {
			System.out.println("id가 존재하지 않아");
			request.setAttribute("msgAccess", "id존재하지 않아요!");
		}
		else if(result==0){
			System.out.println("pw가 틀렸어");
			request.setAttribute("msgAccess", "pw가 틀립니다.");
		}
		else {//로그인 성공시 
			HttpSession session=request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("admin", makeHtml());
		}
		
		fw.setPath("main.jsp");
		fw.setRedirect(false);
		return fw;
	}


	private Object makeHtml() {
		StringBuilder sb=new StringBuilder();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id"); //로그인한 사람의 아이디를 꺼냄
		if(id.equals("admin")) {
			sb.append("<input class='admin' type='submit' value='전체회원리스트' formaction='userlist' />");
			sb.append("<input class='admin' type='submit' value='펫시터지원리스트' formaction='petapplylist' />");
			sb.append("<input class='admin' type='submit' value='블랙리스트' formaction='blacklist' />");
			sb.append("<input class='admin' type='submit' value='질문리스트' formaction='question' />");
				
		}
		return sb;
	}


	public Forward joinfrm() {
		Forward fw=new Forward();
		fw.setPath("JoinForm.jsp");
		fw.setRedirect(false);
		return fw;
	}


	public Forward logout() {
		HttpSession session=request.getSession();
		session.invalidate();
		Forward fw=new Forward();
		fw.setPath("main.jsp");
		fw.setRedirect(true);
		return fw;
	}


	public Forward home() {
		Forward fw=new Forward();
		fw.setPath("main.jsp");
		fw.setRedirect(false);
		return fw;
	}


	public Forward petsittersearch() {
		Forward fw=new Forward();
		//Member mb=new Member();
		MemberDao mDao=new MemberDao();
		List<HashMap<String, String>> sList=null;
		String region = request.getParameter("region");
		System.out.println(region);
		System.out.println("-----------------asd");
		if(region == null) {
			sList=mDao.petsittersearch();
		}
		else
		sList=mDao.petsittersearch(region);
		for(int i=0; i<sList.size();i++) {
			System.out.println(i+"번째 sList = " + sList.get(i));
			System.out.println("-----------------");
		}
		Gson g = new Gson();
		String r = g.toJson(sList);
		System.out.println(r);
		request.setAttribute("json_search" , r);
		
		//mb=mDao.petsittersearch();
		fw.setPath("petsittersearch.jsp");
		fw.setRedirect(false);
		return fw;
	}


	public Forward memberjoin() {
		Forward fw=new Forward();
		Member mb=new Member();
	      mb.setId(request.getParameter("id"));
	      System.out.println("ID "+request.getParameter("id"));
	      mb.setPw(request.getParameter("pw"));
	      System.out.println("PW "+request.getParameter("pw"));
	      mb.setName(request.getParameter("name"));	 
	      System.out.println("이름 "+request.getParameter("name"));
	      
	      mb.setGender(request.getParameter("gender"));	      	 
	      System.out.println("성별 "+request.getParameter("gender"));
	      
	      mb.setBirth(request.getParameter("birth"));	      
	      System.out.println("생일 "+request.getParameter("birth"));
	      
	      mb.setTel(request.getParameter("tel"));
	      System.out.println("전화번호 "+request.getParameter("tel"));
	      mb.setMail(request.getParameter("mail1")+"@"+request.getParameter("mail2"));
	      System.out.println("이메일 "+request.getParameter("mail1")+"@"+request.getParameter("mail2"));
	      mb.setAddr(request.getParameter("addr1")+request.getParameter("addr2"));
	      System.out.println("주소 "+request.getParameter("addr1")+request.getParameter("addr2"));
	      
	      MemberDao mDao=new MemberDao();
	      boolean result= mDao.memberJoin(mb);
	      mDao.close();
	      if(result) {
	         fw.setPath("main.jsp");
	         fw.setRedirect(true);
	      }else {
	         request.setAttribute("msg", "회원가입 실패");
	         fw.setPath("JoinForm.jsp");
	         fw.setRedirect(false);
	      }
	      return fw;
	}


	public Forward petapply() {
		MemberDao mDao=new MemberDao();
		List<String> sList=null;
		sList=mDao.petapply();
		for(int i=0;i<sList.size();i++) {
		System.out.println(i+"번째 sList = "+sList.get(i));
		
		}
		
		Gson g = new Gson();
		String r = g.toJson(sList);
		System.out.println("===========");
		System.out.println(r);
		request.setAttribute("jsontest" , r);
		Forward fw=new Forward();
		fw.setPath("petapply.jsp");
        fw.setRedirect(false);
		return fw;
	}


	public Forward insetPetApply() {
		Forward fw=new Forward();
		System.out.println("제목 : "+request.getParameter("title"));		
		System.out.println("내용 : "+request.getParameter("cont"));	
		System.out.println("단가 : "+request.getParameter("price"));
		System.out.println("이미지 : "+request.getParameter("imgFile"));
		System.out.println("질문1 : "+request.getParameter("questions1"));
		System.out.println("질문2 : "+request.getParameter("questions2"));
		System.out.println("질문3 : "+request.getParameter("questions3"));
		System.out.println("질문4 : "+request.getParameter("questions4"));
		System.out.println("질문5 : "+request.getParameter("questions5"));
		System.out.println("질문6 : "+request.getParameter("questions6"));
		System.out.println("질문7 : "+request.getParameter("questions7"));
			
		HttpSession session=request.getSession();
		String id=session.getAttribute("id").toString();
		System.out.println("id="+id);
		PetApply pa=new PetApply();		
		pa.setId(session.getAttribute("id").toString());
		pa.setTitle(request.getParameter("title"));
		pa.setCont(request.getParameter("cont"));
		pa.setPrice(request.getParameter("price"));
		pa.setImgFile(request.getParameter("imgFile"));
		pa.setQuestions1(request.getParameter("questions1"));
		pa.setQuestions2(request.getParameter("questions2"));
		pa.setQuestions3(request.getParameter("questions3"));
		pa.setQuestions4(request.getParameter("questions4"));
		pa.setQuestions5(request.getParameter("questions5"));
		pa.setQuestions6(request.getParameter("questions6"));
		pa.setQuestions7(request.getParameter("questions7"));
		MemberDao mDao=new MemberDao();
	
	    boolean result= mDao.insetPetApply(pa);
	    mDao.close();
	    if(result) {
	         fw.setPath("main.jsp");
	         fw.setRedirect(true);
	      }else {
	        System.out.println("지원포워딩 실패");
	         fw.setPath("petapply.jsp");
	         fw.setRedirect(false);
	      }
		return fw;
	}


	public Forward updateUser() {
		Forward fw=new Forward();
		MemberDao mDao=new MemberDao();
		HttpSession session=request.getSession();
		String id=session.getAttribute("id").toString();
		System.out.println("회원타입 변경 id="+id);
		boolean result= mDao.updateUser(id);
		mDao.close();
		 if(result) {
	         fw.setPath("main.jsp");
	         fw.setRedirect(true);
	      }else {
	         fw.setPath("petapply.jsp");
	         fw.setRedirect(false);
	      }
		return fw;
	}


	public Forward petinsert() {
		Forward fw=new Forward();
		MemberDao mDao=new MemberDao();
		Pet p=new Pet();
		HttpSession session=request.getSession();
		session.getAttribute("id").toString();
		p.setId(session.getAttribute("id").toString());
		p.setPet_name(request.getParameter("pet_name"));
		p.setPet_gender(request.getParameter("pet_gender"));
		p.setPet_type(request.getParameter("pet_type"));
		p.setPer_request(request.getParameter("pet_request"));
		System.out.println(p.getId());
		System.out.println(request.getParameter("pet_name"));
		System.out.println(request.getParameter("pet_gender"));
		System.out.println(request.getParameter("pet_type"));
		System.out.println(request.getParameter("pet_request"));
		System.out.println();
		boolean result= mDao.petinsert(p);
		mDao.close();
		 if(result) {
	         fw.setPath("main.jsp");
	         fw.setRedirect(true);
	      }else {
	         fw.setPath("petinsert.jsp");
	         fw.setRedirect(false);
	      }
		return fw;
	}


	public Forward petinsertshow() {	//반려견 등록 페이지
		Forward fw=new Forward();
		fw.setPath("petinsert.jsp");
        fw.setRedirect(false);
		return fw;
	}


	public Forward petsitterdetail() {
		Forward fw=new Forward();
		MemberDao mDao=new MemberDao();
		String petsitter_id=request.getParameter("petsitter_id");
		System.out.println("petsitter_id="+petsitter_id);
		HashMap<String, String> hm=mDao.petsitterdetail(petsitter_id);
		Gson g = new Gson();
		String r = g.toJson(hm);
		request.setAttribute("json_detail" , r);
		
		HttpSession session=request.getSession();
		String id=session.getAttribute("id").toString();
		System.out.println("idid="+id);
		
		List<HashMap<String, String>> hmm=mDao.pet(id);
		
		String pet=g.toJson(hmm);
		request.setAttribute("json_pet", pet);
		
		fw.setPath("petsittersearchdetail.jsp");
        fw.setRedirect(false);
		return fw;
	}




	public String idcheck() {
		System.out.println("들어오세요");
		String id=request.getParameter("$id");
		System.out.println("종복검사할 ID = "+id);
		MemberDao mDao=new MemberDao();
		int cnt= mDao.idcheck(id);
		
		String json=new Gson().toJson(cnt);
		System.out.println("json="+json);
		
		return json;
	}	

}
