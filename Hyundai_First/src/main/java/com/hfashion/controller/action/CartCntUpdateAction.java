package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.CartDAO;
import com.hfashion.dto.MemberDTO;

/*
 * 신수진 작성
 * */
public class CartCntUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDAO cartDAO = CartDAO.getInstance();
		
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		String pro_no = request.getParameter("pno");
		String size_name = request.getParameter("size");
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		
		cartDAO.cntUpdateCart(user_id, pro_no, size_name, cnt);
		
	}

}
