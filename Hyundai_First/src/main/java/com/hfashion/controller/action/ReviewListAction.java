package com.hfashion.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.ReviewDAO;
import com.hfashion.vo.ReviewVO;

/* 윤태영 작성 리뷰플러스의 베스트 리뷰와 일반 리뷰 출력 액션*/

public class ReviewListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "review/reviewList.jsp";
        //리뷰 리스트 jsp 로 연결
		
		
		ReviewDAO reviewDAO = ReviewDAO.getInstance();
		ReviewDAO bestreviewDAO = ReviewDAO.getInstance();

		//reviewdao에서 reviewlist와 bestreviewlist 메소드를 실행후 값 저장
		ArrayList<ReviewVO> reviewList = reviewDAO.ReviewList();
		ArrayList<ReviewVO> bestreviewList = bestreviewDAO.BestReviewList();

		request.setAttribute("BestReviewList", bestreviewList);
		request.setAttribute("ReviewList", reviewList);
		// 변수 이름 설정 - jsp에서 사용할 변수 이름
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
}