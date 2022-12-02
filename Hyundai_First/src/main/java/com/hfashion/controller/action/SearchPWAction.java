package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.MemberDAO;

public class SearchPWAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_email = request.getParameter("user_email");
		MemberDAO mDAO = MemberDAO.getInstance();
		String result = mDAO.searchPW(user_id, user_name, user_email);
		Gson gson = new Gson();
		String value = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(value);
		
				
	}

}
