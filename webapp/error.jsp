<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>404 页面不存在</title>
	<jsp:include page="WEB-INF/index/head.jsp"></jsp:include>
</head>

<body>
	<!-- common top -->
	<jsp:include page="WEB-INF/index/top.jsp"></jsp:include>
	
	<!-- body -->
	<div class="container mt15">
		<div class="table-bordered error">		
			<strong>404，页面不存在！</strong>
			<p>
				<a class="btn" href="javascript:history.go(-1)">返回上一页</a>
				<a class="btn" href="index.jsp">返回首页</a>
			</p>
		</div>
	</div>
	
	<!-- footer -->
    <jsp:include page="WEB-INF/index/footer.jsp"></jsp:include>
    
</body>
</html>