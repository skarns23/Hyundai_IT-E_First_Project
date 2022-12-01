package com.hfashion.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.hfashion.dao.MainBrandItemDAO;
import com.hfashion.util.ConnectionProvider;
import com.hfashion.util.JdbcUtil;
import com.hfashion.vo.MainItemDTO;

/*
 * 함세강
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
	
	public List<MainItemDTO> getMainFormIteml() {
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
	
	
	
	
}
