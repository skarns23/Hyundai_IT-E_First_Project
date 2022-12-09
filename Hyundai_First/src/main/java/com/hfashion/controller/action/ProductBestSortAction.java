package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dto.ProductDTO;
import com.hfashion.service.ProductBestService;

/*
 * 함세강 작성
 */
public class ProductBestSortAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<ProductDTO> list = null;
		
		String gender = request.getParameter("gender");
		
		ProductBestService pbs = ProductBestService.getInstance();
		
		list = pbs.productBestSortListService(gender);
		//성별을 매개변수로 입력받아서 카테고리 별로 베스트 상품을 가져오기
		
		Gson gson = new Gson();
		String value = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(value);
		
		
	}

}
