package com.hfashion.vo;




import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
//CREATE TABLE review (
//	    review_no                       VARCHAR2(20) NOT NULL,
//	    review_like                     NUMBER NOT NULL,
//	    review_title                    VARCHAR2(50) NOT NULL,
//	    review_content                  VARCHAR2(500) NOT NULL,
//	    review_img                      VARCHAR2(200) NOT NULL,
//	    review_date                     DATE NOT NULL,
//	    weight                          NUMBER NOT NULL,
//	    height                          NUMBER NOT NULL,
//	    star_rating                     NUMBER NOT NULL,
//	    order_detail_size_name          VARCHAR2(20) NOT NULL,
//	    order_detail_pro_no             VARCHAR2(20) NOT NULL,
//	    order_detail_order_order_no     VARCHAR2(20) NOT NULL, 
//	    order_detail_order_user_user_id VARCHAR2(30) NOT NULL
//	--  ERROR: Column name length exceeds maximum allowed length(30) 
//	);
@Getter
@Setter
@ToString
public class ReviewVO {

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

   

}
