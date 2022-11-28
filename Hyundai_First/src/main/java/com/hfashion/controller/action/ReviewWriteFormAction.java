package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="review/reviewWrite.jsp";
		System.out.println("ReviewWriteFormAction : "+request.getParameter("proname"));
		System.out.println("ReviewWriteFormAction : "+request.getParameter("r_check"));
		
		String proname = request.getParameter("proname");
		String r_check = request.getParameter("r_check");
		String orderno = request.getParameter("orderno");
		String prono = request.getParameter("prono");
		String sizename = request.getParameter("sizename");
		request.setAttribute("proname", proname);
		request.setAttribute("r_check", r_check);
		request.setAttribute("orderno", orderno);
		request.setAttribute("prono", prono);
		request.setAttribute("sizename", sizename);
	
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}