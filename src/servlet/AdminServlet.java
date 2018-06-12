package servlet;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SoftDao;
import dao.UserDao;

@WebServlet("/admin/index.jsp")
public class AdminServlet extends BaseServlet {
	
	public String query(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		//System.out.println("admin我来了");
		//软件数据统计
		SoftDao softDao = new SoftDao();
		int soft_count = softDao.getSoftCount(); // 软件总数
		//管理员列表
		UserDao userDao = new UserDao();
		int num = 3; // 首页要显示新注册的管理员的个数
		List<Map<String, Object>> user = userDao.getTOPUserList(num); // 管理员列表
		int user_count = userDao.getUserCount(); // 管理员总数
		Map<String, Object> historyData = softDao.getHistoryData(); // 历史总数据统计 
		
		request.setAttribute("user", user);
		request.setAttribute("user_count", user_count);
		request.setAttribute("soft_count", soft_count);
		request.setAttribute("historyData", historyData);
		return "f:/admin/admin.jsp";
	}
}
