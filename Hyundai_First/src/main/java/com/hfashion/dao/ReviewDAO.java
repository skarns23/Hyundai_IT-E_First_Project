package com.hfashion.dao;

import javax.sql.DataSource;

public class ReviewDAO {

	private static ReviewDAO RDAO = new ReviewDAO();
	private DataSource ds = null;
	private String select = "{call select_review(?,?,?,?,?)}";
	private String insert = "{call insert_review(?,?,?,?,?)}";

	// 프로시저 호출

//	public ReviewVO ReviewDAO() {
//		try {
//			Context con = new InitialContext();
//			Context envcon = (Context) con.lookup("java:/comp/env");
//			ds = (DataSource) envcon.lookup("jdbc/oracle88");
//
//		} catch (Exception e) {
//			e.printStackTrace();
//
//		}

//	public ArrayList<ReviewVO>selectReview(int review_no){ 
//			ReviewVO review = new ReviewVO(); 
//			ArrayList<ReviewVO> lists = new ArrayList<>();
//			String sql = "{call select_review(?,?,?,?,?)}";  
//		     Connection con = null; 
//		     CallableStatement cstmt=null; 
//		     ResultSet rs = null;// result set을 통해 한행으로 출력가능
//            try { con = ds.getConnection(); 
//            CallableStatement callableStatement = con.prepareCall(sql);
//            cstmt.setInt(1, review_no); // 1입력시 rs 출력
//            rs = cstmt.executeQuery(); 
//            if (rs.next()) { review.setR_no(rs.getString("reviw_no")); 
//                             review.setR_title(rs.getString("review_title")); 
//                             review.setR_like(rs.getInt("review_like")); 
//                             review.setR_img(rs.getString("review_img")); 
//                             review.setR_content(rs.getString("review_content")); 
//                             review.setWeight(rs.getInt("weight")); 
//                             review.setHeight(rs.getInt("height")); 
//                             review.setStar_rating(rs.getInt("Star_rating")); 
//                             } }
//            catch (Exception e) { e.printStackTrace(); } 
//            
//            return review; 
//            }

		
//		
//		public ReviewVO selectReview(String R_no){ 
//			ReviewVO review = new ReviewVO(); 
//			String sql = "{call select_review(?,?,?,?,?)}";  
//		     Connection con = null; 
//		     CallableStatement cstmt=null; 
//		     ResultSet rs = null;// result set을 통해 한행으로 출력가능
//            try { con = ds.getConnection(); 
//            cstmt = con.prepareCall(sql);
//            cstmt.setString(1, R_no); // 1입력시 rs 출력
//            rs = cstmt.executeQuery(); 
//            if (rs.next()) { review.setR_no(rs.getString("review_no")); 
//                             review.setR_title(rs.getString("review_title")); 
//                             review.setR_like(rs.getInt("review_like")); 
//                             review.setR_img(rs.getString("review_img")); 
//                             review.setR_content(rs.getString("review_content")); 
//                             review.setWeight(rs.getInt("weight")); 
//                             review.setHeight(rs.getInt("height")); 
//                             review.setStar_rating(rs.getInt("Star_rating")); 
//                             } 
//            }
//            catch (Exception e) { e.printStackTrace(); }             
//            return review; 
//            }
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

  }


// review 목록

// 리뷰 삭제 delete
// 리뷰 목록
// 리뷰 수정 update
