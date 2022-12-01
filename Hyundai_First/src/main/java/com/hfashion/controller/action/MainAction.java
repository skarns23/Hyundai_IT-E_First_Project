package com.hfashion.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.ReviewDAO;
import com.hfashion.vo.ReviewVO;

public class MainAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/main.jsp";
		
		

	   
		
		
		 ReviewDAO bestreviewDAO=ReviewDAO.getInstance();	     	     
	     ArrayList<ReviewVO> bestreviewList= bestreviewDAO.BestReviewList();	 
	     request.setAttribute("BestReviewList", bestreviewList);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
			
	}

}
