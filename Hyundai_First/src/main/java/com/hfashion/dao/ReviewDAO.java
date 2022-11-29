package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hfashion.vo.ReviewVO;

import oracle.jdbc.OracleTypes;

// 윤태영 작성

public class ReviewDAO {

	private static ReviewDAO RDAO = new ReviewDAO(); // 인스턴스 생성
	private DataSource ds = null;

	// 프로시저 호출
  

	
	
	
	

	
	
	
   public ReviewDAO() {
		try {
			Context con = new InitialContext();
			Context envcon = (Context) con.lookup("java:/comp/env");
			ds = (DataSource) envcon.lookup("jdbc/oracle88");

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	 }
	
   
    
	// 리뷰생성
	public void createReview(ReviewVO reviewvo) {
		String insert = "{call insert_review(?,?,?,?,?,?,?,?,?,?)}";
		Connection con = null;

		try {
			con = ds.getConnection();
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
			cstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 리뷰수정
	public ReviewVO updateReview(String R_no) {
		ReviewVO review = new ReviewVO();

		return review;
	}

	// 리뷰 삭제
	public ReviewVO deleteReview(String R_no) {
		ReviewVO review = new ReviewVO();

		return review;
	}

// 리뷰 상세 정보  
	public ReviewVO Reviewdetail(String R_no) {
		ReviewVO review = new ReviewVO();
		String detail = "{call review_detail(?,?)}";

		try {
			System.out.println("review dao 실행 중");
			Connection con = ds.getConnection();

			CallableStatement cstmt = con.prepareCall(detail);
			cstmt.setString(1, R_no);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet rs = (ResultSet) cstmt.getObject(2);

			while (rs.next()) {
				review.setR_title(rs.getString(1));
				review.setR_content(rs.getString(2));
				review.setR_img(rs.getString(3));
				review.setWeight(rs.getInt(4));
				review.setHeight(rs.getInt(5));
				review.setStar_rating(rs.getInt(6));
				review.setSize_name(rs.getString(7));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return review;
	}

// 리뷰 플러스 목록 불러오기	
	public ArrayList<ReviewVO> ReviewList() {
		ArrayList<ReviewVO> list = new ArrayList<>();
		System.out.println("dao확인1");
		String sql = "{call review_list(?)}"; // 프로시저 실행(커서는 ? 하나 객체이므로)
		System.out.println("dao확인2");
		try {
			Connection con = ds.getConnection();
			CallableStatement cstmt = con.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet rs = (ResultSet) cstmt.getObject(1);
			// System.out.println(rs.getRow());커서 에서 받은 rs개수 확인
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
				ReviewVO rVO = new ReviewVO();

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
				list.add(rVO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//best리뷰 불러오기
	public ArrayList<ReviewVO> BestReviewList() {
		ArrayList<ReviewVO> bestlist = new ArrayList<>();
		System.out.println("dao확인1");
		String sql = "{call bestreview_list(?)}"; // 프로시저 실행(커서는 ? 하나 객체이므로)
		System.out.println("dao확인2");
		
		
		try {
			Connection con = ds.getConnection();
			CallableStatement cstmt = con.prepareCall(sql);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet rs = (ResultSet) cstmt.getObject(1);
			// System.out.println(rs.getRow());커서 에서 받은 rs개수 확인
			while (rs.next()) {
				String review_no = rs.getString(1);
				int review_like=rs.getInt(2);
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
				System.out.println("베스트리뷰 리스트 확인중");
				System.out.println(img_loc);
				ReviewVO brVO = new ReviewVO();

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
				System.out.println(bestlist);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bestlist;
	}

	public static ReviewDAO getInstance() {
		return RDAO; // 인스턴스 반환
	}

}