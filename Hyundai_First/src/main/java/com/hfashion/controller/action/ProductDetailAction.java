package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.ProductDAO;
import com.hfashion.vo.ImgVO;
import com.hfashion.vo.ProductDTO;
import com.hfashion.vo.SizeVO;

public class ProductDetailAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "product/productDetail.jsp";	
		
		ProductDAO productDAO = ProductDAO.getInstance();
		
		String pro_no = request.getParameter("pno");
		ProductDTO pVO = productDAO.productDetail(pro_no);
		pVO.setPro_no(pro_no);
		List<SizeVO> sList = productDAO.productDetailSize(pro_no);
		List<ImgVO> imgList = productDAO.productDetailImg(pro_no);
		
		request.setAttribute("pVO", pVO);
		request.setAttribute("sList", sList);
		request.setAttribute("imgList", imgList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
