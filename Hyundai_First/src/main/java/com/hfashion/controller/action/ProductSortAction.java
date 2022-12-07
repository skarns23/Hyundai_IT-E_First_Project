package com.hfashion.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hfashion.service.ProductService;
import com.hfashion.vo.ProductDTO;
import com.hfashion.vo.ProductSortDTO;

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
		
		for (ProductDTO productDTO : list) {
			String str = productDTO.getPro_name();
			System.out.println(str);
		}
		
		Gson gson = new Gson();
		String value = gson.toJson(list);
		PrintWriter out = response.getWriter();
		out.print(value);

	}

}
