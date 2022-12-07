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
/*
 * 남승현 작성 
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
	/*
	 * 기능 : 마이페이지와 장바구니에 로그인 후 접근하도록 인가처리하는 기능 
	 * 로직 : command의 value에 mypage 혹은 cart가 존재하는 경우 session의 loginUser 속성의 존재여부를 판단하고,
	 *        없는 경우 현재 액션 값을 request에 redirectURL로 설정 
	 *        이후 로그인 화면으로 Redirect 시킴 
	 * 기타 : 제품 상세에서 로그인을 하지 않은채로 장바구니 담기를 진행하는 경우 다시 제품상세로 오도록 설정
	 *        ex_action을 달아 제품 상세의 위치를 기억시킴
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		String action = request.getParameter("command");
		String pno = request.getParameter("pro_no");
		HttpSession session =  req.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
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
