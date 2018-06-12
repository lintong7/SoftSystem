<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<title>首页-软件下载中心</title>
	<jsp:include page="WEB-INF/index/head.jsp"></jsp:include>
</head>

<body>
	<!-- common top -->
	<jsp:include page="WEB-INF/index/top.jsp"></jsp:include>
	
	<!-- body -->
	<!-- catalog -->
	<div class="container">
		<table class="table table-striped table-condensed table-hover catalog-class">
			<%-- <c:forEach items="${catalog }" var="ctl">
				<tr>
					<td class="catalog-title"><a href="list.jsp">${ctl.catalog }</a></td>
					<!-- 二级分类 -->
					<td class= "catalog-list">
						<a href="list.jsp">网页浏览</a>
						<a href="list.jsp">下载工具</a>
						<a href="list.jsp">聊天工具</a>
						<a href="list.jsp">网络电话</a>
					</td>
				</tr>
			</c:forEach> --%>
			<tr>
				<td class="catalog-title"><a href="#">网络软件</a></td>
				<!-- 二级分类 -->
				<td class= "catalog-list">
					<a href="#">网页浏览</a>
					<a href="#">下载工具</a>
					<a href="#">聊天工具</a>
					<a href="#">网络电话</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">系统软件</a></td>
				<!-- 二级分类 -->
				<td class= "catalog-list">
					<a href="#">压缩解压</a>
					<a href="#">拼音输入</a>
					<a href="#">文本编辑</a>
					<a href="#">数据恢复</a>
					<a href="#">系统优化</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">媒体工具</a></td>
				<!-- 二级分类 -->
				<td class= "catalog-list">
					<a href="#">网络电视</a>
					<a href="#">视频播放</a>
					<a href="#">音频播放</a>
					<a href="#">电子相册</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">图形图像</a></td>
				<!-- 二级分类 -->
				<td class= "catalog-list">
					<a href="#">图像处理</a>
					<a href="#">看图软件</a>
					<a href="#">截图软件</a>
					<a href="#">图片压缩</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">管理软件</a></td>
				<!-- 二级分类 -->
				<td class= "catalog-list">
					<a href="#">办公软件</a>
					<a href="#">财务管理</a>
					<a href="#">记事管理</a>
					<a href="#">系统安全</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">教育教学</a></td>
				<!-- 二级分类 -->
				<td class= "catalog-list">
					<a href="#">文科工具</a>
					<a href="#">理科工具</a>
					<a href="#">外语学习</a>
					<a href="#">考试系统</a>
				</td>
			</tr>
			<tr>
				<td class="catalog-title"><a href="#">其它类别</a></td>
				<!-- 二级分类 -->
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
	
	<!-- list -->
	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<!-- list left -->
			<div class="col-sm-9 index-class">
				<!-- 网络软件 -->
				<div class="col-xs-12 table-bordered" style="margin-top:0px;">
					<div class="row list-title">
						<h4 class="col-md-4"><a href="list.jsp?id=1">网络软件</a></h4>
						<div class="col-md-2 col-md-offset-6"><a href="list.jsp?id=1">更多</a></div>
					</div>
					<div class="col-xs-12 list-menu">
						<div class="col-md-2"><a href="soft.jsp?v=info&id=1"><img src="upload/icon/62e788c0b54c4ca7b3a8a67b48494106.jpg"><span>微信</span></a></div>
						<div class="col-md-2"><a href="soft.jsp?v=info&id=2"><img src="upload/icon/46293c16262b4f408de7c392f62df20f.jpg"><span>腾讯QQ</span></a></div>
					</div>
				</div>
				<!-- 媒体工具 -->
				<div class="col-xs-12 table-bordered" style="margin-top:0px;">
					<div class="row list-title">
						<h4 class="col-md-4"><a href="list.jsp?id=3">媒体工具</a></h4>
						<div class="col-md-2 col-md-offset-6"><a href="list.jsp?id=3">更多</a></div>
					</div>
					<div class="col-xs-12 list-menu">
						<div class="col-md-2"><a href="soft.jsp?v=info&id=4"><img src="upload/icon/7108f91d88944e1aa00e13fa2c46a4fc.png"><span>网易云音乐</span></a></div>
					</div>
				</div>
				<!-- 管理软件 -->
				<div class="col-xs-12 table-bordered" style="margin-top:0px;">
					<div class="row list-title">
						<h4 class="col-md-4"><a href="list.jsp?id=5">管理软件</a></h4>
						<div class="col-md-2 col-md-offset-6"><a href="list.jsp?id=5">更多</a></div>
					</div>
					<div class="col-xs-12 list-menu">
						<div class="col-md-2"><a href="soft.jsp?v=info&id=5"><img src="upload/icon/48f5770d4dab4be3a1c6fed529318459.png"><span>WPS Office</span></a></div>
						<div class="col-md-2"><a href="soft.jsp?v=info&id=3"><img src="upload/icon/f5ad33d7f04c4d02ba226333f66011ff.jpg"><span>360手机卫士</span></a></div>
					</div>
				</div>
			</div>
			<!-- list right -->
			<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<div class="list-group">
					<a class="list-group-item active">本周电脑软件排行榜</a>
					<a href="soft.jsp?v=info&id=1" class="list-group-item">微信电脑版</a>
	 				<a href="soft.jsp?v=info&id=1" class="list-group-item">腾讯QQ</a>
					<a href="soft.jsp?v=info&id=1" class="list-group-item">网易云音乐</a>
				</div>
	         
				<div class="list-group">
					<a class="list-group-item active">本周安卓下载排行榜</a>
					<a href="soft.jsp?v=info&id=1" class="list-group-item">微信2018</a>
					<a href="soft.jsp?v=info&id=1" class="list-group-item">UC浏览器</a>
					<a href="soft.jsp?v=info&id=1" class="list-group-item">QQ音乐</a>
				</div>
			</div>
     	</div>

     <hr>

	</div>
    
    <!-- footer -->
    <jsp:include page="WEB-INF/index/footer.jsp"></jsp:include>
    
</body>
</html>