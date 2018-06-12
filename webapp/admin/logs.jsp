<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<jsp:include page="head.jsp"></jsp:include>

<body class="">
	<!--<![endif]-->

	<jsp:include page="nav.jsp"></jsp:include>

	<jsp:include page="sidebar.jsp"></jsp:include>

	<!-- 点击，更改选中列表 -->
	<script>
		$(function(){
			//找到已经打开li的ul，去除in
			var change = $('#legal-menu');
			change.siblings('ul').removeClass('in');// 删除其他兄弟的in样式
			//将点击的li的ul，加入in展开
	    	change.addClass('in');// 添加当前元素的样式
		});
	</script>

	<div class="content">

		<div class="header">
			<h1 class="page-title">系统日志</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
			<li class="active">系统日志</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="well">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>日志信息</th>
								<th>操作类型</th>
								<th>IP地址</th>
								<th>管理员</th>
								<th>操作时间</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${logs }" var="log">
								<tr>
									<td>${log.id }</td>
									<td>${log.info }</td>
									<td>${log.type }</td>
									<td>${log.ip }</td>
									<td>${log.admin_username }</td>
									<td><fmt:formatDate type="time" value="${log.create_time }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
				</div>
				<div class="pagination">
					<%-- 设置两个变量，表示分页按钮开始的序号和结束的序号的 --%>
					<c:set var="begin" value="${page.pageNumber - 2 }"></c:set>
					<c:set var="end" value="${page.pageNumber + 2 }"></c:set>
					<c:if test="${begin < 1 }">
						<c:set var="margin" value="${ 1 - begin }" />
						<%-- 把得到的差，加入到end里面！ --%>
						<c:set var="end" value="${end + margin }" />
						<c:set var="begin" value="1"></c:set>
					</c:if>
					<c:if test="${end > page.totalPages }">
						<c:set var="margin" value="${ end - page.totalPages }" />
						<c:set var="begin" value="${begin - margin }" />
						<c:set var="end" value="${page.totalPages }"></c:set>
						<%-- 避免begin小于1、小于0之类的！ --%>
						<c:if test="${begin < 1 }">
							<c:set var="begin" value="1"></c:set>
						</c:if>
					</c:if>
					<ul>
						<c:if test="${page.pageNumber <= 1 }">
							<li class="disabled"><a>&laquo;</a></li>
						</c:if>
						<c:if test="${page.pageNumber > 1 }">
							<li><a
								href="?v=query&pageNumber=${page.pageNumber - 1}">&laquo;</a></li>
						</c:if>
						<%-- 循环5个按钮 --%>
						<c:forEach begin="${begin }" end="${end }" var="p">
							<li ${page.pageNumber eq p ? "class='active'" : "" }><a
								href="?v=query&pageNumber=${p}">${p }</a></li>
						</c:forEach>
		
						<c:if test="${page.pageNumber >= page.totalPages }">
							<li class="disabled"><a>&raquo;</a></li>
						</c:if>
						<c:if test="${page.pageNumber < page.totalPages }">
							<li><a
								href="?v=query&pageNumber=${page.pageNumber + 1}">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
				
			</div>
		</div>
	
<jsp:include page="footer.jsp"></jsp:include>