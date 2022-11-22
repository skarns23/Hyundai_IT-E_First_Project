import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Test {
	
	private static Connection con = null;
	private static PreparedStatement pstmt;
	private static  DataSource  dataFactory = null;
	public static void main(String[] args) throws SQLException {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			try {
				dataFactory = (DataSource) envContext.lookup("jdbc/oracle10");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		con = dataFactory.getConnection();
		pstmt = con.prepareStatement("SELECT first_name from employees ");
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			System.out.println(rs.getString(1));
		}
	}
	
}
