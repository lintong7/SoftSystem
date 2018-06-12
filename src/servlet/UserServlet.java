package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LogDao;
import dao.UserDao;
import domain.LogMsg;
import entity.User;
import vo.Page;

@WebServlet("/admin/user.jsp")
public class UserServlet extends BaseServlet {

	public String query(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		UserDao userDao = new UserDao();
		// ------------------------分页开始------------------------
		Long pageNumber = null;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Long.parseLong(request.getParameter("pageNumber"));
		}
		if (pageNumber == null) {
			// 没有传入页码，默认第一页
			pageNumber = 1L;
		}
		
		int count = (int) userDao.getUserCount(); // 日志总数
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
		
		List<Map<String, Object>> list = userDao.getUserByPage(firstRow, pageSize);
		
		Page<User> page = new Page<>();
		page.setContent(list);
		page.setPageNumber(pageNumber);
		page.setPageSize(pageSize);
		page.setTotalPages(totalPages);
		request.setAttribute("page", page);
		
		request.setAttribute("list", list); // 类似于map.put(key, value);直接目的数据放给JSP页面用
		return "f:/admin/users.jsp"; // 指定响应给用户的页面地址
	}
	
	// 删除管理员
	public String del(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String userid = request.getParameter("id");
		UserDao userDao = new UserDao();
		Map<String, Object> rs = userDao.getUserById(userid);
		
		userDao.deleteUserById(userid); //删除
		
		HttpSession session = request.getSession();
		
		// 插入日志（删除操作）
		LogDao logDao = new LogDao();
		
		Integer admin_id = (Integer) session.getAttribute("id"); // 管理员ID
		String info = "删除管理员：" + rs.get("username"); // 日志信息
		String type = LogMsg.DELETE; // 删除
		String ip = request.getRemoteAddr(); // IP地址
		Date create_time = new Date(); // 创建时间
		
		logDao.insert(info,type,ip,admin_id,create_time); // 插入
		
		String msg = "删除管理员：" + rs.get("username") + "成功";

		session.setAttribute("msg", msg);
		
		return "r:" + request.getContextPath() + "/admin/user.jsp?v=query";
	}

	public String login(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, NoSuchFieldException {
		String username = request.getParameter("username"); // 获取表单中提交的数据
		String password = request.getParameter("password");

		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		// 数据库检验
		UserDao userDao = new UserDao();
		Map<String, Object> rs = userDao.checkLogin(username, password);
		
		Integer status = 2; //暂时随便赋个初始值
		if (!(rs == null || rs.size() == 0)) {
			status = (Integer) rs.get("status"); // 非空状态，取实际值，激活状态（0未激活，1正常使用）
		}
		
		if (status == 1) {
			Integer id = (Integer) rs.get("id"); // 管理员ID
			String user = (String) rs.get("username"); // 用户名
			String name = (String) rs.get("name"); //姓名
			String email = (String) rs.get("email"); // 邮箱
			Integer authority = (Integer) rs.get("authority"); // 管理员权限
			String register_time = sdf.format((Date) rs.get("create_time")); //注册时间

			// 返回这个request绑定的session对象，如果没有，则创建一个
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("user", user);
			session.setAttribute("password", password);
			session.setAttribute("name", name);
			session.setAttribute("email", email);
			session.setAttribute("authority", authority);
			session.setAttribute("status", status);
			session.setAttribute("create_time", register_time);

			// 插入日志（登录操作）
			LogDao logDao = new LogDao();

			Integer admin_id = id; // 管理员ID
			String info = "管理员：" + username + LogMsg.LOGIN_SYSTEM; // 日志信息
			String type = LogMsg.LOGIN; // 登录
			String ip = request.getRemoteAddr(); // IP地址
			Date create_time = date; // 创建时间
			
			logDao.insert(info,type,ip,admin_id,create_time); // 插入
			
			return "p:success|";
		} else {
			Map<String, Object> rs2 = userDao.isExistUser(username, username); //仅查询该用户是否已存在
			String info = null;
			// 有，密码错误或账号被冻结，记录登录失败操作
			if (rs2 != null && rs2.size() > 0) {
				// 插入日志（登录操作）
				LogDao logDao = new LogDao();

				Integer admin_id = (Integer) rs2.get("id"); // 管理员ID
				
				if (rs == null) { //账号密码不正确
					info = username + LogMsg.PASSWORD_ERROR; // 密码错误
				}else if (status == 0) {
					info = LogMsg.NOT_ACTIVE; // 冻结状态			
				}
				String type = LogMsg.LOGIN; // 登录
				String ip = request.getRemoteAddr(); // IP地址
				Date create_time = date; // 创建时间

				logDao.insert(info,type,ip,admin_id,create_time); // 插入
			}else {
				info = "账号不存在！";
			}
			return "p:fail|" + info;
		}
	}

	// 注册管理员
	public String register(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// 获取表单信息
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		// 判断表单信息是否被占用（已注册）
		UserDao userDao = new UserDao();
		
		Map<String, Object> rs2 = userDao.isExistUser(username,email); //查询该用户是否已存在

		HttpSession session = request.getSession();
		Date date = new Date();
		
		// 不存在，注册成功，插入日志，返回登录页操作
		if (rs2 == null) {
			long longTime = date.getTime();
	        Timestamp create_time = new Timestamp(longTime); // 创建时间
			userDao.register(username, name, email, password, create_time); //注册
			
			// 管理员通过， 插入日志（注册操作）
			LogDao logDao = new LogDao();
			
			Integer admin_id = null; // 管理员ID
			String info = username + LogMsg.REGISTER_SUCCESS; // 日志信息
			String type = LogMsg.REGISTER; // 注册
			String ip = request.getRemoteAddr(); // IP地址

			logDao.insert(info,type,ip,admin_id,create_time); // 插入日志
			
			session.setAttribute("msg", "注册成功！");
			return "r:" + request.getContextPath() + "/admin/login.jsp"; // 返回登录页
		}else {
			//注册失败，返回注册页
			return "w:" + request.getContextPath() + "/admin/register.jsp"; // 返回注册页
		}				
	}
	
	public String edit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String v = request.getParameter("v");
		String id = request.getParameter("id");
		UserDao userDao = new UserDao();
		Map<String, Object> user = userDao.getUserById(id);
		
		request.setAttribute("v", v);
		request.setAttribute("edit_id", user.get("id"));
		request.setAttribute("edit_username", user.get("username"));
		request.setAttribute("edit_name", user.get("name"));
		request.setAttribute("edit_email", user.get("email"));
		request.setAttribute("edit_password", user.get("password"));
		
		return "f:/admin/user_add_edit.jsp";
	}
	
	// 修改管理员信息
	public String editUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// 获取表单信息
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDao userDao = new UserDao();
		
		// 判断name或者email是否已被占用
		Object[] checkEmailparam = new Object[1];
		checkEmailparam[0] = email;
		Map<String, Object> user = userDao.isExistUser(name,email);
		
		// 已存在，修改失败，返回修改，重新提交
		if (!user.isEmpty()) {
			return "r:" + request.getContextPath() + "/admin/user_add_edit.jsp";
		}
		
		userDao.updateUserById(name,email,password,id);
		
		return "r:" + request.getContextPath() + "/admin/user.jsp";
	}
	
	// 超管、冻结操作
	public String set(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// 获取表单信息，并且按非操作
		String f = request.getParameter("f");
		String id = request.getParameter("id");
		
		String msg = null;
		
		//先找到该字段的值
		UserDao userDao = new UserDao();
		
		Map<String, Object> user = userDao.getUserById(id);
		
		String username = (String) user.get("username");
		
		Integer oldKey = (Integer) user.get(f); // 该字段的值
		
		int newKey = oldKey == 1?0:1;
		
		//判断是否存在需要修改的字段名，没有，请求体不完整
		if (oldKey != null) {
			Integer result = userDao.setStatus(f,newKey,id); //修改操作
			if (result != null) {
				Date date = new Date();
				long longTime = date.getTime();
		        Timestamp create_time = new Timestamp(longTime); // 创建时间
				// 超级管理员操作， 插入日志（权限、激活操作）
				LogDao logDao = new LogDao();
				
				HttpSession session = request.getSession();
				
				// 关键字
				String key = null;
				String value = null;
				if (f.equals("authority")) {			
					key = "权限";
					value = newKey == 1 ? "超管" : "普通";
					msg = "管理员:" + username + key + "成功设为：【" + value + "】";
				}else if (f.equals("status")) {
					key = "状态";
					value = newKey == 1 ? "激活" : "冻结";
					msg = "管理员:" + username + "【" + value + "】成功！";
				}
				
				Integer admin_id = (Integer) session.getAttribute("id"); // 管理员ID
				String info = username + "的【" + key + "】被修改为：" + "【" + value + "】"; // 日志信息
				String type = LogMsg.EDIT; // 类型
				String ip = request.getRemoteAddr(); // IP地址
				
				logDao.insert(info,type,ip,admin_id,create_time); // 插入日志
			}
		}
		
		return "p:"+msg; //返回提示信息
	}
	
	// 批量删除管理员
	public String delAll(HttpServletRequest request, HttpServletResponse response) {
		String[] del = request.getParameterValues("ck");
		for (String s : del) {
			System.out.println("s = " + s);
		}
		return "r:" + request.getContextPath() + "/admin/user.jsp?v=query";
	}

	// 退出系统
	public String layout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("user"); // 清除session
		return "r:" + request.getContextPath() + "/admin/login.jsp"; // 返回登录页面
	}
}
