package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.MemberDAO;

public class ConfirmIDAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("userId");
		PrintWriter out = response.getWriter();
		MemberDAO memberDAO = MemberDAO.getInstance();
		int result = memberDAO.confirmID(userId)?1:0;
		
		if(result==1) {
			System.out.println("이미 존재하는 아이디입니다.");
		}else {
			System.out.println("존재하지 않는 아이디입니다.");
		}
		
		out.write(result+"");
		
	}

}
