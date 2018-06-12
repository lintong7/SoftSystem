package servlet;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SoftDao;
import entity.Soft;
import vo.Page;

@WebServlet("/admin/catalog.jsp")
public class SoftClassServlet extends BaseServlet {
	public String query(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		SoftDao softDao = new SoftDao();
		// ------------------------分页开始------------------------
		Long pageNumber = null;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Long.parseLong(request.getParameter("pageNumber"));
		}
		if (pageNumber == null) {
			// 没有传入页码，默认第一页
			pageNumber = 1L;
		}
		
		int count = (int) softDao.getCatalogCount(); // 一级分类总数
		long pageSize = 5L; // 每页多少条记录
		// 计算总页数，如果总记录数能够被pageSize整除，那么商就是总页数；如果不能整除则需要加1
		long totalPages = (long) (count % pageSize == 0 ? count / pageSize : count / pageSize + 1);

		// 判断pageNumber是否大于totalPages，如果大于则直接把pageNumber设置totalPages（最后一页）
		if (pageNumber > totalPages) {
			pageNumber = totalPages;
		}

		// 计算开始行号
		// 第一页: 0 ~ 2，一共3条
		// 第二页: 3 ~ 5
		// 第三页: 6 ~ 8
		// 当前页码减去1，乘以每页记录数
		long firstRow = (pageNumber - 1) * pageSize;
		// ------------------------分页结束------------------------
		
		List<Map<String, Object>> list = softDao.getCatalogByPage(firstRow, pageSize);
		
		Page<Soft> page = new Page<>();
		page.setContent(list);
		page.setPageNumber(pageNumber);
		page.setPageSize(pageSize);
		page.setTotalPages(totalPages);
		request.setAttribute("page", page);
		
		request.setAttribute("list", list); // 类似于map.put(key, value);直接目的数据放给JSP页面用
		return "f:/admin/soft_class.jsp"; // 指定响应给用户页面
	}
	
	
}
