package com.hfashion.controller.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.dao.ReviewDAO;
import com.hfashion.vo.MemberVO;
import com.hfashion.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "Hfashion?command=reviewlist";

		// 현재 reviewlist 랑 연결 해놨기 때문에 나중에 마이페이지랑 연결 하면 됨
		ReviewVO RV_VO = new ReviewVO();
		System.out.println("ReviewWriteAction start");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		System.out.println("######");
		System.out.println(request.getParameter("proname"));
		System.out.println("######");

		String user_id = memberVO.getUser_id();

		// 파일 저장 및 전송
		request.setCharacterEncoding("UTF-8");
		MultipartRequest multi = null;
		int maxSize = 10 * 1024 * 1024; // 사진 size//10MB String path="/image"; ServletContext
		String savePath = request.getSession().getServletContext().getRealPath("/images/review"); // 저장 폴더 경로
		try {
			multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy()); // 객체 생성시
																												// 바로 파일
																												// 업로드
																												// // 완료
		} catch (Exception e) {
			e.printStackTrace();
		}
		String fileName = multi.getFilesystemName("filename"); // 파일 이름 받아오기

		String fileFullPath = savePath + File.separator + fileName;// 파일 경로 설정
		// System.out.println(fileFullPath);
		String star = "3";

		System.out.println(multi.getParameter("proname"));
		int r_check = Integer.parseInt(multi.getParameter("r_check"));// 리뷰체크 변수
		String title = multi.getParameter("r_title");
		System.out.println(title);
		String content = multi.getParameter("r_content");
		System.out.println(content);

		// 리뷰 체크 가 1이면 마이페이지 주문 목록으로 돌아감

		System.out.println("#########");
		System.out.println(fileFullPath);
		System.out.println("#########");
		if (r_check == 1) {
			url = "Hfashion?command=mypage";
		} else if (title.isEmpty() || content.isEmpty()) { // 목록 안채웠을때? 다르게 구현 해봐야겠다
			System.out.println("마이페이지로 연결 되었나");
			url = "Hfashion?command=mypage";
		} else {
			RV_VO.setR_title(title);
			RV_VO.setR_content(content);
	        //RV_VO.setR_img(request.getParameter("r_img"));   // 이미지 일단 1값으로 구현			
//			RV_VO.setR_img(fileFullPath); // 이미지 일단 1값으로 구현
			RV_VO.setR_img(fileName); // 이미지 일단 1값으로 구현
			// RV_VO.setR_img(request.getParameter("r_img")); // 이미지 일단 1값으로 구현
//			RV_VO.setR_img(fileFullPath); // 이미지 일단 1값으로 구현
			RV_VO.setWeight(Integer.parseInt(multi.getParameter("weight")));
			RV_VO.setHeight(Integer.parseInt(multi.getParameter("height")));
			RV_VO.setStar_rating(Integer.parseInt(star));
			// RV_VO.setStar_rating(Integer.parseInt(request.getParameter("star_rating")));
			RV_VO.setSize_name(multi.getParameter("size_name"));
//			System.out.println(request.getParameter("size_name"));
			RV_VO.setPro_no(multi.getParameter("pro_no"));
//			System.out.println(request.getParameter("pro_no"));
			RV_VO.setOrder_no(multi.getParameter("order_no"));
			System.out.println("여기까지는 되야해 제발");
//			System.out.println(request.getParameter("order_no"));
			RV_VO.setUser_id(user_id);
			System.out.println(RV_VO.toString());
			ReviewDAO rv_DAO = ReviewDAO.getInstance();
			System.out.println("##########");
			System.out.println("완료");
			rv_DAO.createReview(RV_VO);
		}
		System.out.println("ReviewWriteAction end");
		response.sendRedirect(url); // 리뷰 플러스로 이동 or 마이페이지

	}

}
