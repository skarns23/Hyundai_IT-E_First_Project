package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.service.MainFormService;
import com.hfashion.vo.MainItemDTO;
import com.hfashion.vo.ReviewVO;


/*
 * 함세강, 윤태영 작성
 */
public class MainAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/main.jsp";
		
		List<MainItemDTO> list = null;
		List<ReviewVO> bestreviewList = null;
		
		MainFormService mainFormService = MainFormService.getInstance();
		
		list = mainFormService.getMainFormItem();
		bestreviewList = mainFormService.getMainBestReview();

		request.setAttribute("bestItemList", list);
		request.setAttribute("BestReviewList", bestreviewList);

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}

}
