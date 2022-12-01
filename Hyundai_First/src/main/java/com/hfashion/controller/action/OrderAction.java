package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.service.OrderFormService;
import com.hfashion.service.OrderService;
import com.hfashion.vo.CartDTO;
import com.hfashion.vo.MemberVO;
import com.hfashion.vo.OrderDTO;
import com.hfashion.vo.OrderFormDTO;




/*
 * 작성자 함세강
 * */
public class OrderAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		if(request.getMethod().equals("GET")) {
			String url = "product/order.jsp";
			
			HttpSession session = request.getSession();
			
			MemberVO memberDTO = (MemberVO)session.getAttribute("loginUser");
			
			OrderFormService orderFormService = OrderFormService.getInstance();
			
			OrderFormDTO orderFormDTO = orderFormService.getOrderForm(memberDTO); 
			
			request.setAttribute("orderInfo", orderFormDTO);
			
			List<CartDTO> list = null;
			list = orderFormDTO.getOrderList();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
		
		
		if(request.getMethod().equals("POST")) {
			String url = "Hfashion?command=orderComplete";
			
			HttpSession session = request.getSession();
			
			MemberVO memberDTO = (MemberVO)session.getAttribute("loginUser");
			
			String postCode = request.getParameter("postCode");
			String address = request.getParameter("address");

			String userId = memberDTO.getUser_id();
			
			OrderDTO dto = new OrderDTO(postCode,address,userId);
			
			OrderService orderService = OrderService.getInstance();
			
			orderService.orderProductServie(dto);
			
			response.sendRedirect(url);
			
		}

	}

}
