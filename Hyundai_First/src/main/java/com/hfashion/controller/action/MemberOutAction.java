package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hfashion.dao.MemberDAO;
import com.hfashion.vo.MemberVO;

public class MemberOutAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDAO mVO = MemberDAO.getInstance();
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("loginUser");
		System.out.println("mypage_sucession로 들어옴");
		int result = mVO.secessionMember(memberVO.getUser_id());
		if(result == 1) {
			request.getSession().invalidate();
		}
		Gson gson = new Gson();
		String value = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(value);
		System.out.println(value);
	}

}
