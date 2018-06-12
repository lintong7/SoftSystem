<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>下载排行</title>
	<jsp:include page="WEB-INF/index/head.jsp"></jsp:include>
</head>

<body>
	<!-- common top -->
	<jsp:include page="WEB-INF/index/top.jsp"></jsp:include>
	
	<!-- body -->
	<div class="container mt15 commons">
		<!-- 网络软件 -->
		<div class="commons-title"><h2>网络软件</h2></div><hr>	
		<div class="col-xs-12 list-menu">
			<div class="col-md-2"><a href="soft.jsp?v=info&id=1"><img src="upload/icon/62e788c0b54c4ca7b3a8a67b48494106.jpg"><p>微信</p></a></div>
			<div class="col-md-2"><a href="soft.jsp?v=info&id=2"><img src="upload/icon/46293c16262b4f408de7c392f62df20f.jpg"><p>腾讯QQ</p></a></div>
		</div>
	</div>
	
	<div class="container mt15 commons">
		<!-- 媒体工具 -->
		<div class="commons-title"><h2>媒体工具</h2></div><hr>	
		<div class="col-xs-12 list-menu">
			<div class="col-md-2"><a href="soft.jsp?v=info&id=4"><img src="upload/icon/7108f91d88944e1aa00e13fa2c46a4fc.png"><p>网易云音乐</p></a></div>
		</div>
	</div>
	
	<div class="container mt15 commons">
		<!-- 管理软件 -->
		<div class="commons-title"><h2>管理软件</h2></div><hr>	
		<div class="col-xs-12 list-menu">
			<div class="col-md-2"><a href="soft.jsp?v=info&id=3"><img src="upload/icon/f5ad33d7f04c4d02ba226333f66011ff.jpg"><p>360手机卫士</p></a></div>
			<div class="col-md-2"><a href="soft.jsp?v=info&id=5"><img src="upload/icon/48f5770d4dab4be3a1c6fed529318459.png"><p>WPS Office</p></a></div>
		</div>
	</div>
	
	<!-- footer -->
    <jsp:include page="WEB-INF/index/footer.jsp"></jsp:include>
    
</body>
</html>