package com.hfashion.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


/*
 * 남승현 작성
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberVO {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_phone;
	private Date join_date;
	
	
	public MemberVO(String _uid, String _pwd) {
		this.user_id = _uid;
		this.user_pw = _pwd;
	}
	
	public MemberVO(String _uid, String _pwd,String name, String email,String phone) {
		this.user_id = _uid;
		this.user_pw = _pwd;
		this.user_name = name;
		this.user_email = email;
		this.user_phone = phone;
	}
}
