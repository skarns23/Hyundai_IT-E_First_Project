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


/*윤태영 작성 좋아요 기능 구현 */
public class GoodInsertAction implements Action {

	
        // 좋아요 테이블에 리뷰번호와 유저아이디를 넣게되면 트리거를 실행시켜 리뷰테이블의 좋아요수 증가	
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	    GoodDAO gDAO=GoodDAO.getInstance();//좋아요DAO 인스턴스 생성
	  
	    HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		String user_id = memberVO.getUser_id();// 유저 아이디 받기	
	    String r_no = request.getParameter("r_no");
		
	    int result = gDAO.goodinsert(r_no,user_id); // 리뷰 넘버와 유저 아이디 넣기
	    
	    int like= gDAO.SelectLike(r_no); // 좋아요 개수 반환
	    int[] arr = {like,result};
	    Gson gson  = new Gson();        
	    String value = gson.toJson(arr);   // JSON 형식의 문자열로 반환
	    
	    PrintWriter out = response.getWriter();
	    out.print(value);

	}
}
