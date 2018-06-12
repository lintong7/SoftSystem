package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.json.JSONObject;

import entity.Soft;
import util.DBConnection;

/**
 * DBUtil组件
 * 作用：对dbutil组件进行简单封装，为了更加方便我们dao层数据提供操作
 * @author LinTong
 * 【各种handler说明】：
 * ArrayHandler：把结果集中的第一行数据转成对象数组。
 * ArrayListHandler：把结果集中的每一行数据都转成一个对象数组，再存放到List中。
 * BeanHandler：将结果集中的第一行数据封装到一个对应的JavaBean实例中。
 * BeanListHandler：将结果集中的每一行数据都封装到一个对应的JavaBean实例中，存放到List里。
 * ColumnListHandler：将结果集中某一列的数据存放到List中。
 * KeyedHandler：将结果集中的每一行数据都封装到一个Map里，然后再根据指定的key把每个Map再存放到一个Map里。
 * MapHandler：将结果集中的第一行数据封装到一个Map里，key是列名，value就是对应的值。
 * MapListHandler：将结果集中的每一行数据都封装到一个Map里，然后再存放到List。
 * ScalarHandler：将结果集中某一条记录的其中某一列的数据存成Object。
 */
public abstract class JdbcBuild {
	/**
	 * 返回Map键值对集合
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	Map<String, Object> getMapHandler(String sql,Object... params) throws SQLException{
		Connection conn = DBConnection.getConnection();
		QueryRunner queryRunner = new QueryRunner();
		Map<String, Object> list = queryRunner.query(conn, sql, new MapHandler(), params);
		DBConnection.closeConnection(conn);
		return list;
	}
	/**
	 * 返回List集合，且集合中存储的Map对象
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	List<Map<String, Object>> getListForMap(String sql,Object... params) throws SQLException {
		Connection conn = DBConnection.getConnection();
		QueryRunner queryRunner = new QueryRunner();
		List<Map<String, Object>> list = queryRunner.query(conn, sql, new MapListHandler(), params);
		DBConnection.closeConnection(conn);
		return list;
	}
	
	int update(String sql,Object... params) throws SQLException {
		Connection conn = DBConnection.getConnection();
		QueryRunner queryRunner = new QueryRunner();
		int i = queryRunner.update(conn, sql, params);
		DBConnection.closeConnection(conn);
		return i;
	}

	@SuppressWarnings("unchecked")
	int insert(String sql,Object... params) throws SQLException {
		Connection conn = DBConnection.getConnection();
		QueryRunner queryRunner = new QueryRunner();
		int i = (int)(long) queryRunner.insert(conn, sql, new ScalarHandler(), params);
		DBConnection.closeConnection(conn);
		return i;
	}
	
	@SuppressWarnings("unchecked")
	int query(String sql,Object... params) throws SQLException {
		Connection conn = DBConnection.getConnection();
		QueryRunner queryRunner = new QueryRunner();
		int i = (int)(long) queryRunner.query(conn, sql, new ScalarHandler(), params);
		DBConnection.closeConnection(conn);
		return i;
	}
    
    //ArrayHandler
    public Object[] ArrayHandler(String sql,Object... params) throws SQLException {
    	Connection conn = DBConnection.getConnection();
		QueryRunner queryRunner = new QueryRunner();
        Object[] array = queryRunner.query(conn, sql, new ArrayHandler(), params);  
        DBConnection.closeConnection(conn);
        
        /*System.out.println("使用Array处理单行记录！");
        for (int i = 0; i < array.length; i++) {  
            System.out.println(array[i]);  
        }*/
        
        return array;
	}
    
    //ArrayListHandler
    public List<Object[]> ArrayListHandler(String sql,Object... params) throws SQLException {
    	/*System.out.println("使用Array处理多行记录！");*/
    	Connection conn = DBConnection.getConnection();
		QueryRunner queryRunner = new QueryRunner();
		List<Object[]> arraylist = queryRunner.query(conn, sql, new ArrayListHandler(), params);  
        DBConnection.closeConnection(conn);
        
        /*for (Iterator<Object[]> itr = arraylist.iterator(); itr.hasNext();) {  
            Object[] a = itr.next();  
            System.out.println("--------------");  
            for (int i = 0; i < a.length; i++) {  
                System.out.println(a[i]);  

            }  
        }*/
        
        return arraylist;
	}
}
