<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%
	Date date = new Date(); //获取日期对象
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //设置日期时间格式
	String today = df.format(date); //获取当前系统日期
%>
<!DOCTYPE html>
<html>
<head>
<title>Hello JSP</title>
</head>
<body>
	Hello JSP !!!
	<br>
	当前时间：<%=today%>
</body>
</html>