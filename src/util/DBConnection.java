package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * 利用c3p0获取数据库连接
 * 设计方式利用单例模式完成代码的设计
 * @author LinTong
 *
 */
public class DBConnection {
	private static DBConnection db = null;
	private static DataSource ds = null;
	
	private DBConnection() {
		if (ds == null) {
			//它会自动寻找配置文件c3p0-config.xml，节点为mysql的数据库【如果没有指定，就使用默认的！】
			ds = new ComboPooledDataSource("mysql");//初始化DataSource数据源
		}
	}
	
	private static DBConnection getInstance() { //初始化DBConnection的对象
		if (db == null) {
			db = new DBConnection();
		}
		return db;
	}
	
	private DataSource getDataSource() { //返回已经初始化好的DataSource对象
		return ds;
	}
	
	//获取链接
	public synchronized static Connection getConnection() throws SQLException {
		return getInstance().getDataSource().getConnection();
	}
	
	//关闭链接
	public synchronized static void closeConnection(Connection conn) throws SQLException {
		/**
		 * 1、conn != null 这个是不确定上面的connection是否被初始化而判断的，因为很多时候写代码，使用懒加载模式，
		 * 一般是先定义一个Connection conn=null,使用的时候才去初始化它的对象，这样可以减少内存的浪费。
		 * 这个时候如果不确定conn是否被初始化的时候，最好在关闭前加上conn != null判断，不然直接关闭conn有可能报空指针错误。 
		 * 2、conn.isClosed() 这个是判断当前连接是否被关闭，这个首先要保证Connection已经生成实例了。 
		 * 从程序的完善的角度上来看，在关闭连接的时候，最好两个都判断一下： 
		 * if(conn!=null&&!conn.isClosed()){ 
		 *     conn.close(); 
		 * }
		 */
		if (conn != null && !conn.isClosed()) {
			conn.close();
			conn = null;
		}
	}
}
