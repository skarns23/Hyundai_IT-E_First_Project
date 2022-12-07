package com.hfashion.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


/*
 *  함세강 작성
 */
@Getter
@Setter
@NoArgsConstructor
public class OrderCreditDTO {
	private String postCode;
	private String address;
	private String userID;
	
	public OrderCreditDTO(String postCode,String address, String userID ) {
		this.postCode = postCode;
		this.address = address;
		this.userID = userID;
	}
}
