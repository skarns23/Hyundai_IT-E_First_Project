package com.hfashion.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hfashion.dto.MainItemDTO;
import com.hfashion.dto.MainItemImgDTO;
import com.hfashion.util.JdbcUtil;

import oracle.jdbc.OracleTypes;

/*
 * 함세강
 */
public class MainBrandItemDAO {
	
	//싱글톤선언
	private MainBrandItemDAO() {};
	private static MainBrandItemDAO instance=null;
	public static MainBrandItemDAO getInstance() {
		if(instance==null) {
			instance = new MainBrandItemDAO();
		}
		return instance;
	}
	
	
	//전체 베스트 상품 데이터를 가져오는 메서드
	public List<MainItemDTO> brandItemListMain(Connection con){
		List<MainItemDTO> list = new ArrayList<MainItemDTO>();
		
		String runProcedure = "{call main_pack.main_brand_list(?)}"; 
							    //베스트 상품 데이터를 가져오는 프로시저 호출
		
		try {
			CallableStatement cstmt = con.prepareCall(runProcedure);
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();
			ResultSet rs = (ResultSet)cstmt.getObject(1);
			
			MainItemImagesDAO dao = MainItemImagesDAO.getInstance();
			
			while(rs.next()) {
				
				String proName = rs.getString(1);
				String brandName = rs.getString(2);
				String proNo = rs.getString(3);
				
				
				MainItemDTO dto = new MainItemDTO();  //상품명, 브랜드명, 이미지 list가 담기는 dto
				
				
				dto.setProductName(proName);
				dto.setBrandName(brandName);
				
				List<String> imgList = null;
				
				imgList = dao.getMainImages(con, proNo); //상품 한개에 해당하는 이미지들을 불러오는 메서드
						  
				
				dto.setMainImgslist(imgList);
				
				list.add(dto);
				
			}
			
			JdbcUtil.close(rs);
			JdbcUtil.close(cstmt);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
