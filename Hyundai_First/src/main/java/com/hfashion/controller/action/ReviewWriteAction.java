package com.hfashion.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.ReviewDAO;
import com.hfashion.vo.ReviewVO;

public class ReviewWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="Hfashion?command=reviewlist";
	    //현재 reviewlist 랑 연결 해놨기 때문에 나중에 마이페이지랑 연결 하면 됨
		 
	     ReviewVO RV_VO=new ReviewVO();
	     
	     String img="";
	    int r_check=Integer.parseInt(request.getParameter("r_check"));// 변수 설정     
	    String r_content=request.getParameter("r_content");
	    String r_title=request.getParameter("r_title");
	     // 리뷰 체크 가 1이면  마이페이지 주문 목록으로 돌아감
	     if(r_check== 1) {
	    	// url="Hfashion?command=마이페이지 주문 목록"; //이거 url 바꿔야함
	     }else if(r_title==null ||r_content==null) {  // 목록 안채웠을때?  다르게 구현 해봐야겠다
	    	// url="Hfashion?command=마이페이지 주문 목록"; //이거 url 바꿔야함
	     }
	     else {
	     
	     RV_VO.setR_title(request.getParameter("r_title"));   
	     RV_VO.setR_content(request.getParameter("r_content"));   
//	     RV_VO.setR_img(request.getParameter("r_img"));   // 이미지 일단 1값으로 구현
	     RV_VO.setR_img(request.getParameter(img));   // 이미지 일단 1값으로 구현
	     RV_VO.setWeight(Integer.parseInt(request.getParameter("weight")));   
	     RV_VO.setHeight(Integer.parseInt(request.getParameter("height")));   
	     RV_VO.setStar_rating(Integer.parseInt(request.getParameter("star_rating")));   
			/*
			 * RV_VO.setSize_name(request.getParameter("size_name"));
			 * RV_VO.setPro_no(request.getParameter("pro_no"));
			 * RV_VO.setOrder_no(request.getParameter("order_no"));
			 * RV_VO.setUser_id(request.getParameter("user_no"));
			 */ // 변수이름 확인 하고 reviewwrite.jsp 단에 변수 받아 와야한다. 
	     
	     
	     ReviewDAO rv_DAO=ReviewDAO.getInstance();
	     rv_DAO.createReview(RV_VO);	
	     } 
	     response.sendRedirect(url); //리뷰 플러스로 이동 or 마이페이지
		
	}
	
}
