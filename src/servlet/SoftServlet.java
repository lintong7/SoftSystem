package servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.sun.org.apache.bcel.internal.generic.NEW;

import dao.LogDao;
import dao.SoftDao;
import dao.UserDao;
import domain.LogMsg;
import entity.Soft;
import util.PropertiesUtils;
import util.UUIDUtils;
import vo.Page;

@WebServlet("/admin/soft.jsp")
public class SoftServlet extends BaseServlet {
	
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
		
		int count = (int) softDao.getSoftCount(); // 软件总数
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
		
		List<Map<String, Object>> list = softDao.getSoftByPage(firstRow, pageSize);
		
		Page<Soft> page = new Page<>();
		page.setContent(list);
		page.setPageNumber(pageNumber);
		page.setPageSize(pageSize);
		page.setTotalPages(totalPages);
		request.setAttribute("page", page);
		
		request.setAttribute("list", list); // 类似于map.put(key, value);直接目的数据放给JSP页面用
		return "f:/admin/soft2.jsp"; // 指定响应给用户页面
	}
	
	// 加载添加软件页面
	public String add(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		SoftDao softDao = new SoftDao();
		List<Map<String, Object>> soft_catalog = softDao.getCatalog(); //一级分类
		
		request.setAttribute("soft_catalog", soft_catalog);
		return "f:/admin/soft_add_edit.jsp"; // 指定响应给软件添加页面
	}
	
	public String list(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String i = request.getParameter("catalog_id");
		SoftDao softDao = new SoftDao();
		List<Map<String, Object>> soft_class = softDao.getClassByCatalog_id(i);
	    JSONObject json = new JSONObject();
		for(Map<String, Object> map : soft_class){
			String arr[] = new String[2];
			int k = 0;
			for (Object value : map.values()) {
				arr[k] = value.toString();
				k++;
			}
			json.put(arr[0], arr[1]);
		}
		return "p:" + json.toString();
	}
	
	// 添加软件
	public String addSoft(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SmartUploadException, SQLException {
		PropertiesUtils pro = new PropertiesUtils();
		String uploadPath = pro.getProperty("uploadPath"); //获取上传到的根目录
		
		//设置上传文件保存根目录
		File file = new File(uploadPath);
		if (!file.exists()) {
			file.mkdir();
		}
		
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(), request, response); //初始化对象
		su.upload(); //上传文件
		
		// 获取表单信息
		String softname = su.getRequest().getParameter("softname");
		System.out.println("softname:" + softname);
		String cid = su.getRequest().getParameter("cid");
		String version = su.getRequest().getParameter("version");
		String type = su.getRequest().getParameter("type");
		String language = su.getRequest().getParameter("language");
		String impower = su.getRequest().getParameter("impower");
		String size = null;
		String system = su.getRequest().getParameter("system");
		String homepage = su.getRequest().getParameter("homepage");
		String email = su.getRequest().getParameter("email");
		String icon = su.getRequest().getParameter("icon");
		String soft = su.getRequest().getParameter("soft");
		String body = su.getRequest().getParameter("body");
		
		String status = "fail";
		String msg = null;
		Integer k = 0;
		String newIconName = null;
		String newSoftName = null;
		for(int i =0; i < su.getFiles().getCount(); i++){
			com.jspsmart.upload.File tempFile = su.getFiles().getFile(i);
			
			String fieldName = tempFile.getFieldName(); //表单字段名
			Integer fieldSize = tempFile.getSize();     //文件大小			
			String ext = tempFile.getFileExt().toLowerCase(); //拓展名(转小写)
			
			DecimalFormat df = new DecimalFormat("0.00");//格式化小数
			String uuid = UUIDUtils.getUUID(); //生成UUID
			
			//上传图标icon
			if (fieldName.equals("icon")) {
				Integer MaxIconFileSize = 1024*1024*1; //图标大小允许2M以内
				String[] AllowedIconFileExtList = {"png", "jpg", "jpeg", "gif", "bmp"}; //允许图标类型
				List<String> list = Arrays.asList(AllowedIconFileExtList); //数组转泛型
				//判断图标是否符合上传要求（后缀名，大小）
				if (fieldSize == 0) {
					msg = "请上传图标！";
					k++;
				}else if (list.contains(ext) == false) {
					msg = "图标格式错误！只允许上传以下格式：png、jpg、jpeg、gif、bmp";
					k++;
				}else if (fieldSize > MaxIconFileSize) {
					msg = "图标上传失败！文件大小:"+df.format((float)fieldSize/1024/1024)+"M超出了限定的范围(最大"+ MaxIconFileSize/1024/1024+"M)";
					k++;
				}
				if (k > 0) {
					break; //文件不符合要求，退出循环
				}
				File iconPath = new File(uploadPath + "/icon"); //图标保存目录
				if (!iconPath.exists()) {
					iconPath.mkdir();
				}
				newIconName = uuid + "." + ext; //图标重命名
				
				//保存图标到指定目录
				tempFile.saveAs(iconPath + "/" + newIconName);
				
			}
			//上传软件soft
			else if (fieldName.equals("soft") && fieldSize > 0) {
				Integer MaxSoftFileSize = 1024*1024*500; //软件大小允许500M以内
				String[] AllowedSoftFileExtList = {"exe", "apk", "ipa", "deb", "rpm", "tar.gz", "bin"}; //允许软件类型
				List<String> list = Arrays.asList(AllowedSoftFileExtList); //数组转泛型
				//判断图标是否符合上传要求（后缀名，大小）
				if (fieldSize == 0) {
					msg = "请上传软件！";
					k++;
				}else if (list.contains(ext) == false) {
					msg = "软件格式错误！只允许上传以下格式：exe、apk、ipa、deb、rpm、tar.gz、bin";
					k++;
				}else if (fieldSize > MaxSoftFileSize) {
					msg = "软件上传失败！文件大小:"+df.format((float)fieldSize/1024/1024)+"M超出了限定的范围(最大"+ MaxSoftFileSize/1024/1024+"M)";
					k++;
				}
				if (k > 0) {
					break; //文件不符合要求，退出循环
				}
				size = df.format((float)fieldSize/1024/1024); //读取软件大小，保留两位小数
				
				File softPath = new File(uploadPath + "/" + system); //软件保存目录
				if (!softPath.exists()) {
					softPath.mkdir();
				}
				newSoftName = uuid + "." + ext; //软件重命名

				//保存软件到指定目录
				tempFile.saveAs(softPath + "/" + newSoftName);
			}
		}
		// 上传失败，返回
		HttpSession session = request.getSession();
		if (msg == null) {
			//插入数据库
			Date date = new Date();
			long longTime = date.getTime();
	        Timestamp create_time = new Timestamp(longTime); // 创建时间
	        String downurl = system + "/" + newSoftName; //软件相对路径

	        SoftDao softDao = new SoftDao();
	        Integer id = softDao.insert(softname,cid,version,type,language,impower,size,system,homepage,email,newIconName,body,downurl,create_time);
	        // 插入日志（软件添加操作）
			LogDao logDao = new LogDao();
	
			Integer admin_id = (Integer) session.getAttribute("id"); // 管理员ID
			String info = "添加软件： " + softname + "（ID：" + id + "），成功"; // 日志信息
			String log_type = LogMsg.INSERT; // 登录
			String ip = request.getRemoteAddr(); // IP地址
			
			logDao.insert(info,log_type,ip,admin_id,create_time); // 插入
			
			status = "success";
			msg = "软件" + softname + "，添加成功！";
		}
		
		return "p:" + status + "|" + msg;
		//session.setAttribute("msg", msg);		
		//return "r:" + request.getContextPath() + "/admin/soft_add_edit.jsp"; // 返回软件添加页
	}
	
	// 初始化修改软件信息
	public String edit(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		SoftDao softDao = new SoftDao();
		String id = request.getParameter("id");
		
		Map<String, Object> info = softDao.getSoftInfo(id); //获取软件详情
		List<Map<String, Object>> soft_catalog = softDao.getCatalog(); //一级分类
		
		request.setAttribute("info", info);
		request.setAttribute("soft_catalog", soft_catalog);
		return "f:/admin/soft_add_edit.jsp";
	}
	
	// 修改软件信息
	public String editSoft(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		SmartUpload su = new SmartUpload();
		// 获取表单信息
		String name = su.getRequest().getParameter("name");
		String cid = su.getRequest().getParameter("cid");
		String version = su.getRequest().getParameter("version");
		String type = su.getRequest().getParameter("type");
		String language = su.getRequest().getParameter("language");
		String impower = su.getRequest().getParameter("impower");
		/*String size = su.getRequest().getParameter("size");*/
		String system = su.getRequest().getParameter("system");
		String homepage = su.getRequest().getParameter("homepage");
		String email = su.getRequest().getParameter("email");
		/*String icon = su.getRequest().getParameter("icon");
		String soft = su.getRequest().getParameter("soft");*/
		String body = su.getRequest().getParameter("body");
		
		SoftDao softDao = new SoftDao();
		
		return "r:" + request.getContextPath() + "/admin/soft.jsp?v=query";
	}
	
	// 软件详情
	public String softInfo(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		SoftDao softDao = new SoftDao();
		String id = request.getParameter("id");
		
		Map<String, Object> info = softDao.getSoftInfo(id); //获取软件详情
		//获取软件cid
		int cid = (int) info.get("cid");
		Map<String, Object> cn = softDao.getClassById(cid); //获取分类信息
		request.setAttribute("cn", cn);
		request.setAttribute("info", info);
		return "f:/admin/softInfo.jsp"; // 指定响应给详情页面
	}
	
	// 软件下载
	public void download(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String id = request.getParameter("id");
		SoftDao softDao = new SoftDao();
		Object[] softInfo = softDao.getSoftFieldInfo(id);
		String downurl = (String) softInfo[2]; //获取该软件的存储路径
		
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(), request, response); //初始化
		su.setContentDisposition(null); //表示这是一个下载操作
		try {
			su.downloadFile("/upload/"+ downurl); //下载
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
		
		// 数据库更新该软件的下载量
		softDao.updateDownloadCount(id);
	}
	
	// 删除软件
	public String del(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		String msg = null;
		String id = request.getParameter("id");
		SoftDao softDao = new SoftDao();
		Object[] softInfo = softDao.getSoftFieldInfo(id);//软件部分字段信息
		
		PropertiesUtils pro = new PropertiesUtils();
		String uploadPath = pro.getProperty("uploadPath"); //获取文件保存的根目录
		//删除软件和图标文件
		String softName = (String) softInfo[0]; //软件名
		String icon = (String) softInfo[1]; //图标文件名
		String downurl = (String) softInfo[2]; //该软件的存储路径
		String iconFileName = uploadPath + "/icon/" + icon; //图标所在位置
		String softFileName = uploadPath + "/" + downurl; //软件名所在位置
		Boolean icdel = deleteFile(iconFileName); //删除图标
		Boolean sfdel = deleteFile(softFileName); //删除软件
		
		if ((icdel || sfdel) == false) {
			msg = "删除软件失败！";
		}else {
			softDao.deleteSoftById(id); //删除表记录
			
			// 插入日志（登录操作）
			LogDao logDao = new LogDao();
			
			Integer admin_id = (Integer) session.getAttribute("id"); //管理员ID
			String admin_user = (String) session.getAttribute("user"); //管理员
			String info = "删除软件【" + softName + "】（编号" + id + "）"; // 日志信息
			String type = LogMsg.DELETE; // 删除
			String ip = request.getRemoteAddr(); // IP地址
			Date create_time = new Date(); // 创建时间
			logDao.insert(info,type,ip,admin_id,create_time); // 插入
			
			msg = "删除成功！";
		}
		
		session.setAttribute("msg", msg);
		return "r:" + request.getContextPath() + "/admin/soft2.jsp?v=query";
	}
	
	/**
     * 删除单个文件
     * @param fileName 要删除的文件的文件名
     * @return 单个文件删除成功返回true，否则返回false
     */
	public static boolean deleteFile(String fileName) {
		File file = new File(fileName);
		// 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				System.out.println("删除单个文件" + fileName + "成功！");
				return true;
			} else {
				System.out.println("删除单个文件" + fileName + "失败！");
				return false;
			}
		} else {
			System.out.println("删除单个文件失败：" + fileName + "不存在！");
			return false;
		}
	}
}
