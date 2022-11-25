package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "Hfashion";
		HttpSession session = request.getSession(false);
		if(session!=null) {
			session.invalidate();
		}
		response.sendRedirect(url);
	}

}
