package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 남승현 작성 
 */
public class JoinSuccessAction implements Action{
	/*
	 * 기능 : 회원가입 성공 시 전환되는 화면으로 포워딩 
	 * 입력 : 없음
	 * 출력 : 가입성공 화면으로 전환 
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/user/joinsuccess.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
