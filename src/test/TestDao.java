package test;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import dao.UserDao;

public class TestDao {
	@Test
	public void m01() throws SQLException {
		UserDao userDao = new UserDao();
		List<Map<String, Object>> list = userDao.getUserInfo();
		System.out.println("list: " + list);
	}
}
