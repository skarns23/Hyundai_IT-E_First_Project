package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*윤태영 작성*/
public class ReviewWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="review/reviewWrite.jsp";
		
		
		// 구매 싱픔 이름 리뷰 작성 유무등의 정보를 요청받고 폼액션에서 정보를 가지고 reviewwrite.jsp로 이동 
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