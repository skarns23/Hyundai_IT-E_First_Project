package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hfashion.util.JdbcUtil;

import oracle.jdbc.OracleTypes;


/*
 * 윤태영 작성
 */


// 좋아요 기능 dao 작성
public class GoodDAO {
       
	private static GoodDAO gDAO = new GoodDAO(); // 인스턴스 생성
	private DataSource ds = null;
	// 프로시저 호출s

	public GoodDAO() {
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

	// 좋아요 테이블에 리뷰 넘버와 유저아이디 삽입 DAO
	public int goodinsert(String R_no, String user_id) {
		String sql = "{call good_pack.update_good(?,?)}"; // good테이블에 값저장
		int result = 0;
		try {

			Connection con = ds.getConnection();
			CallableStatement cstmt = con.prepareCall(sql);
			cstmt.setString(1, R_no);
			cstmt.setString(2, user_id);
			result = cstmt.executeUpdate();
			JdbcUtil.close(cstmt);
			JdbcUtil.close(con);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 좋아요 개수 호출 DAO
	public int SelectLike(String R_no) {
		int like = 0;
		String selectlike = "{call good_pack.select_good(?,?)}";
		// 좋아요개수 호출 프로 시저 실행

		try {
			Connection con = ds.getConnection();
			CallableStatement cstmt = con.prepareCall(selectlike);

			cstmt.setString(1, R_no);
			cstmt.registerOutParameter(2, OracleTypes.CURSOR);
			cstmt.executeQuery(); // 쿼리 실행
			ResultSet rs = (ResultSet) cstmt.getObject(2);
			while (rs.next()) {
				like = Integer.parseInt(rs.getString(1)); // 좋아요 개수 저장
			}
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(con);

		} catch (Exception e) {
			// TODO: handle exception
		}

		return like; // 좋아요 수 반환
	}

	public static GoodDAO getInstance() { // 인스턴스 반환
		
		return gDAO;
	}

}
