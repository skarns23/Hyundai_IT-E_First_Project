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

public class CartInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/Hfashion?command=cart";
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		String pro_no = request.getParameter("pro_no");
		String size_name = request.getParameter("size_name");
		int cart_amount = Integer.parseInt(request.getParameter("size_amount"));
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		List<CartVO> cList = cartDAO.selectCart(user_id);
		
		CartVO cartVO = new CartVO(pro_no, size_name, cart_amount, user_id);
		System.out.print(pro_no + " " + size_name + " " + cart_amount);
		
		cartDAO.insertCart(cartVO);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	

}
