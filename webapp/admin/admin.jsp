<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<jsp:include page="head.jsp"></jsp:include>

<body class="">
	<!--<![endif]-->
	
	<jsp:include page="nav.jsp"></jsp:include>

	<jsp:include page="sidebar.jsp"></jsp:include>

	<div class="content">
		<div class="header">
			<div class="stats">
				<p class="stat">
					<span class="number red">${historyData.down_count }</span>下载量
				</p>
				<p class="stat">
					<span class="number red">${historyData.page_view }</span>访问量
				</p>
				<p class="stat">
					<span class="number red">${historyData.thumb_up }</span>点赞
				</p>
				<p class="stat"><strong>历史总：</strong></p>
			</div>

			<h1 class="page-title">数据统计</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.jsp">主页</a> <span class="divider">/</span></li>
			<li class="active">数据统计</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="row-fluid">

					<!-- <div class="alert alert-info">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>这是一个简短的提示：</strong>希望你喜欢！
					</div> -->

					<div class="block">
						<a href="#page-stats" class="block-heading" data-toggle="collapse">统计数据</a>
						<div id="page-stats" class="block-body collapse in">

							<div class="stat-widget-container">
								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">${soft_count }</p>
										<p class="detail">软件总数</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">${historyData.down_count }</p>
										<p class="detail">下载量</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">${historyData.thumb_up }</p>
										<p class="detail">点赞量</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">${historyData.page_view }</p>
										<p class="detail">访问量</p>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="block span6">
						<a href="#tablewidget" class="block-heading" data-toggle="collapse">管理员
							<span class="label label-warning">总数：${user_count }</span>
						</a>
						<div id="tablewidget" class="block-body collapse in">
							<table class="table">
								<thead>
									<tr>
										<th>用户名</th>
										<th>姓名</th>
										<th>邮箱地址</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${user }" var="user">
										<tr>
											<td>${user.username }</td>
											<td>${user.name }</td>
											<td>${user.email }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<p>
								<a href="user.jsp">更多...</a>
							</p>
						</div>
					</div>
					<div class="block span6">
						<a href="#widget1container" class="block-heading"
							data-toggle="collapse">通知公告 </a>
						<div id="widget1container" class="block-body collapse in">
							<h2>软件下载系统正式上线啦！</h2>
							<p>经过数月的努力，本系统终于大功告成啦。感谢老师和同学的帮助与指导。站长邮箱：<a href="mailto:732722725@qq.com">732722725@qq.com</a>
							</p>
						</div>
					</div>
				</div>


			</div>
		</div>
	
<jsp:include page="footer.jsp"></jsp:include>