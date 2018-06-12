package dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * 完成对日志的数据访问操作
 * @author LinTong
 * Date    2018.5.11 15：38：30
 */
public class LogDao extends JdbcBuild {
	//日志列表
	public List<Map<String, Object>> getLogInfo() throws SQLException {
		String sql = "select l.*,u.username as admin_username from log l inner join user u on l.admin_id=u.id order by l.create_time desc";
		return getListForMap(sql);
	}
	
	//分页查询
	public List<Map<String, Object>> getLogByPage(long firstRow, long pageSize) throws SQLException {
		String sql = "select l.*,u.username as admin_username from log l inner join user u on l.admin_id=u.id order by l.create_time desc ";
		sql += "limit ?,?";
		Object[] param  = new Object[2];
		param[0] = firstRow;
		param[1] = pageSize;
		return getListForMap(sql, param);
	}
	
	//日志总数
	public int getLogCount() throws SQLException {
		String sql_log_count = "select count(*) as count from log where admin_id != ''";
		return query(sql_log_count);
	}
	
	//添加日志
	public int insert(Object... params) throws SQLException {
		String log_sql = "insert into log(info,type,ip,admin_id,create_time) values(?,?,?,?,?)";
		return insert(log_sql,params);
	}
	
}
