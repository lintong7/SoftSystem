package test;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/request.do")
public class TestRequestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getContextPath(); //获取我们发布到Tomcat上的工程根路径名称
		System.out.println("根目录路径："+ path);
		StringBuffer sf = request.getRequestURL(); //获取请求的url地址
		System.out.println("url = " + sf.toString());
		
		Enumeration en = request.getHeaderNames(); //获取http头文件内容
		while(en.hasMoreElements()) {
			Object o = en.nextElement();
			String v = request.getHeader(o.toString());
			System.out.println(o.toString() + " = " + v);
		}
		
		request.setCharacterEncoding("utf-8");
		String encoding = request.getCharacterEncoding(); //参数乱码可以得到一定的解决
		System.out.println("encoding = " + encoding);
		
		String param = request.getParameter("param");
		System.out.println("param = " + param);
		
		/**
		 * 获取客户端提交过来的参数乱码解决方法
		 * 1.统一客户端网页的编码 iso-8859-1 gbk gb2312 utf-8
		 * 
		 * 2.如果是url地址后面跟中文的参数 用request设置中文编码不起作用
		 * 解决：在Tomcat-->server.xml-->改Tomcat的8080端口号标签-->添加URIEncoding="UTF-8"
		 * 
		 * 3.如果是表单的post请求提交，用户request设置中文编码就可以
		 * 解决：request.setCharacterEncoding方法
		 */
	}
	
}
