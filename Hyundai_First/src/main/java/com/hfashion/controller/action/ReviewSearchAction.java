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

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ReviewDAO rvDAO = ReviewDAO.getInstance();
		String pro_no = request.getParameter("pro_no");
		System.out.println(pro_no);
		String height = request.getParameter("height");
		System.out.println(height.equals(""));
		int h_val = height.equals("") ? 0 : Integer.parseInt(height);
		String weight = request.getParameter("weight");
		System.out.println(weight.length());
		int w_val = weight.equals("") ? 0 : Integer.parseInt(weight);
		String pro_size = request.getParameter("pro_size");
		List<ReviewDTO> rvList = rvDAO.getOptionalReview(pro_no, h_val, w_val, pro_size);
		System.out.println("ReviewSearchAction start");
		System.out.println(pro_no +", "+h_val+", "+w_val+", "+pro_size);
		for(ReviewDTO rvDTO : rvList) {
			System.out.println(rvDTO);
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String value = gson.toJson(rvList);
		PrintWriter out = response.getWriter();
		out.print(value);
		System.out.println(value);
	}

}
