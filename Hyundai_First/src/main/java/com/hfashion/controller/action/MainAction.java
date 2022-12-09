package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dto.MainItemDTO;
import com.hfashion.dto.ReviewDTO;
import com.hfashion.service.MainFormService;


/*
 * 함세강, 윤태영 작성
 */
public class MainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/main.jsp";
		
		List<MainItemDTO> list = null;
		List<ReviewDTO> bestreviewList = null;
		
		MainFormService mainFormService = MainFormService.getInstance();
		
		list = mainFormService.getMainFormItem();		//베스트 상품 데이터들이 있는 리스트 
		bestreviewList = mainFormService.getMainBestReview();	

		request.setAttribute("bestItemList", list);	    //리스트를 "bestItemList"요청으로 설정하기
		request.setAttribute("BestReviewList", bestreviewList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
