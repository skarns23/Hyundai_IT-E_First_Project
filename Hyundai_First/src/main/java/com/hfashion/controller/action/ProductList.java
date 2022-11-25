package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.service.ProductService;
import com.hfashion.vo.ProductTestVO;

public class ProductList implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String url = "product/productTopList.jsp";
		ProductService productService = ProductService.getInstance();
		List<ProductTestVO> list = productService.productGetList();
		
		for (ProductTestVO productTestVO : list) {
			System.out.println(productTestVO.getPro_name());
			System.out.println(productTestVO.getBrand_name());
		}
		
		
		request.setAttribute("productList", list);
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
		 
		
		
		
		
	}

}
