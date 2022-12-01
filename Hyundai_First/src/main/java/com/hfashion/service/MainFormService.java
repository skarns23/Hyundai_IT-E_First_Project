package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.MainBrandItemDAO;
import com.hfashion.dao.ReviewDAO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.MainItemDTO;
import com.hfashion.vo.ReviewVO;

/*
 * 함세강, 윤태영 작성
 */
public class MainFormService {
	//싱글톤
	private MainFormService() {};
	private static MainFormService instance=null;
	public static MainFormService getInstance() {
		if(instance ==null) {
			instance = new MainFormService();
		}
		return instance;
	}
	
	//메인 베스트랭킹 가져오는 메서드
	public List<MainItemDTO> getMainFormItem() {
		List<MainItemDTO> list = null;
		Connection con = null;

		try {
			con = ConnectionProvider.getConnection();
			MainBrandItemDAO dao = MainBrandItemDAO.getInstance();
			list = dao.brandItemListMain(con);
			

			return list;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
	//메인 베스트 리뷰 가져오는 메서드
	public List<ReviewVO> getMainBestReview() {
		List<ReviewVO> bestreviewList = null;
		Connection con = null;

		try {
			con = ConnectionProvider.getConnection();
			ReviewDAO bestreviewDAO = ReviewDAO.getInstance();
			bestreviewList = bestreviewDAO.BestReviewList();

			return bestreviewList;
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
	
}
