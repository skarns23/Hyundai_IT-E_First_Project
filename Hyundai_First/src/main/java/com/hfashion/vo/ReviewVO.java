package com.hfashion.vo;

import java.sql.Timestamp;
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

public class ReviewVO {

	private String r_no;
	private int r_like;
	private String r_title;
	private String r_content;
	private String r_img;
	private Timestamp r_date;
	private int weight;
	private int height;
	private int star_rating;
	private String size_name;
	private String pro_no;
	private String order_no;
	private String user_id;
	private String pro_name;

    //리뷰넘버
	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
	}

    // 리뷰 좋아요
	public int getR_like() {
		return r_like;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}
    
	
	// 리뷰 제목
	public String getR_title() {
		return r_title;
	}

	
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	//리뷰 내용
	public String getR_content() {
		return r_content;
	}

	
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	
	// 리뷰 이미지
	public String getR_img() {
		return r_img;
	}


	public void setR_img(String r_img) {
		this.r_img = r_img;
	}
     // 리뷰 생성 날짜
	public Timestamp getR_date() {
		return r_date;
	}

	
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}

	//리뷰 작성자 몸무게
	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
	}

	//리뷰 작성자 키
	public int getHeight() {
		return height;
	}

	
	public void setHeight(int height) {
		this.height = height;
	}

    // 리뷰 별점
	public int getStar_rating() {
		return star_rating;
	}


	public void setStar_rating(int star_rating) {
		this.star_rating = star_rating;
	}

    //size 이름
	public String getSize_name() {
		return size_name;
	}


	public void setSize_name(String size_name) {
		this.size_name = size_name;
	}

      // 상품 이름
	public String getPro_no() {
		return pro_no;
	}

	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}

    // 주문 번호
	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

   // 유저 아이디
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

}
