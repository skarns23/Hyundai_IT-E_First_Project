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

/*
 * 함세강 작성
 */
public class ProductListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "product/productList.jsp";
		ProductService productService = ProductService.getInstance();
		String category = request.getParameter("category");
		CategoryDTO dto = new CategoryDTO(category);
		
		List<ProductDTO> list = productService.productGetListService(dto);
		//카테고리 번호를 매개변수로 입력 받아서 상품 목록을 가져오는 메서드 
		
		request.setAttribute("productList", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	
	}
}
