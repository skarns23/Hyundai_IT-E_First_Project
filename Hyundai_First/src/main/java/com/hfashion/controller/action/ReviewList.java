package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewList implements Action{
	@Override
	   public void execute(HttpServletRequest request, HttpServletResponse response)
			      throws ServletException, IOException {
			    String url="Hfashion?command=reviewlist";
			    
			    String r_no=request.getParameter("R_no");
			  
//			    ArrayList<ReviewVO> reviewDAO=ReviewDAO.getInstance();
//			    ReviewVO ReviewVO= reviewDAO.ReviewList(r_no);
//			    
//			    request.setAttribute("ReviewVO", ReviewVO);
//			    
			    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			    dispatcher.forward(request, response);
			   
			 
			    
		
			  
	}
}
