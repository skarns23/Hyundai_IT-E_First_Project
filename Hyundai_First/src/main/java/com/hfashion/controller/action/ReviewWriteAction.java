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

/*윤태영 작성 리뷰 작성 액션*/
public class ReviewWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "Hfashion?command=reviewlist";
		// 리뷰작성시 리뷰 리스트로 연결됨

		ReviewVO RV_VO = new ReviewVO();

		// 리뷰 작성을 위해서는 user id가 필요 - 세션에서 받아옴 
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("loginUser");
		String user_id = memberVO.getUser_id();

		//MultipartRequest 메소드 사용해서 파일 저장 및 전송
		request.setCharacterEncoding("UTF-8");
		MultipartRequest multi = null;
		int maxSize = 10 * 1024 * 1024; // 사진 size//10MB String path="/image"; ServletContext
		String savePath = request.getSession().getServletContext().getRealPath("/images/review"); // 저장 폴더 경로
		try {
			multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy()); // 객체 생성시 바로 파일 업로드 완료
																												
		} catch (Exception e) {
			e.printStackTrace();
		}
		String fileName = multi.getFilesystemName("filename"); // 파일 이름 받아오기
		String fileFullPath = savePath + File.separator + fileName;// 파일 경로 설정
		String star = "3";
		int r_check = Integer.parseInt(multi.getParameter("r_check"));// 리뷰체크 변수
		String title = multi.getParameter("r_title");
		String content = multi.getParameter("r_content");

		// 리뷰 체크 가 1이면 마이페이지 주문 목록으로 돌아감

		if (r_check == 1) { // 리뷰 작성했으면 마이페이지로 이동
			url = "Hfashion?command=mypage";
		} else if (title.isEmpty() || content.isEmpty()) { // 제목이랑 내용 비워놨을때 마이페이지로 이동

			url = "Hfashion?command=mypage";
		} else {
			RV_VO.setR_title(title);
			RV_VO.setR_content(content);
			RV_VO.setR_img(fileName);
			RV_VO.setWeight(Integer.parseInt(multi.getParameter("weight")));
			RV_VO.setHeight(Integer.parseInt(multi.getParameter("height")));
			RV_VO.setStar_rating(Integer.parseInt(star));
			RV_VO.setSize_name(multi.getParameter("size_name"));
			RV_VO.setPro_no(multi.getParameter("pro_no"));
			RV_VO.setOrder_no(multi.getParameter("order_no"));
			RV_VO.setUser_id(user_id);
			ReviewDAO rv_DAO = ReviewDAO.getInstance();
			rv_DAO.createReview(RV_VO);
		}
		response.sendRedirect(url); // 리뷰 플러스로 이동

	}

}
