package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.service.ProductService;
import com.hfashion.vo.CategoryDTO;
import com.hfashion.vo.ProductDTO;


public class ProductListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "product/productList.jsp";
		ProductService productService = ProductService.getInstance();
		String category = request.getParameter("category");
		CategoryDTO dto = new CategoryDTO(category);
		
		List<ProductDTO> list = productService.productGetListService(dto);
		
		request.setAttribute("productList", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	
	}
}
