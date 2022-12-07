package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.ReviewDAO;
import com.hfashion.dto.ReviewDTO;



/*윤태영 작성 리뷰 세부 정보*/
public class ReviewDetailAction implements Action{

	@Override
   public void execute(HttpServletRequest request, HttpServletResponse response)
		      throws ServletException, IOException {
		    String url= "review/reviewDetail.jsp";
		   
		    String r_no=request.getParameter("R_no");
            // 리뷰 번호에 맞는 리뷰 가져오기위해서 리뷰 번호를 파리미터로 받음
		    // DAO의 디테일 액션 수핼 
		    ReviewDAO reviewDAO=ReviewDAO.getInstance();
		    ReviewDTO ReviewVo= reviewDAO.Reviewdetail(r_no);
		   
		    request.setAttribute("Rvo", ReviewVo);
		    
		    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		    dispatcher.forward(request, response);
		    
	
		  }
}




