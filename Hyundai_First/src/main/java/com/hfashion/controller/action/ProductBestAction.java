package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dto.ProductDTO;
import com.hfashion.service.ProductBestService;


/*
 * 함세강 작성
 */
public class ProductBestAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "product/productBestList.jsp";
		
		List<ProductDTO> list = null;
		String gender = "여성";
		ProductBestService productBestService = ProductBestService.getInstance();
		
		list = productBestService.productBestListService(gender);
		//성별을 입력받아서 베스트 상품을 불러오는 서비스 메서드
		
		request.setAttribute("bestInfo", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		
		dispatcher.forward(request, response);
		
	}

}
