package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.CartDAO;
import com.hfashion.vo.MemberVO;

public class CartDelAllAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDAO cartDAO = CartDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		
		cartDAO.delAllCart(user_id);
		
	}

}
