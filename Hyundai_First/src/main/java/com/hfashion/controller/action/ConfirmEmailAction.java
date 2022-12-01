package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.MemberDAO;

public class ConfirmEmailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDAO mDAO = MemberDAO.getInstance();
		String email = request.getParameter("email");
		int check_email = mDAO.confirmEmail(email);
		Gson gson = new Gson();
		String result = gson.toJson(check_email);
		PrintWriter out = response.getWriter();
		out.print(result);
		System.out.println("ConfirmEmailAction");
		
	}
	
}
