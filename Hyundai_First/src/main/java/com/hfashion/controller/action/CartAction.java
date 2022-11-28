package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.CartDAO;
import com.hfashion.vo.CartVO;
import com.hfashion.vo.MemberVO;

/*
 * 신수진 작성
 * */
public class CartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "product/cart.jsp";
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		List<CartVO> cList = cartDAO.selectCart(user_id);
		
		request.setAttribute("cList", cList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
