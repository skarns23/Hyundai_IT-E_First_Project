package com.hfashion.dto;


// 윤태영 작성
// 리뷰 DTO 작성

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {

	private String r_no;
	private int r_like;
	private String r_title;
	private String r_content;
	private String r_img;
	private Date r_date;
	private int weight;
	private int height;
	private int star_rating;
	private String size_name;
	private String pro_no;
	private String order_no;
	private String user_id;
	private String pro_name;
	private int pro_price;
	private String brand_name;
	private String img_loc;
	private String pro_gen;  

}
