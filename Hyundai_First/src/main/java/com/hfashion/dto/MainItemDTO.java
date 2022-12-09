package com.hfashion.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

/*
 * 함세강 작성
 */
@Setter
@Getter
public class MainItemDTO {
	private List<String> mainImgslist;
	private String productName;
	private String brandName;
	
}
