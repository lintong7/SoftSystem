package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 前台软件查询
 * @author LinTong
 * @date:  2018年5月19日 下午5:21:00
 * @Description:完成对前台软件请求的数据一系列查询操作
 */
public class IndexSoftDao extends JdbcBuild {
	// 装机必备（返回各分类的下载量TOP5的软件）
	public List<Map<String, Object>> getTOPSoft(int num) throws SQLException {
		String sql = "select s1.id,s1.name,s1.icon from soft s1 " + 
				"WHERE (select COUNT(*) from soft s2 where s2.cid= s1.cid " +
				"and s2.down_count > s1.down_count) <= ? " + 
				"ORDER BY s1.cid,s1.down_count";
		return getListForMap(sql,num);
	}
	
	// 最新更新
	public List<Map<String, Object>> getNewSoft(int num) throws SQLException {
		String sql = "select id,name,icon from soft order by create_time desc limit ?";
		return getListForMap(sql,num);
	}
	
	// 更多
	public List<Map<String, Object>> getMoreSoft(String id) throws SQLException {
		String sql = "select id,name,icon from soft where cid in (select c.cid from soft_class c,soft_catalog l where c.catalog_id = l.id and l.id = ? ) order by thumb_up desc";
		return getListForMap(sql,id);
	}
	
	// 一级分类
	public List<Object[]> getCatalogList() throws SQLException {
		String sql = "select id,catalog from soft_catalog order by id";
		return ArrayListHandler(sql);
	}
	
	// 软件详情
	public  Map<String, Object> getSoftInfo(String id) throws SQLException {
		String sql = "select * from soft where id = ?";
		return getMapHandler(sql, id);
	}
	
	// 获取指定字段信息(软件名，图标名，软件存储路径)
	public Object[] getSoftFieldInfo(String id) throws SQLException {
		String sql = "select name,icon,downurl from soft where id=?";
		return ArrayHandler(sql,id);
	}
	
	// 更新下载量
	public int updateDownloadCount(String id) throws SQLException {
		String sql = "update soft set down_count=down_count+1 where id=?";
		return update(sql, id);
	}
	
	// 点赞
	public int updateLike(String id) throws SQLException {
		String sql = "update soft set thumb_up=thumb_up+1 where id=?";
		return update(sql, id);
	}
	
	// TOP排行榜
	public List<Map<String, Object>> getTOPSoftByClass(int i,int cid) throws SQLException{
		String sql = "select id,name,icon,downurl from soft where cid=? order by down_count desc limit ?";
		return getListForMap(sql,cid,i);
	}
	
	// 通过id获取其一级分类名
	public Map<String, Object> getCatalogName(String id) throws SQLException {
		String sql = "select catalog from soft_catalog where id = ?";
		return getMapHandler(sql, id);
	}

	// 通过cid获取其一级分类名、二级分类名
	public Map<String, Object> getCatalogClassName(int cid) throws SQLException {
		String sql = "select c.name,l.catalog from soft_class c,soft_catalog l where c.cid = ? and c.catalog_id = l.id";
		return getMapHandler(sql, cid);
	}
}
