package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dao.OrderDAO;

public class CancleOrderAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_id = request.getParameter("user_id");
		String order_no = request.getParameter("order_no");
		String pro_no = request.getParameter("pro_no");
		String pro_size = request.getParameter("pro_size");
		OrderDAO oDAO = OrderDAO.getInstance();
		int result = oDAO.cancleOrder(order_no, user_id, pro_no, pro_size);
		Gson gson = new Gson();
		String val = gson.toJson(result);
		PrintWriter out = response.getWriter();
		out.print(val);
		System.out.println(val);
		
	}
	
	

}
