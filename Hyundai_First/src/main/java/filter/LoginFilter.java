package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hfashion.vo.MemberVO;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		String action = request.getParameter("command");
		String pno = request.getParameter("pro_no");
		System.out.println("login filter "+action);
		System.out.println("PNO  : "+pno);
		HttpSession session =  req.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		System.out.println(memberVO);
		if(action!=null&&(action.contains("mypage")||action.contains("cart"))&&memberVO==null){
			if(request.getParameter("ex_action")!=null)
				action = request.getParameter("ex_action")+"&pno="+pno;
			String url = req.getRequestURL()+"?command=loginform";
			

			session.setAttribute("redirectURL",action);
			HttpServletResponse res = (HttpServletResponse)response;
			res.sendRedirect(url);
			return;
		}
		
		
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
