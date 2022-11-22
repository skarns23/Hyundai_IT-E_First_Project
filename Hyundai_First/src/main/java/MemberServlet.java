

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/member4")
public class MemberServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response)  throws ServletException, IOException{
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out=response.getWriter();	
      MemberDAO dao = MemberDAO.getInstance();
      List list=dao.listMembers();
      
      out.print("<html><body>");
      out.print("<table border=1><tr align='center' bgcolor='lightgreen'>");
      out.print("<td>first_name</td><td>last_name</td></tr>");
     
     for (int i=0; i<list.size();i++){
		MemberVO memberVO = (MemberVO) list.get(i);
		String id = memberVO.getFirst_name();
		String pwd = memberVO.getLast_name();
		out.print("<tr><td>"+id+"</td><td>"
			                +pwd+"</td>");
				
	 }
	 out.print("</table></body></html>");
   }
}