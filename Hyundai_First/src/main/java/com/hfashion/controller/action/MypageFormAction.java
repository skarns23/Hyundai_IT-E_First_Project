package com.hfashion.controller.action;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.OrderDAO;
import com.hfashion.vo.MemberVO;
import com.hfashion.vo.OrderVO;

import oracle.sql.DATE;
/*
 *  남승현 작성 
 */
public class MypageFormAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "user/mypage/mypage.jsp";
		OrderDAO orderDAO = OrderDAO.getInstance();
		HttpSession session =  request.getSession();
		MemberVO mVO = (MemberVO)session.getAttribute("loginUser");
		
		// 한달 전 날짜 지정 
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
		
		String end = dateFormat.format(cal.getTime());
		cal.add(Calendar.MONTH, -1);
		String start = dateFormat.format(cal.getTime());

		System.out.println(start);
		System.out.println(end);
		List<OrderVO> orderList = orderDAO.getOrderList(mVO.getUser_id(), start, end);
		for(OrderVO o : orderList) {
			System.out.println(o);
		}
		request.setAttribute("orderList", orderList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
		
		
	}

}
