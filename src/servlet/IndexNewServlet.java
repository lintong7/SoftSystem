package servlet;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IndexSoftDao;

@WebServlet("/newSoft.jsp")
public class IndexNewServlet extends BaseServlet {
	public String query(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		IndexSoftDao indexSoftDao = new IndexSoftDao();
		
		List<Map<String, Object>> list = indexSoftDao.getNewSoft(12); // 最新更新
		
		request.setAttribute("list", list); // 类似于map.put(key, value);直接目的数据放给JSP页面用
		return "f:/new.jsp";
	}
}
