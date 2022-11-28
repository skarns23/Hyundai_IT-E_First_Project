package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.MemberDAO;
import com.hfashion.vo.MemberVO;

public class LoginAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "user/login_fail.jsp";
		HttpSession session = request.getSession();
		MemberDAO memberDAO = MemberDAO.getInstance();
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		System.out.println(id+", "+pw);
		MemberVO member = memberDAO.loginMember(id, pw);
		String redirectURL = (String)session.getAttribute("redirectURL");
		System.out.println(member);
		if(member!=null) {
			url = "Hfashion";
			session.removeAttribute("id");
			session.setAttribute("loginUser", member);
		}
		if(redirectURL!=null) {
			
			url = "Hfashion?command="+redirectURL;
			System.out.println("로그인 후 리다이렉트 URL"+url);
			session.removeAttribute("redirectURL");
		}
		
		
		response.sendRedirect(url);
		
		
	}

}
