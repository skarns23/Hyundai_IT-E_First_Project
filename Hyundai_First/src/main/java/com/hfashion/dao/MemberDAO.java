package com.hfashion.dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hfashion.vo.MemberVO;

/*
 * 남승현 작성
 * */
public class MemberDAO {
	private static MemberDAO mDAO = new MemberDAO();
	private DataSource ds = null;
	private String insert = "{call insert_member(?,?,?,?,?)}";

	private MemberDAO() {
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

	public boolean ConfirmID() {
		boolean result = true;

		return result;
	}
	public List<MemberVO> listMembers(){
		
		return null;
	}
	public boolean signUp() {
		int rs = 0;
		MemberVO mVO = new MemberVO("skarns23", "123sksksk", "남승현", "skarns23@naver.com", "01051523372");
		try (Connection conn = ds.getConnection(); 
				CallableStatement cstmt = conn.prepareCall(insert);) {
			cstmt.setString(1,"skarns23");
			cstmt.setString(2,"123sksksk");
			cstmt.setString(3,"남승현");
			cstmt.setString(4,"skarns23@naver.com");
			cstmt.setString(5,"01051523372");
			rs = cstmt.executeUpdate();
		} catch (Exception e) {
		}
		
		return rs==0?false:true;
	
	}

	public static MemberDAO getInstance() {
		return mDAO;
	}

}
