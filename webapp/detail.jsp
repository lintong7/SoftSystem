<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>腾讯QQ-软件下载中心</title>
	<jsp:include page="WEB-INF/index/head.jsp"></jsp:include>
</head>
	<script>
		function like(id,thumb_up) {
		    $.ajax({
		        url: 'soft.jsp',
		        type: 'POST',
		        data: {"v":"like","id":id},
		        dataType: "text",
		        success: function(data) {
		            if (data = "success") {
		            	var k = $('.like');
		                var sum = parseInt(thumb_up) + parseInt(1);
		                k.prev().html(sum);
		                k.after("<span class='text-success ml5 tag'>感谢您的支持！</span>");
		                k.css("color","#999");
		                k.removeClass("like");
		                $('.tag').fadeOut(3000);
		            }
		        },
		        error: function(e) {
		            alert("无法连接服务器");
		        }
		    });
		 }
	</script>
<body>
	<!-- common top -->
	<jsp:include page="WEB-INF/index/top.jsp"></jsp:include>
	
	<!-- body -->
	<!-- 面包屑导航 -->
	<div class="container">
		您的位置：
		<a href="index.jsp">首页</a> > 
		<a href="#">${nav.catalog }</a> > 
		<a>${soft.name } ${soft.version }</a>
	</div>
	
	<div class="container">
		<div class="detail-title">
			<a><img src="upload/icon/${soft.icon }"></a>
			<strong>${soft.name } ${soft.version }</strong>
			<a href="soft.jsp?v=download&id=${soft.id }" class="download"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>下载</a>
		</div>
	</div>
	
	<div class="container">
		<div class="row detail-parameter">
			<!-- list left -->
			<div class="col-sm-9">
				<!-- 属性 -->
				<div class="col-xs-12 table-bordered pb5">
						<div class="col-md-4"><strong>版本：</strong>${soft.version }</div>
						<div class="col-md-4"><strong>软件授权：</strong>${soft.impower }</div>
						<div class="col-md-4"><strong>软件分类：</strong>${nav.catalog } - ${nav.name }</div>
						<div class="col-md-4"><strong>软件语言：</strong>${soft.language }</div>
						<div class="col-md-4"><strong>软件类型：</strong>${soft.type }</div>
						<div class="col-md-4"><strong>软件大小：</strong>${soft.size }M</div>
						<div class="col-md-4"><strong>应用平台：</strong>${soft.system }</div>
						<div class="col-md-4"><strong>开发商邮箱：</strong><a href="mailto:${soft.email }">${soft.email }</a></div>
						<div class="col-md-4"><strong>软件官网：</strong><a href="${soft.homepage }" target="_blank">${soft.homepage }</a></div>
						<div class="col-md-4"><strong>发布时间：</strong><fmt:formatDate type="time" value="${soft.create_time }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></div>
						<div class="col-md-4"><strong>下载次数：</strong>${soft.down_count }</div>
						<div class="col-md-4"><strong>点赞次数：</strong><span>${soft.thumb_up }</span> <a href="javascript:void(0)" class="like" onclick="like('${soft.id}','${soft.thumb_up }')"><span class="glyphicon glyphicon-thumbs-up"></span>顶</a></div>
				</div>
				<!-- 正文内容 -->
				<div class="col-xs-12 table-bordered mt15">
					<!-- 正文内容 start -->
		            <h3>基本介绍</h3><hr>		            
		            ${soft.body }
					<!-- 正文内容 end -->
				</div>
			</div>
			<!-- list right -->
			<div class="col-xs-6 col-sm-3">
				<div class="list-group">
					<a class="list-group-item active">同类软件排行榜</a>
					<c:forEach items="${top }" var="top">
					<a href="soft.jsp?v=info&id=${top.id }" class="list-group-item">${top.name }</a>
					</c:forEach>
				</div>
			</div>
		</div>
	<hr>
	</div>
	
    <!-- footer -->
    <jsp:include page="WEB-INF/index/footer.jsp"></jsp:include>
    
</body>
</html>