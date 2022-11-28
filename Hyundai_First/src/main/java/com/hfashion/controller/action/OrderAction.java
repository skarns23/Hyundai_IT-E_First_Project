package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.service.OrderFormService;
import com.hfashion.vo.CartDTO;
import com.hfashion.vo.OrderDTO;
import com.hfashion.vo.OrderFormDTO;



/*
 * 작성자 함세강
 * */
public class OrderAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getMethod().equals("GET")) {
			System.out.println("GET");
			

			String url = "product/order.jsp";
			
			String loginId = "ham";//세션 받아와서 아이디로 처리하는 과정 필요
			
			OrderFormService orderFormService = OrderFormService.getInstance();
			
			OrderFormDTO orderFormDTO = orderFormService.getOrderForm(loginId); 
			
			request.setAttribute("orderInfo", orderFormDTO);
			
			List<CartDTO> list = null;
			list = orderFormDTO.getOrderList();
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}
		
		
		if(request.getMethod().equals("POST")) {
			String url = "dataTest.jsp";
			
			System.out.println("POST");
			String postCode = request.getParameter("postCode");
			String address = request.getParameter("address");
			
			String userId = "ham"; //세션꺼 꺼내오는 과정 필요
			
			OrderDTO dto = new OrderDTO(postCode,address,userId);
			
			
			
		}
		
		
		
		
	}

}
