package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.MemberVO;

import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

/*
 * 남승현 작성
 * */
public class MemberDAO {
	private static MemberDAO mDAO = new MemberDAO();
	private DataSource ds = null;
	private String insert = "{call mem_pack.insert_member(?,?,?,?,?)}";
	private String confirm = "{? = call mem_pack.confirm_fid(?)}";
	private String login = "{call mem_pack.login_member(?,?,?)}";
	private String findId = "{call mem_pack.find_id_date(?,?,?,?,?)}";
	private String updatePW = "{call mem_pack.update_member_pw(?,?)}";
	private String outMember = "{call mem_pack.out_member(?)}";
	private String confirmEmail = "{?=call mem_pack.check_email(?)}";
	private String searchPW = "{?=call mem_pack.searchPW(?,?,?)}";
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
	public String searchPW(String user_id, String user_name, String user_email) {
		String result = "";
		try {
			Connection conn = ConnectionProvider.getConnection();
			CallableStatement cstmt = conn.prepareCall(searchPW);
			cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
			cstmt.setString(2, user_id);
			cstmt.setString(3, user_name);
			cstmt.setString(4, user_email);
			cstmt.execute();
			result = cstmt.getString(1);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(conn);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public MemberVO loginMember(String user_id, String user_pw) {
		MemberVO member  = null;
		try(Connection conn = ds.getConnection();
			CallableStatement cstmt = conn.prepareCall(login);){
			cstmt.setString(1, user_id);
			cstmt.setString(2, user_pw);
			cstmt.registerOutParameter(3, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(3);
			//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/mm/dd");
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String phone = rs.getString(5);
				//Date join_date = rs.getDate(6);
				member = new MemberVO(id,pw,name,email,phone);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	public boolean confirmID(String user_id) {
		int result = 0;
		try (Connection conn = ds.getConnection(); CallableStatement cstmt = conn.prepareCall(confirm);) {
			cstmt.setString(2, user_id);
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.executeQuery();
			result = cstmt.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// ID 사용할 수 있으면 , 없으면 true
		return result == 1 ? false : true;
	}

	public List<MemberVO> listMembers() {

		return null;
	}

	public boolean signUp(MemberVO member) {
		int rs = 0;
		if (!confirmID(member.getUser_id())) {
			System.out.println("해당 아이디 존재");
			return false;
		}
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

	public MemberVO findID(String user_name, String user_email, String user_phone) {
		String result = "";
		Date date = null;
		MemberVO member = null;
		try(Connection conn = ds.getConnection();
			CallableStatement cstmt = conn.prepareCall(findId)){
			cstmt.setString(1, user_name);
			cstmt.setString(2, user_email);
			cstmt.setString(3, user_phone);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(5, java.sql.Types.DATE);
			cstmt.execute();
			result = cstmt.getString(4);
			date = cstmt.getDate(5);;
			member = new MemberVO(result,null,user_name,user_email,user_phone,date);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public static MemberDAO getInstance() {
		return mDAO;
	}
	public int secessionMember(String user_id) {
		int result = 0;
		 try {
			 Connection conn = ConnectionProvider.getConnection();
			 CallableStatement cstmt = conn.prepareCall(outMember);
			 cstmt.setString(1, user_id);
			 result = cstmt.executeUpdate();
			 JdbcUtil.close(cstmt);
			 JdbcUtil.close(conn);
		 }catch (SQLException e) {
			 e.printStackTrace();
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
		return result;
		
	}
	public int updatePW(String user_id, String update_pw) {
		int result = 0;
		try {
			Connection conn = ConnectionProvider.getConnection();
			CallableStatement cstmt = conn.prepareCall(updatePW);
			cstmt.setString(1, user_id);
			cstmt.setString(2, update_pw);
			result = cstmt.executeUpdate();
			JdbcUtil.close(cstmt);
			JdbcUtil.close(conn);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int confirmEmail(String p_email) {
		int result = 0;
		try {
			Connection conn = ConnectionProvider.getConnection();
			CallableStatement cstmt = conn.prepareCall(confirmEmail);
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.setString(2, p_email);
			cstmt.execute();
			result = cstmt.getInt(1);
			JdbcUtil.close(cstmt);
			JdbcUtil.close(conn);
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
