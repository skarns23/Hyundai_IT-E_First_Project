package com.hfashion.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


/*
 *  함세강 작성
 */
@Getter
@Setter
@NoArgsConstructor
public class OrderDTO {
	private String postCode;
	private String address;
	private String userID;
	
	public OrderDTO(String postCode,String address, String userID ) {
		this.postCode = postCode;
		this.address = address;
		this.userID = userID;
	}
}
