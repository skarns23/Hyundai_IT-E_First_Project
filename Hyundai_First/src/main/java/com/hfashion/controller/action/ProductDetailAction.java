package com.hfashion.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hfashion.dao.ProductDAO;
import com.hfashion.dto.ImgDTO;
import com.hfashion.dto.ProductDTO;
import com.hfashion.dto.SizeDTO;

/*
 * 신수진 작성
 * */
public class ProductDetailAction implements Action {
	
	/*
	 * 기능 : 상품 상세 정보를 조회해 객체를 전송하는 기능
	 * 입력 : 상품 번호
	 * 출력 : 상품에 해당하는 정보를 담은 객체와 상품 사이즈 정보를 담은 List, 상품 이미지를 담은 List
	 * */
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "product/productDetail.jsp";	
		
		ProductDAO productDAO = ProductDAO.getInstance();
		
		String pro_no = request.getParameter("pno");
		ProductDTO pVO = productDAO.productDetail(pro_no);
		pVO.setPro_no(pro_no);
		List<SizeDTO> sList = productDAO.productDetailSize(pro_no);
		List<ImgDTO> imgList = productDAO.productDetailImg(pro_no);
		
		request.setAttribute("pVO", pVO);
		request.setAttribute("sList", sList);
		request.setAttribute("imgList", imgList);
		request.setAttribute("imgSize", imgList.size());
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}

