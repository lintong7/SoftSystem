package servlet;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IndexSoftDao;

@WebServlet("/list.jsp")
public class IndexMoreServlet extends BaseServlet {
	public String query(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String id = request.getParameter("id"); //一级分类id
		
		IndexSoftDao indexSoftDao = new IndexSoftDao();
		
		Map<String, Object> catalog = indexSoftDao.getCatalogName(id); // 一级分类名
		List<Map<String, Object>> list = indexSoftDao.getMoreSoft(id); // 更多
		
		String CatalogName = (String) catalog.get("catalog"); //获取其一级分类名
		
		request.setAttribute("CatalogName", CatalogName);
		request.setAttribute("list", list); // 类似于map.put(key, value);直接目的数据放给JSP页面用
		return "f:/more.jsp";
	}
}
