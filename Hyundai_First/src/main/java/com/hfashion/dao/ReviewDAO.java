package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.hfashion.vo.ReviewVO;

import oracle.jdbc.OracleTypes;

public class ReviewDAO {

	private static ReviewDAO RDAO = new ReviewDAO(); // 인스턴스 생성
	private DataSource ds = null;

	public static ReviewDAO getInstance() {
		return RDAO; // 인스턴스 반환
	}

	// 프로시저 호출
	public ReviewDAO() {
		try {
			Context con = new InitialContext();
			Context envcon = (Context) con.lookup("java:/comp/env");
			ds = (DataSource) envcon.lookup("jdbc/oracle88");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ReviewVO selectReview(String R_no) {
		ReviewVO review = new ReviewVO();
		String sql = "{call select_review(?,?,?,?,?,?,?,?)}";
		ResultSet rs = null;// result set을 통해 한행으로 출력가능
		try {
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
			rs = cstmt.executeQuery(); // 조회 이므로
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
		return review;
	}

	// 전체 리뷰 조회
	public ArrayList<ReviewVO>ReviewList(String R_no) {
		ArrayList<ReviewVO>list=new ArrayList<>();
		String runSP = "{call reviewlist(?,?,?,?,?,?)}"; //프로시저 실행
		
		try {
			Connection con = ds.getConnection(); 
			CallableStatement cstmt = con.prepareCall(runSP);
			cstmt.setString(1,R_no);
			cstmt.registerOutParameter(2,OracleTypes.CURSOR);
			ResultSet rs = cstmt.executeQuery(); //result set을 통해 한행으로 출력가능
		 	while(rs.next()){
		 		 
		         String review_title=rs.getString(1);	
		         String review_img=rs.getString(2);	
		         String review_content=rs.getString(3);	
		         String review_size=rs.getString(4);
		         int star_rating=rs.getInt(5);
		         String pro_name=rs.getString(6);
		        
		         ReviewVO rVO=new ReviewVO();
		         
		         rVO.setR_title(review_title);
			     rVO.setR_img(review_img);
			     rVO.setR_content(review_content);
			     rVO.setSize_name(review_size);
			     rVO.setStar_rating(star_rating);
                 rVO.setPro_name(pro_name);           
           		 list.add(rVO);
		 	}
		}
		catch(SQLException e) {
            e.printStackTrace();
         }
		return list ;
 	  }
	
	}

//	ArrayList<ReviewDAO> ReviewList() {
//			String runSP ="{call select_allreview(?,?,?,?,?)}";
//
//			try {
//				Connection conn = ds.getConnection();
//				CallableStatement callableStatement = conn.prepareCall(runSP);
//				callableStatement.registerOutParameter(1, OracleTypes.CURSOR);
//				callableSta tement.execute();
//
//				ResultSet resultSet = (ResultSet) callableStatement.getObject(1);
//
//				while (resultSet.next()) {
//					System.out.print(resultSet.getString(1) + "   ");
//					System.out.print(resultSet.getString(2) + "   ");
//					System.out.println(resultSet.getDouble(3));
//				}
//				System.out.println();
//
//			} catch (SQLException e) {
//				System.out.println("프로시저에서 에러 발생!");
//				System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//
//			}
//		}

//	public void update(ReviewVO reivewVO) {
//		String sql = "{call update_review(?,?,?,?,?)}";
//		try {
//			Connection conn = ds.getConnection();
//			CallableStatement callableStatement = conn.prepareCall(sql);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}



// review 목록

// 리뷰 삭제 delete
// 리뷰 목록
// 리뷰 수정 update
