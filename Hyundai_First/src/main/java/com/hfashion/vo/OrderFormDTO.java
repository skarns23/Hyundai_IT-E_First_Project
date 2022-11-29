package com.hfashion.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;


/*
 * 함세강 작성
 */
@Getter
@Setter
public class OrderFormDTO {
	private String userId;
	private String userName;
	private String userPhone;
	private String userEmail;
	private List<CartDTO> orderList = new ArrayList<CartDTO>(); 
	private int totalPrice;
}
