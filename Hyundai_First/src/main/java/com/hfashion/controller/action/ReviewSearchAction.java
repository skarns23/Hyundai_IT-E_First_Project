package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.hfashion.dao.ReviewDAO;
import com.hfashion.vo.ReviewDTO;
/*
 * 남승현 작성
 */
public class ReviewSearchAction implements Action{
	/*
	 * 기능 : 상품 상세내역내에 키, 체중, 사이즈 옵션에 대한 필터를 통한 리뷰 조회 기능 
	 * 입력 : 키, 체중, 사이즈
	 * 출력 : 정해진 조건에 적합한 리뷰 목록 반환
	 * 기타 : Gson 라이브러리 사용하여 Json 형태로 변환 후 Ajax에 응답 반환
	 *        아무 입력도 없는 경우 처리를 위해 Action에서 값 처리 
	 *        키와 체중의 경우 범위를 입력값-3 ~ 출력값+3으로 설정  
	 */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReviewDAO rvDAO = ReviewDAO.getInstance();
		String pro_no = request.getParameter("pro_no");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		
		// 키와 몸무게 입력값없는 경우 처리 
		int h_val = height.equals("") ? 0 : Integer.parseInt(height);
		int w_val = weight.equals("") ? 0 : Integer.parseInt(weight);
		
		String pro_size = request.getParameter("pro_size");
		List<ReviewDTO> rvList = rvDAO.getOptionalReview(pro_no, h_val, w_val, pro_size);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String value = gson.toJson(rvList);
		PrintWriter out = response.getWriter();
		out.print(value);
	}

}
