package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dto.CategoryDTO;
import com.hfashion.dto.ProductDTO;
import com.hfashion.service.ProductService;


public class ProductListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "product/productList.jsp";
		ProductService productService = ProductService.getInstance();
		String category = request.getParameter("category");
		CategoryDTO dto = new CategoryDTO(category);//수정 필요!//설명할 수 없기 때문
		
		List<ProductDTO> list = productService.productGetListService(dto);
		
		request.setAttribute("productList", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	
	}
}
