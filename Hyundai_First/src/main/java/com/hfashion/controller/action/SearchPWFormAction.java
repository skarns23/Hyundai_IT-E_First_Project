package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 남승현 작성
 */
public class SearchPWFormAction  implements Action{
	/*
	 * 기능 : 비밀번호 찾기 화면으로 포워딩 기능
	 * 입력 : 없음
	 * 출력 : 비밀번호 찾기 화면으로 전환  
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/user/searchPW.jsp";
		RequestDispatcher requestDispatcher =request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
	}

}
