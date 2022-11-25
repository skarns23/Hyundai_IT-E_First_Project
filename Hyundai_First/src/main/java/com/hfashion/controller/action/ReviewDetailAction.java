package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.ReviewDAO;
import com.hfashion.vo.ReviewVO;

public class ReviewDetailAction implements Action{

	@Override
   public void execute(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		    String url="Hfashion?command=reviewdetail";
		    
		    String r_no=request.getParameter("R_no");
		    
		    ReviewDAO reviewDAO=ReviewDAO.getInstance();
		    ReviewVO ReviewVO= reviewDAO.selectReview(r_no);
		    
		    request.setAttribute("ReviewVO", ReviewVO);
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		    dispatcher.forward(request, response);
		   
		 
		    
	
		  }
}




