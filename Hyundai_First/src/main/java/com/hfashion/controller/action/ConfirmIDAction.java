package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.MemberDAO;

public class ConfirmIDAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userId = request.getParameter("user_id");
		MemberDAO memberDAO = MemberDAO.getInstance();
		int result = memberDAO.confirmID(userId)?0:1;
		System.out.println("확인하는 아이디 : "+userId);
		if(result==1 || userId==null || userId.length()<6) {
			System.out.println("사용할 수 없는 아이디입니다.");
		}else {
			System.out.println("사용할 수 있는 아이디입니다.");
		}
		Gson gson = new Gson();
		String value = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(value);
		System.out.println(value);
	}

}
