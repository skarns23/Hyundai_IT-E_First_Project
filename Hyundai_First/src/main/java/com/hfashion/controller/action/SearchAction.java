package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.MemberDAO;
import com.hfashion.vo.MemberVO;

public class SearchAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/user/viewID.jsp";
		String name = request.getParameter("find_name");
		String email = request.getParameter("find_email");
		String phone = request.getParameter("find_phone");
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberVO member = memberDAO.findID(name, email, phone);
		if(member.getUser_id().length()!=0) {
			request.setAttribute("id", member.getUser_id());
			HttpSession session = request.getSession();
			session.setAttribute("id", member.getUser_id());
			System.out.println(member.getUser_id());
			System.out.println(member.getJoin_date());
			request.setAttribute("join_date", member.getJoin_date());
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
		
		
	}

}
