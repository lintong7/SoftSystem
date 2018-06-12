package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

/**
 * BaseServlet主要完成对任意用户的请求进行处理的Servlet封装
 * 1.更新，删除，新增操作
 * 2.能够实现一个Servlet处理多种请求方式，简化在doGet方法中出现的大量if语句
 * 3.在后期系统的维护上面得到大大简化
 * 
 * 实现的封装的思路：
 * 1.Java反射技术来完成对Servlet的再一次封装
 * 2.f:/xxx 代表转发
 * 3.r:/xxx 代表重定向
 * @author LinTong
 *
 */
public class BaseServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //设置中文编码集
		String v = request.getParameter("v"); //定义为一个做出请求处理的方法名
		
		//判断是否是指定数组中的字符串，是，无参则执行其servlet中的query(req,resp)方法。（改写url地址）
		String path2 = request.getServletPath();
		String link = path2.substring(path2.lastIndexOf("/")+1,path2.lastIndexOf(".")); //获取截取的servlet名
		//String[] array = {"index","user","soft","log","catalog"}; //可接受无参v的排除数组
		//boolean flag = Arrays.asList(array).contains(link); //判断link是否在过滤数组中
		if (/*flag == true && */v == null) { //如果无参，默认执行query()方法
			v = "query";
		}
		
		Method method = null;
		try {
			method = getClass().getMethod(v, HttpServletRequest.class, HttpServletResponse.class);
		} catch (Exception e) {
			throw new RuntimeException("此方法"+v+"不存在", e);
		}
		//找到方法要执行的请求方法，则马上调用
		try {
			String result = (String) method.invoke(this, request, response);
			if (result != null && !result.trim().isEmpty()) {
				int index = result.indexOf(":");
				String param = result.substring(0, index); //判断冒号前面的字母
				String path = result.substring(index + 1); //判断冒号后面的页面地址
				if (param.equals("f")) { //forward转发
					request.getRequestDispatcher(path).forward(request, response);
				} else if (param.equals("r")) { //redirect重定向
					response.sendRedirect(path);
				} else if (param.equals("a")) { //write输出
					System.out.println("a");
					/*PrintWriter out = response.getWriter();
					out.print("<script>alert('w');</script>");*/
					PrintWriter out = response.getWriter();//通过servlet的doget方法获取response对象，通过getWriter方法获取PrintWriter对象
			         out.flush();//清空缓存
			         out.println("<script>");//输出script标签
			         out.println("alert('此用户名已存在，请重新输入！');");//js语句：输出alert语句
			         out.println("history.back();");//js语句：输出网页回退语句
			         out.println("</script>");//输出script结尾标签
					response.sendRedirect(path);
				} else if (param.equals("p")) {
					//p，直接将return过来的结果原封不动输出给jsp
					response.setCharacterEncoding("UTF-8");
					//response代表的是对客户端的响应，主要是将JSP容器处理过的对象传回到客户端。response对象也具有作用域，它只在JSP页面内有效。
					PrintWriter out = response.getWriter();
					out.print(path);
					out.close();
				}
			}
		} catch (Exception e) {
			throw new RuntimeException("方法执行失败", e);
		}
	}
	
}
