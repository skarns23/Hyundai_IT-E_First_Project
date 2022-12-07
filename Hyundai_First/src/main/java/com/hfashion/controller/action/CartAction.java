package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.CartDAO;
import com.hfashion.dto.CartDTO;
import com.hfashion.dto.MemberDTO;

/*
 * 신수진 작성
 * */
public class CartAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		// session에 있는 user의 정보를 받아 저장
		HttpSession session = request.getSession();
		MemberDTO member = (MemberDTO) session.getAttribute("loginUser");
		String user_id = member.getUser_id();
		
		// request가 get 방식일 경우
		// 장바구니 리스트 페이지로 이동
		if(request.getMethod().equals("GET")) {
			String url = "product/cart.jsp";
			
			// user의 장바구니에 대한 정보 select 후, 객체 정보 전달
			List<CartDTO> cList = cartDAO.selectCart(user_id);
			
			request.setAttribute("cList", cList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
		// request가 post 방식일 경우
		if(request.getMethod().equals("POST")) {
			
			// 상품 번호, 사이즈, 상품 수량 정보를 받아, 
			// CartVO에 저장 후 장바구니 담는 DAO 실행
			String pro_no = request.getParameter("pro_no");
			String size_name = request.getParameter("size_name");
			int cart_amount = Integer.parseInt(request.getParameter("size_amount"));
			
			CartDTO cartVO = new CartDTO(pro_no, size_name, cart_amount, user_id);
			cartDAO.insertCart(cartVO);
			
		}
		
		
		
	}

}
