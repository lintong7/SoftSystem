<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<jsp:include page="nav.jsp"></jsp:include>

	<jsp:include page="sidebar.jsp"></jsp:include>

	<div class="content">

		<div class="header">
			<h1 class="page-title">软件分类</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.html">首页</a> <span class="divider">/</span></li>
			<li class="active">软件分类</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">

				<div class="btn-toolbar">
					<a class="btn btn-primary" href="#">
						<i class="icon-plus"></i> 添加分类
					</a>
				</div>
				<div class="well">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>编号</th>
								<th>一级分类</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="sc">
								<tr>
									<td>${sc.id }</td>
									<td>${sc.catalog }</td>
									<td><fmt:formatDate type="time" value="${sc.create_time }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
									<td>
										<a href="catalog.jsp?v=del&id=${sc.id }"><i class="icon-trash"></i>删除</a>
									</td>
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