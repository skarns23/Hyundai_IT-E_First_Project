package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.dto.ProductDTO;
import com.hfashion.dto.ProductSortDTO;
import com.hfashion.service.ProductService;

/*
 * 함세강 작성
 */
public class ProductSortAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String gender = request.getParameter("gender");
		String category = request.getParameter("category");
		
		List<ProductDTO> list = null;
		ProductSortDTO dto = new ProductSortDTO(gender,category);
		
		ProductService productService = ProductService.getInstance();
		
		
		list = productService.productGetSortList(dto);
		//성별과 카테고리를 담은 객체를 매개변수로 입력하여 정렬된 상품데이터를 가져오는 서비스 메서드
		
		Gson gson = new Gson();
		String value = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(value);

	}

}
