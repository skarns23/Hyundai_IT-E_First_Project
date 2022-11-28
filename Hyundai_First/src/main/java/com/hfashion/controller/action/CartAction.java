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
		
	    
		CartDAO cartDAO = CartDAO.getInstance();
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		
		if(request.getMethod().equals("GET")) {
			String url = "product/cart.jsp";
			
			System.out.println("카트 GET 요청");
			List<CartVO> cList = cartDAO.selectCart(user_id);
			
			request.setAttribute("cList", cList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
		if(request.getMethod().equals("POST")) {
			String url = "Hfashion?command=cart";
			
			System.out.println("카트 POST 요청");
			String pro_no = request.getParameter("pro_no");
			String size_name = request.getParameter("size_name");
			int cart_amount = Integer.parseInt(request.getParameter("size_amount"));
			
			CartVO cartVO = new CartVO(pro_no, size_name, cart_amount, user_id);
			cartDAO.insertCart(cartVO);
			
			response.sendRedirect(url);
		}
		
		
		
	}

}
