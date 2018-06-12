<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  
   if(session.getAttribute("user") == null)  
   {  
       out.println("<script>alert('请先登录！');window.location.href='login.jsp'</script>");  
       return;
   }
%>
<head>
<title>软件系统管理后台</title>
<meta charset="utf-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="基于JSP的软件下载系统的设计与实现">
<meta name="author" content="LinTong">
<link rel="icon" type="image/x-icon" href="../resources/favicon.png"/>
<link rel="stylesheet" type="text/css" href="../resources/admin/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/admin/css/theme.css">
<link rel="stylesheet" type="text/css" href="../resources/admin/css/common.css">
<link rel="stylesheet" href="../resources/admin/font-awesome/css/font-awesome.css">

<script src="../resources/admin/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="../resources/admin/js/bootstrap.js"></script>

<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}
.brand .title {
	color: #fff;
	font-weight: bold;
}
</style>

</head>
