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
			cstmt.setString(1,reviewvo.getR_title());
			cstmt.setString(2,reviewvo.getR_content());
			cstmt.setString(3,reviewvo.getR_img());
			cstmt.setInt(4,reviewvo.getWeight());
			cstmt.setInt(5,reviewvo.getHeight());
			cstmt.setInt(6,reviewvo. getStar_rating());
			cstmt.setString(7,reviewvo. getSize_name());
			cstmt.setString(8,reviewvo. getPro_no());
			cstmt.setString(9,reviewvo. getOrder_no());
			cstmt.setString(10,reviewvo. getUser_id());
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
	public ReviewVO selectReview(String R_no) {
		ReviewVO review = new ReviewVO();
		String sql = "{call select_review(?,?,?,?,?,?,?,?)}";

		try {
			System.out.println("review dao 실행 중");
			Connection con = ds.getConnection();
			CallableStatement cstmt = con.prepareCall(sql);
			cstmt.setString(1, R_no);
			cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);// 1입력시 rs 출력
			cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(6, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(7, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(8, java.sql.Types.VARCHAR);
			ResultSet rs = cstmt.executeQuery(); // 조회 이므로
			if (rs.next()) {
				review.setR_no(rs.getString("review_no"));
				review.setR_title(rs.getString("review_title"));
				review.setR_like(rs.getInt("review_like"));
				review.setR_img(rs.getString("review_img"));
				review.setR_content(rs.getString("review_content"));
				review.setWeight(rs.getInt("weight"));
				review.setHeight(rs.getInt("height"));
				review.setStar_rating(rs.getInt("Star_rating"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println(review.getR_title());
		return review;
	}

// 리뷰 플러스 목록 불러오기	
	public ArrayList<ReviewVO> ReviewList() {
		ArrayList<ReviewVO> list = new ArrayList<>();
		System.out.println("dao확인1");
		String runSP = "{call review_list(?)}"; // 프로시저 실행(커서는 ? 하나 객체이므로)
		System.out.println("dao확인2");
		try {
			Connection con = ds.getConnection();
			CallableStatement cstmt = con.prepareCall(runSP);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.executeQuery();
			ResultSet rs = (ResultSet) cstmt.getObject(1);
			// System.out.println(rs.getRow());커서 에서 받은 rs개수 확인
			while (rs.next()) {
				String review_title = rs.getString(1);
				String review_img = rs.getString(2);
				String review_content = rs.getString(3);
				String review_size = rs.getString(4);
				int star_rating = rs.getInt(5);
				String pro_name = rs.getString(6);
				int pro_price = rs.getInt(7);
				String brand_name = rs.getString(8);
				ReviewVO rVO = new ReviewVO();

				rVO.setR_title(review_title);
				rVO.setR_img(review_img);
				rVO.setR_content(review_content);
				rVO.setSize_name(review_size);
				rVO.setStar_rating(star_rating);
				rVO.setPro_name(pro_name);
				rVO.setPro_price(pro_price);
				rVO.setBrand_name(brand_name);
				list.add(rVO);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static ReviewDAO getInstance() {
		return RDAO; // 인스턴스 반환
	}

}

// review 목록

// 리뷰 삭제 delete
// 리뷰 목록
// 리뷰 수정 update
