package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.MemberDAO;

public class ConfirmIDAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("user_id");
		MemberDAO memberDAO = MemberDAO.getInstance();
		int result = memberDAO.confirmID(userId)?0:1;
		System.out.println("확인하는 아이디 : "+userId);
		if(result==1) {
			System.out.println("이미 존재하는 아이디입니다.");
		}else {
			System.out.println("존재하지 않는 아이디입니다.");
		}
		Gson gson = new Gson();
		String value = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(value);
		System.out.println(value);
	}

}
