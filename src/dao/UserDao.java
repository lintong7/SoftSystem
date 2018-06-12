package dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 完成对管理员管理操作的数据访问，更新，添加，删除一系列操作
 * @author LinTong
 *
 */
public class UserDao extends JdbcBuild {
	//查询所有管理员
	public List<Map<String, Object>> getUserInfo() throws SQLException {
		String sql = "select * from user";
		return getListForMap(sql);
	}

	//管理员总数
	public int getUserCount() throws SQLException {
		String sql_user_count = "select count(*) as count from user";
		return query(sql_user_count);
	}
	
	//分页查询
	public List<Map<String, Object>> getUserByPage(long firstRow, long pageSize) throws SQLException {
		String sql = "select * from user order by create_time desc limit ?,?";
		Object[] param  = new Object[2];
		param[0] = firstRow;
		param[1] = pageSize;
		return getListForMap(sql, param);
	}
	
	//登录验证
	public Map<String, Object> checkLogin(String username,String password) throws SQLException {
		String sql = "select * from user where (username = ? or email = ?) and password = ? limit 1";
		String param[] = {username,username,password}; //打包数组传参给占位符
		return getMapHandler(sql,param);
	}
	
	//注册
	public int register(String username, String name, String email, String password,Date create_time) throws SQLException {
		String sql = "insert into user(username,password,name,email,create_time)values(?,?,?,?,?)";
		return insert(sql, username, password, name, email, create_time);
	}
	
	//查询是否存在此管理员（登录、注册是否占用验证）
	public Map<String, Object> isExistUser(String username, String email) throws SQLException{
		String sql = "select * from user where username = ? or email = ? limit 1";
		return getMapHandler(sql, username, email);
	}
	
	//查询管理员信息
	public Map<String, Object> getUserById(String id) throws SQLException{
		String sql = "select * from user where id=?";
		return getMapHandler(sql,id);
	}
	
	//更新管理员信息
	public int updateUserById(Object... params) throws SQLException {
		String sql = "update user set name=?,email=?,password=? where id=?";
		return update(sql, params);
	}
	
	//删除管理员
	public int deleteUserById(String id) throws SQLException{
		String sql = "delete from user where id= ?";
		return update(sql, id);
	}	
	
	//修改权限（超管、普通）、状态（激活、冻结）等操作
	public int setStatus(String field, Integer newKey, String id) throws SQLException {
		String sql = "update user set ";
		if (field.equals("authority")) {			
			sql += "authority=? ";
		}else if (field.equals("status")) {
			sql += "status=? ";
		}
		sql +="where id=?";

		return update(sql, newKey, id);
	}
	
	/**
	 * 以下是后台首页
	 */
	//查询所有管理员
	public List<Map<String, Object>> getTOPUserList(int num) throws SQLException {
		String sql = "select * from user order by create_time desc limit ?";
		return getListForMap(sql, num);
	}
	
	
}
