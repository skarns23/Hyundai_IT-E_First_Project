package com.hfashion.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.ReviewDAO;
import com.hfashion.vo.ReviewVO;
// 윤태영 작성 - 헤더 list 연결 수정
public class ReviewListAction implements Action{
	@Override
	   public void execute(HttpServletRequest request, HttpServletResponse response)
			      throws ServletException, IOException {
			   
		      // String url="Hfashion?command=reviewlist";
		       String url = "review/reviewList.jsp";
			    //String r_no=request.getParameter("R_no");
			  //R_no매개변수 받아서 r_no 에 저장
			    
			     ReviewDAO reviewDAO=ReviewDAO.getInstance();
			     ReviewDAO bestreviewDAO=ReviewDAO.getInstance();
			     
			     System.out.println("리뷰리스트 액션 수행중");
			    // reviewdao 객체 생성
			     //ArrayList<ReviewVO> reviewList= reviewDAO.ReviewList(r_no);
			     ArrayList<ReviewVO> reviewList= reviewDAO.ReviewList();
			     ArrayList<ReviewVO> bestreviewList= bestreviewDAO.BestReviewList();
			    // reviewdao의 reviewlist 메소드 실행후 reviewlist에 저장			  
	           		    
			     request.setAttribute("BestReviewList", bestreviewList);
			     request.setAttribute("ReviewList", reviewList);
			    
			   
			    // 변수 이름 설정 -jsp에서 사용할 변수 이름 
			    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			    dispatcher.forward(request, response);
			   
			 
			    
		
			  
	}
}