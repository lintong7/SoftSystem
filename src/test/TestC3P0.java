package test;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

import org.junit.Test;

import util.DBConnection;

public class TestC3P0 {
	@Test
	public void m01() throws SQLException {
		Connection conn = DBConnection.getConnection();
		DatabaseMetaData database = conn.getMetaData();
		String version = database.getDatabaseProductVersion();//获取数据库版本
		System.out.println("version == " + version);
		DBConnection.closeConnection(conn);
	}
}
