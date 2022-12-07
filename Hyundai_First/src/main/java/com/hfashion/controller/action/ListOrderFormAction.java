package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 남승현 작성
 */
public class ListOrderFormAction implements Action{
	/*
	 * 기능 : 마이페이지내의 주문내역 클릭 시 포워딩 
	 * 입력 : 없음
	 * 출력 : 마이페이지내 주문내역 조회 페이지로 이동   
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/user/mypage/listOrder.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
	}
	
}
