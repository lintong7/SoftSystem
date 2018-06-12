package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import dao.IndexSoftDao;

/**
 * 前台各软件页面
 * @author LinTong
 * @date:  2018年5月19日 下午5:11:58
 * @Description: 处理各种来自前端的请求
 */
@WebServlet("/soft.jsp")
public class IndexSoftServlet extends BaseServlet {
	// 装机必备
	public String necessary(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		IndexSoftDao indexSoftDao = new IndexSoftDao();
		
		List<Map<String, Object>> list = indexSoftDao.getTOPSoft(5); // 各分类下载量TOP5的软件
		request.setAttribute("list", list); // 类似于map.put(key, value);直接目的数据放给JSP页面用
		return "f:/necessary.jsp"; // 转发到响应页面
	}
	
	// 下载排行
	
	// 最新更新
	
	// 软件详情
	public String info(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String id = request.getParameter("id");
		IndexSoftDao indexSoftDao = new IndexSoftDao();
		
		Map<String, Object> soft = indexSoftDao.getSoftInfo(id); //软件详情
		
		int num = 5; //显示5条
		int cid = (Integer) soft.get("cid");
		List<Map<String, Object>> top = indexSoftDao.getTOPSoftByClass(num,cid); //同类软件排行榜
		
		Map<String, Object> nav = indexSoftDao.getCatalogClassName(cid); //一级分类，二级分类名
		
		request.setAttribute("soft", soft);
		request.setAttribute("top", top);
		request.setAttribute("nav", nav);
		return "f:/detail.jsp";
	}
	
	// 软件下载
	public void download(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, SmartUploadException {
		String id = request.getParameter("id");
		IndexSoftDao indexSoftDao = new IndexSoftDao();
		
		Map<String, Object> softInfo = indexSoftDao.getSoftInfo(id); //软件详情
		
		String downurl = (String) softInfo.get("downurl"); //获取该软件的存储路径
		
		SmartUpload su = new SmartUpload();
		su.initialize(getServletConfig(), request, response); //初始化
		su.setContentDisposition(null); //表示这是一个下载操作
		su.downloadFile("/upload/"+ downurl); //下载
		
		// 数据库更新该软件的下载量
		indexSoftDao.updateDownloadCount(id);
	}
	
	// 点赞
	public String like(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		String id = request.getParameter("id");
		IndexSoftDao indexSoftDao = new IndexSoftDao();
		
		// 数据库更新该软件的点赞数
		indexSoftDao.updateLike(id);
		
		return "p:success";
	}
}
