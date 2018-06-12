package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 完成对软件列表的数据访问，更新，添加，删除一系列操作
 * @author LinTong Date 2018.4.28 22：24：06
 */
public class SoftDao extends JdbcBuild {
	// 软件列表
	public List<Map<String, Object>> getSoftList() throws SQLException {
		String sql = "select * from soft order by id";
		return getListForMap(sql);
	}

	// 软件详情
	public Map<String, Object> getSoftInfo(String id) throws SQLException {
		String sql = "select * from soft where id = ?";
		return getMapHandler(sql, id);
	}

	// 更新软件

	// 删除软件
	public int deleteSoftById(String id) throws SQLException {
		String sql = "delete from soft where id= ?";
		return update(sql, id);
	}

	// 软件总数
	public int getSoftCount() throws SQLException {
		String sql = "select count(*) as count from soft";
		return query(sql);
	}

	// 分页查询
	public List<Map<String, Object>> getSoftByPage(long firstRow, long pageSize) throws SQLException {
		String sql = "select * from soft order by create_time desc limit ?,?";
		return getListForMap(sql, firstRow, pageSize);
	}

	// 添加软件
	public int insert(Object... params) throws SQLException {
		String sql = "insert into soft(name,cid,version,type,language,impower,size,system,homepage,email,icon,body,downurl,create_time)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return insert(sql, params);
	}

	// 一级分类
	public List<Map<String, Object>> getCatalog() throws SQLException {
		String sql = "select id,catalog from soft_catalog order by id";
		return getListForMap(sql);
	}

	// 一级分类（分页查询）
	public List<Map<String, Object>> getCatalogByPage(long firstRow, long pageSize) throws SQLException {
		String sql = "select * from soft_catalog order by id desc limit ?,?";
		return getListForMap(sql, firstRow, pageSize);
	}
	
	// 一级分类总数
	public int getSoftCatalogCount() throws SQLException {
		String sql = "select count(*) as count from soft_catalog";
		return query(sql);
	}
	
	// 二级分类
	public List<Map<String, Object>> getSoftClass() throws SQLException {
		String sql = "select cid,catalog_id,name from soft_class order by catalog_id";
		return getListForMap(sql);
	}

	// 获取二级分类中最大的一级分类ID
	public Object[] getMaxMINCatalogID() throws SQLException {
		String sql = "select max(catalog_id) as max,min(catalog_id) as min from soft_class";
		return ArrayHandler(sql);
	}
	
	// 获取一级分类总数
	public int getCatalogCount() throws SQLException {
		String sql = "select count(*) from soft_catalog";
		return query(sql);
	}
	
	// 获取二级分类总数
	public int getClassCount() throws SQLException {
		String sql = "select count(*) from soft_class";
		return query(sql);
	}

	// 更新下载量
	public int updateDownloadCount(String id) throws SQLException {
		String sql = "update soft set down_count=down_count+1 where id=?";
		return update(sql, id);
	}
	
	// 获取指定字段信息(软件名，图标名，软件存储路径)
	public Object[] getSoftFieldInfo(String id) throws SQLException {
		String sql = "select name,icon,downurl from soft where id=?";
		return ArrayHandler(sql,id);
	}
	
	public List<Map<String, Object>> getClassByCatalog_id(String i) throws SQLException {
		/*String sql = "select cid,name from soft_class where catalog_id=("
				+ "select id from soft_catalog order by id asc limit ?,1)";
		return getMapHandler(sql,i);*/
		String sql = "select cid,name from soft_class where catalog_id = ?";
		return getListForMap(sql,i);
	}
	
	public Map<String, Object> getClassById(int i) throws SQLException {
		String sql = "select s.name as name,c.catalog as catalog from soft_class s,soft_catalog c where s.cid = ? "
				+ "and s.catalog_id = c.id";
		return getMapHandler(sql, i);
	}
	
	/**
	 * 以下是后台首页
	 */
	//历史总数据统计
	public Map<String, Object> getHistoryData() throws SQLException {
		String sql = "select sum(down_count) as down_count,sum(thumb_up) as thumb_up,sum(page_view) as page_view from soft";
		return getMapHandler(sql);
	}

}
