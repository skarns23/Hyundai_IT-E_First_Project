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

import com.hfashion.dto.MemberDTO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;

import oracle.jdbc.OracleType;
import oracle.jdbc.OracleTypes;

/*
 * 남승현 작성
 * 
 */

// 싱글턴 패턴을 적용시킴 
public class MemberDAO {
	private static MemberDAO mDAO = new MemberDAO();
	private String insert = "{call mem_pack.insert_member(?,?,?,?,?)}";
	private String confirm = "{? = call mem_pack.confirm_fid(?)}";
	private String login = "{call mem_pack.login_member(?,?,?)}";
	private String findId = "{call mem_pack.find_id_date(?,?,?,?,?)}";
	private String updatePW = "{call mem_pack.update_member_pw(?,?)}";
	private String outMember = "{call mem_pack.out_member(?)}";
	private String confirmEmail = "{?=call mem_pack.check_email(?)}";
	private String searchPW = "{?=call mem_pack.searchPW(?,?,?)}";
	private MemberDAO() {}
	
	
	/*
	 * 기능 : 비밀번호 찾기 기능 
	 * 입력 : 사용자의 아이디, 이름, 이메일 
	 * 출력 : 사용자의 비밀번호
	 * 기타 : function 활용 
	 */
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
	
	/*
	 * 기능 : 유저 로그인 기능 
	 * 입력 : 사용자의 아이디, 비밀번호 
	 * 출력 : 해당 조건에 부합한 사용자의 인스턴스
	 * 기타 : 사용자의 데이터를 읽기위해 CURSOR 사용  
	 */
	public MemberDTO loginMember(String user_id, String user_pw) {
		MemberDTO member  = null;
		try(Connection conn = ConnectionProvider.getConnection();
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
				member = new MemberDTO(id,pw,name,email,phone);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	/*
	 * 기능 : 아이디 확인 기능
	 * 입력 : 사용자의 아이디 
	 * 출력 : 사용자의 아이디 존재 유무 반환
	 * 기타 : function 활용 
	 */
	public boolean confirmID(String user_id) {
		int result = 0;
		try (Connection conn = ConnectionProvider.getConnection(); 
			CallableStatement cstmt = conn.prepareCall(confirm);) {
			cstmt.setString(2, user_id);
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.executeQuery();
			result = cstmt.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// ID 사용할 수 있으면 , 없으면 true
		return result == 1 ? false : true;
	}

	/*
	 * 기능 : 회원가입 기능 
	 * 입력 : 사용자 인스턴스 (아이디, 비밀번호, 이름, 이메일, 휴대폰번호 포함) 
	 * 출력 : 회원가입 성공 여부 반환
	 * 기타 : 유저아이디가 존재하지 않는 인스턴스의 경우, 바로 false 값 반환  
	 */
	public boolean signUp(MemberDTO member) {
		int rs = 0;
		if (!confirmID(member.getUser_id())) {
			return false;
		}
		try (Connection conn = ConnectionProvider.getConnection();
			CallableStatement cstmt = conn.prepareCall(insert);) {
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

	/*
	 * 기능 : 유저 ID 찾기 기능 
	 * 입력 : 사용자의 이름, 이메일, 휴대폰 번호 
	 * 출력 : 사용자의 이름, 이메일, 휴대폰 번호,아이디와 가입날짜를 담은 인스턴스
	 */
	public MemberDTO findID(String user_name, String user_email, String user_phone) {
		String result = "";
		Date date = null;
		MemberDTO member = null;
		try(Connection conn = ConnectionProvider.getConnection();
			CallableStatement cstmt = conn.prepareCall(findId)){
			cstmt.setString(1, user_name);
			cstmt.setString(2, user_email);
			cstmt.setString(3, user_phone);
			cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
			cstmt.registerOutParameter(5, java.sql.Types.DATE);
			cstmt.execute();
			result = cstmt.getString(4);
			date = cstmt.getDate(5);;
			member = new MemberDTO(result,null,user_name,user_email,user_phone,date);
		}catch (SQLException e) {
			
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	/*
	 * 기능 : 싱글턴 패턴으로 인한 MemberDAO 인스턴스 반환 기능
	 */
	public static MemberDAO getInstance() {
		if(mDAO == null) {
			mDAO = new MemberDAO();
		}
		return mDAO;
	}
	
	/*
	 * 기능 : 회원가입 탈퇴 기능
	 * 입력 : 사용자 아이디 
	 * 출력 : 회원 탈퇴 기능 수행 후 영향 받은 행의 수 반환
	 */
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
	
	/*
	 * 기능 : 회원 비밀번호 변경 기능 
	 * 입력 : 사용자 이이디, 새 비밀번호 
	 * 출력 : 비밀번호 변경으로 영향받은 행의 수 반환
	 */
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
	
	/*
	 * 기능 : 이메일 중복여부 확인 기능
	 * 입력 : 입력 이메일 
	 * 출력 : 해당 이메일을 사용하는 튜플의 수 반환   
	 */
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
