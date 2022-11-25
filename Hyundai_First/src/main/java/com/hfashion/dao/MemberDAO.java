package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	private String confirm = "{call confirm_id(?,?)}";

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

	public boolean confirmID(String user_id) {
		int result = 0;
		try (Connection conn = ds.getConnection();
				CallableStatement cstmt = conn.prepareCall(confirm);) {
			cstmt.setString(1, user_id);
			cstmt.setInt(2, result);
			cstmt.executeQuery();
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		// ID 존재하면 false , 없으면 true
		return result==1?false:true;
	}

	public List<MemberVO> listMembers() {

		return null;
	}

	public boolean signUp(MemberVO member) {
		int rs = 0;
		try (Connection conn = ds.getConnection(); CallableStatement cstmt = conn.prepareCall(insert);) {
			cstmt.setString(1, member.getUser_id());
			cstmt.setString(2, member.getUser_pw());
			cstmt.setString(3, member.getUser_name());
			cstmt.setString(4, member.getUser_email());
			cstmt.setString(5, member.getUser_phone());
			rs = cstmt.executeUpdate();
	
		} catch (Exception e) {
		}

		return rs == 0 ? false : true;

	}

	public static MemberDAO getInstance() {
		return mDAO;
	}

}
