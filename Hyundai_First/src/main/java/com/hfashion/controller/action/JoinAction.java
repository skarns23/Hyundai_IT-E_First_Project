package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.MemberDAO;
import com.hfashion.vo.MemberVO;

public class JoinAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "Hfashion?command=joinsuccess";
		MemberDAO memberDAO = MemberDAO.getInstance();
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String email = request.getParameter("user_email");
		String name = request.getParameter("user_name");
		String phone = request.getParameter("user_phone");
		MemberVO member = new MemberVO(id,pw,name,email,phone);
		System.out.println(member);
		boolean result = memberDAO.signUp(member);
		if(!result) {
			url = "Hfashion?command=signup";
		}else {
			HttpSession session =  request.getSession();
			session.setAttribute("id", id);
		}
		response.sendRedirect(url);
		
	}

}
