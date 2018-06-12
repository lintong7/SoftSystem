package domain;

/**
 * 定义日志静态属性值
 * @author LinTong
 *
 */
public class LogMsg {
	//操作类型
	public static final String LOGIN = "登录";
	public static final String REGISTER = "注册";
	public static final String EDIT = "修改";
	public static final String DELETE = "删除";
	public static final String INSERT = "添加";
	//操作状态
	public static final String LOGIN_SUCCESS = "登录成功";
	public static final String LOGIN_ERROR = "登录失败";
	public static final String LOGIN_SYSTEM = "登录系统";
	public static final String REGISTER_SUCCESS = "注册成功";
	public static final String INSERT_SUCCESS = "日志添加成功";
	public static final String INSERT_ERROR = "日志添加失败";
	public static final String PASSWORD_ERROR = "密码错误，登录失败";
	public static final String NOT_ACTIVE = "账号已被冻结，登录失败";
}
