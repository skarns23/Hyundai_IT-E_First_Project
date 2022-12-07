package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hfashion.dto.ReviewSearchDTO;
import com.hfashion.dto.ReviewDTO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;

import oracle.jdbc.OracleTypes;

/*
 * 윤태영 작성
 */

// 리뷰 dao 작성
public class ReviewDAO {

	private static ReviewDAO RDAO = new ReviewDAO(); // 인스턴스 생성
	private DataSource ds = null;

	public ReviewDAO() {
	}
	
	// 리뷰 생성
	public void createReview(ReviewDTO reviewvo) {
		String insert = "{call review_pack.insert_review(?,?,?,?,?,?,?,?,?,?)}";  // 프로시저 호출
		Connection con = null;

		try {
			con = ConnectionProvider.getConnection();
			CallableStatement cstmt = con.prepareCall(insert);
			cstmt.setString(1, reviewvo.getR_title());
			cstmt.setString(2, reviewvo.getR_content());
			cstmt.setString(3, reviewvo.getR_img());
			cstmt.setInt(4, reviewvo.getWeight());
			cstmt.setInt(5, reviewvo.getHeight());
			cstmt.setInt(6, reviewvo.getStar_rating());
			cstmt.setString(7, reviewvo.getSize_name());
			cstmt.setString(8, reviewvo.getPro_no());
			cstmt.setString(9, reviewvo.getOrder_no());
			cstmt.setString(10, reviewvo.getUser_id());
			cstmt.executeUpdate();  // 쿼리문실행
			JdbcUtil.close(cstmt);
			JdbcUtil.close(con);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 리뷰 상세 정보 -- 리뷰 번호 입력으로 리뷰제목,내용, 이미지등 상세적인 정보를 얻는다
	public ReviewDTO Reviewdetail(String R_no) {
		ReviewDTO review = new ReviewDTO();
		String detail = "{call review_pack.review_detail(?,?)}";

		try {
			Connection con = ConnectionProvider.getConnection();

			CallableStatement cstmt = con.prepareCall(detail);
			cstmt.setString(1, R_no);  
			cstmt.registerOutParameter(2, OracleTypes.CURSOR); // 커서 사용
			cstmt.executeQuery();
			ResultSet rs = (ResultSet) cstmt.getObject(2);

			while (rs.next()) {
				review.setR_title(rs.getString(1));
				review.setR_content(rs.getString(2));
				review.setR_like(rs.getInt(3));
				review.setR_img(rs.getString(4));
				review.setWeight(rs.getInt(5));
				review.setHeight(rs.getInt(6));
				review.setStar_rating(rs.getInt(7));
				review.setSize_name(rs.getString(8));
			}

			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return review;
	}

     // 리뷰 플러스 일반 목록 불러오기	
	public ArrayList<ReviewDTO> ReviewList() {
		ArrayList<ReviewDTO> list = new ArrayList<>();
		String sql = "{call review_pack.review_list(?)}"; // 프로시저 실행
		try {
			Connection con = ConnectionProvider.getConnection();
			CallableStatement cstmt = con.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet rs = (ResultSet) cstmt.getObject(1);
			while (rs.next()) {
				String review_no = rs.getString(1);
				String review_title = rs.getString(2);
				String review_img = rs.getString(3);
				String review_content = rs.getString(4);
				String review_size = rs.getString(5);
				int star_rating = rs.getInt(6);
				String pro_name = rs.getString(7);
				int pro_price = rs.getInt(8);
				String brand_name = rs.getString(9);
				String img_roc = rs.getString(10);
				String pro_gen = rs.getString(11);
				int review_like = rs.getInt(12);
				ReviewDTO rVO = new ReviewDTO();

				rVO.setR_no(review_no);
				rVO.setR_title(review_title);
				rVO.setR_img(review_img);
				rVO.setR_content(review_content);
				rVO.setSize_name(review_size);
				rVO.setStar_rating(star_rating);
				rVO.setPro_name(pro_name);
				rVO.setPro_price(pro_price);
				rVO.setBrand_name(brand_name);
				rVO.setImg_loc(img_roc);
				rVO.setPro_gen(pro_gen);
				rVO.setR_like(review_like);
				list.add(rVO);
			}

			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(con);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 리뷰 플러스에서 best리뷰 불러오기(좋아요수 기준)
	public ArrayList<ReviewDTO> BestReviewList() {
		ArrayList<ReviewDTO> bestlist = new ArrayList<>();
		String sql = "{call review_pack.bestreview_list(?)}"; // 프로시저 실행
		try {
			Connection con = ConnectionProvider.getConnection();
			CallableStatement cstmt = con.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();  // 쿼리문 실행
			ResultSet rs = (ResultSet) cstmt.getObject(1); // 커서 사용했으므로 RESULT SET을 이용하여 객체를 선언
			while (rs.next()) {
				String review_no = rs.getString(1);
				int review_like = rs.getInt(2);
				String review_title = rs.getString(3);
				String review_img = rs.getString(4);
				String review_content = rs.getString(5);
				String review_size = rs.getString(6);
				int star_rating = rs.getInt(7);
				String pro_name = rs.getString(8);
				int pro_price = rs.getInt(9);
				String brand_name = rs.getString(10);
				String img_loc = rs.getString(11);
				String pro_gen = rs.getString(12);
				
				ReviewDTO brVO = new ReviewDTO();

				brVO.setR_no(review_no);
				brVO.setR_like(review_like);
				brVO.setR_title(review_title);
				brVO.setR_img(review_img);
				brVO.setR_content(review_content);
				brVO.setSize_name(review_size);
				brVO.setStar_rating(star_rating);
				brVO.setPro_name(pro_name);
				brVO.setPro_price(pro_price);
				brVO.setBrand_name(brand_name);
				brVO.setImg_loc(img_loc);
				brVO.setPro_gen(pro_gen);
				bestlist.add(brVO);
			}

			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(con);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return bestlist;
	}

   
	public List<ReviewSearchDTO> getOptionalReview(String pro_no, int height, int weight, String size) {
		List<ReviewSearchDTO> result = new ArrayList<>();
		String sql = "{call review_pack.search_review(?,?,?,?,?)}";
		try {
			Connection conn = ConnectionProvider.getConnection();
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, pro_no);
			cstmt.setInt(2, height);
			cstmt.setInt(3, weight);
			cstmt.setString(4, size);
			cstmt.registerOutParameter(5, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet) cstmt.getObject(5);
			while (rs.next()) {
				String reivew_no = rs.getString(1);
				int review_like = rs.getInt(2);
				String review_title = rs.getString(3);
				String review_content = rs.getString(4);
				String review_img = rs.getString(5);
				String review_date = rs.getString(6);
				int r_weight = rs.getInt(7);
				int r_height = rs.getInt(8);
				int star_rating = rs.getInt(9);
				String r_szie = rs.getString(10);
				String order_no = rs.getString(11);
				String user_id = rs.getString(12);
				ReviewSearchDTO rv = new ReviewSearchDTO(reivew_no, review_like, review_title, review_content, review_img,
						review_date, r_weight, r_height, star_rating, r_szie, order_no, user_id);
				result.add(rv);
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(conn);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public static ReviewDAO getInstance() {
		return RDAO; // 인스턴스 반환
	}

}