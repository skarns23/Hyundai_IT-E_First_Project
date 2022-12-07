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
import com.hfashion.dto.MemberDTO;
import com.hfashion.dto.OrderDTO;

import oracle.sql.DATE;
/*
 *  남승현 작성 
 */
public class MypageFormAction implements Action{
	/*
	 * 기능 : 마이페이지로 전환 시 최근 1달간의 주문 내역을 받아와 띄워주는 기능 
	 * 입력 : 사용자의 아이디, 한달전 날짜, 오늘날짜
	 * 출력 : 한달간의 주문된 주문 내역  
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환
	 * 		  request에 한달간 주문내역을 붙인 뒤 포워딩 시켜 넘겨줌
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "user/mypage/mypage.jsp";
		OrderDAO orderDAO = OrderDAO.getInstance();
		HttpSession session =  request.getSession();
		MemberDTO mVO = (MemberDTO)session.getAttribute("loginUser");
		
		// 한달 전 날짜 지정 
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
		cal.add(Calendar.DATE, 1);
		String end = dateFormat.format(cal.getTime());
		cal.add(Calendar.DATE, -1);
		cal.add(Calendar.MONTH, -1);
		String start = dateFormat.format(cal.getTime());

		// 한달간 주문내역을 받아오는 기능 
		List<OrderDTO> orderList = orderDAO.getOrderList(mVO.getUser_id(), start, end);
		request.setAttribute("orderList", orderList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);
		
		
	}

}
