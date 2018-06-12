package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 后台拦截器
 */
/*@WebFilter(filterName="adminFilter",
	urlPatterns={"/admin/index.jsp"},
	initParams = {  
        @WebInitParam(name = "noLoginPaths", value = "login.jsp,error.jsp,UserServlet")
})*/ // 功能未完善，暂时屏蔽失效
public class adminFilter implements Filter {

	private FilterConfig config;
	
    public adminFilter() {
        
    }

	public void destroy() {
		System.out.println("destroy");
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		System.out.println("start...doFilter");
		//chain.doFilter(request, response);
		System.out.println("end...doFilter");
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession();
		
		// 排除过滤页面
		String noLoginPaths = config.getInitParameter("noLoginPaths");
		if (noLoginPaths!=null) {
			String[] strArray = noLoginPaths.split(";");
			for (int i = 0; i < strArray.length; i++) {
				if (strArray[i]==null || "".equals(strArray[i]))continue;
				if (request.getRequestURI().indexOf(strArray[i]) != -1) {
					chain.doFilter(req, resp);
					return;
				}
			}
		}
		
		if (session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
		}else {
			chain.doFilter(req, resp);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		config = fConfig;
		System.out.println("init："+config);
	}

}
