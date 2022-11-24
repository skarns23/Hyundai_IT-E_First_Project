package com.hfashion.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.controller.action.Action;

@WebServlet("/Hfashion")
public class HfashionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청시 보낸 파라미터 command 값을 얻어옴
		String command = request.getParameter("command");
		// command 확인
		System.out.println("HfashionServlet에서 요청을 받음을 확인 : " + command);

		ActionFactory af = ActionFactory.getInstance();
		Action action = af.getAction(command);
		
		if(action != null) {
			action.execute(request, response);
		}
	}
}
