package com.hfashion.dto;

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
	private List<CartOrderDTO> orderList = new ArrayList<CartOrderDTO>(); 
	private int totalPrice;
	private int deliveryFee;
}
