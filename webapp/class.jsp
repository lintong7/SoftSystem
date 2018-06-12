<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>软件分类</title>
	<jsp:include page="WEB-INF/index/head.jsp"></jsp:include>
</head>

<body>
	<!-- common top -->
	<jsp:include page="WEB-INF/index/top.jsp"></jsp:include>
	
	<!-- body -->
	<!-- 面包屑导航 -->
	<div class="container">
		您的位置：
		<a href="index.jsp">首页</a> >  
		<a>软件分类</a>
	</div>
	
	<!-- class -->
	<div class="container soft-class mt15 mh400">
		<table class="table table-striped table-condensed table-hover catalog-class">
			<tr>
				<td class="catalog-title"><a href="list.jsp?id=1">网络软件</a></td>
				<td class= "catalog-list">
					<a href="#">网页浏览</a>
					<a href="#">下载工具</a>
					<a href="#">聊天工具</a>
					<a href="#">网络电话</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">系统软件</a></td>
				<td class= "catalog-list">
					<a href="#">压缩解压</a>
					<a href="#">拼音输入</a>
					<a href="#">文本编辑</a>
					<a href="#">数据恢复</a>
					<a href="#">系统优化</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="list.jsp?id=3">媒体工具</a></td>
				<td class= "catalog-list">
					<a href="#">网络电视</a>
					<a href="#">视频播放</a>
					<a href="#">音频播放</a>
					<a href="#">电子相册</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">图形图像</a></td>
				<td class= "catalog-list">
					<a href="#">图像处理</a>
					<a href="#">看图软件</a>
					<a href="#">截图软件</a>
					<a href="#">图片压缩</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="list.jsp?id=5">管理软件</a></td>
				<td class= "catalog-list">
					<a href="#">办公软件</a>
					<a href="#">财务管理</a>
					<a href="#">记事管理</a>
					<a href="#">系统安全</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">教育教学</a></td>
				<td class= "catalog-list">
					<a href="#">文科工具</a>
					<a href="#">理科工具</a>
					<a href="#">外语学习</a>
					<a href="#">考试系统</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">其它类别</a></td>
				<td class= "catalog-list">
					<a href="#">文件管理</a>
					<a href="#">数码工具</a>
					<a href="#">安卓刷机</a>
					<a href="#">出行查询</a>
					<a href="#">算命软件</a>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- footer -->
    <jsp:include page="WEB-INF/index/footer.jsp"></jsp:include>
    
</body>
</html>