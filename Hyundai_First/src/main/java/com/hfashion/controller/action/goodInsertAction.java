package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.hfashion.dao.GoodDAO;
import com.hfashion.vo.MemberVO;

public class goodInsertAction implements Action {

	
	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String url = ; 
		
	  
	    GoodDAO gDAO=GoodDAO.getInstance();//좋아요DAO 인스턴스 생성
	  
	    HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		String user_id = memberVO.getUser_id();// 유저 아이디 받기	
	    
		//System.out.println("유저아이디:"+user_id);
	    String r_no = request.getParameter("r_no");
		
	    int result = gDAO.goodinsert(r_no,user_id); // 리뷰 넘버와 유저 아이디 넣기
	    
	    int like= gDAO.SelectLike(r_no); // 좋아요 개수 반환
	    int[] arr = {like,result};
	     // System.out.println(like);
	    Gson gson  = new Gson();
	    String value = gson.toJson(arr);
	    
	 
//	    obj.put("like", like); // 좋아요 수 저장("key", value)값으로 저장 해서 전달 
	    System.out.println(value);
//	    response.setContentType("application/x-json; charset=UTF-8");// POST 방식 전송시 한글 깨질 수있음 방지
//	    System.out.println("인서트 액션 작업 완료 전");
	    PrintWriter out = response.getWriter();
	    out.print(value);
	    System.out.println("인서트 액션 작업 완료 후");
	}
}
