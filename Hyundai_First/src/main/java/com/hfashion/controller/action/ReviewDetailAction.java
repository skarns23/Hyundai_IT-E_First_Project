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
		    String url= "review/reviewDetail.jsp";
		    System.out.println("리뷰디테일 액션 수행중");  
		    String r_no=request.getParameter("R_no");
		    System.out.println(r_no);
            System.out.println("값안들어감 ㅋ");
		    ReviewDAO reviewDAO=ReviewDAO.getInstance();
		    ReviewVO ReviewVo= reviewDAO.Reviewdetail(r_no);
		   
		    request.setAttribute("Rvo", ReviewVo);
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		    dispatcher.forward(request, response);
		    
	
		  }
}




