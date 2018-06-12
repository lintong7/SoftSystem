package servlet;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IndexSoftDao;

@WebServlet("/index.jsp")
public class IndexServlet extends BaseServlet {
	// 首页
	public String query(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		IndexSoftDao indexSoftDao = new IndexSoftDao();
		List<Object[]> catalog = indexSoftDao.getCatalogList();
		
		request.setAttribute("catalog", catalog); // 类似于map.put(key, value);直接目的数据放给JSP页面用
		return "f:/index2.jsp"; // 指定响应给页面
	}
	
}
