package com.hfashion.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;


//객체 close 하려면 try catch 문 써야하는데 그거 쓰기 귀찮아서 따로 클래스로 만들어 버린거다.
// rs, pstmt, con   try{}catch(){}
public class JdbcUtil {
     
   public static void close(CallableStatement cstmt) {
      if (cstmt != null) {
         try {
        	 cstmt.close();
         } catch (SQLException ex) {
         }
      }
   }
   
   public static void close(ResultSet rs) {
	      if (rs != null) {
	         try {
	        	 rs.close();
	         } catch (SQLException ex) {
	         }
	      }
	   }
   
   
   public static void close(Connection conn) {
      if (conn != null) {
         try {
            conn.close();
         } catch (SQLException ex) {
         }
      }
   }


   
   
}