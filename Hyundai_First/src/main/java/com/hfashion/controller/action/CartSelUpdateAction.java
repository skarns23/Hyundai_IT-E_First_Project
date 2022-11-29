package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.CartDAO;
import com.hfashion.vo.MemberVO;

public class CartSelUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		CartDAO cartDAO = CartDAO.getInstance();
		
		String pro_no = request.getParameter("pno");
		String size_name = request.getParameter("size");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		
		System.out.println("update한다!!" + pro_no + " " + size_name + " " + user_id);
		cartDAO.selUpdateCart(pro_no, size_name, user_id);
		
	}

}
