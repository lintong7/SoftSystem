<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<jsp:include page="head.jsp"></jsp:include>

<body class="">
	<!--<![endif]-->

	<jsp:include page="nav.jsp"></jsp:include>

	<jsp:include page="sidebar.jsp"></jsp:include>

	<div class="content">

		<div class="header">

			<h1 class="page-title">管理员列表</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.html">首页</a> <span class="divider">/</span></li>
			<li class="active">管理员列表</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<form method="post" action="user.jsp?v=del">
					<input type="hidden" name="v" value="delAll">
					<div class="btn-toolbar">
						<a class="btn btn-info" href="user_add_edit.jsp"> <i
							class="icon-plus"></i> 添加管理员
						</a>
						<button type="submit" class="btn btn-danger" id="delall">
							<i class="icon-trash"></i> 批量删除
						</button>
					</div>
					<div class="well">
						<table class="table table-striped user-list">
							<thead>
								<tr>
									<th><input type="checkbox" id="checkall"></th>
									<th>编号</th>
									<th>管理员</th>
									<th>姓名</th>
									<th>邮箱</th>
									<th>注册时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="user">
									<tr>
										<td><input type="checkbox" name="ck" value="${user.id }"></td>
										<td>${user.id }</td>
										<td>${user.username }</td>
										<td>${user.name }</td>
										<td>${user.email }</td>
										<td><fmt:formatDate type="time"
												value="${user.create_time }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
										<td>
											<a class="btn btn-small btn-info" href="user.jsp?v=edit&id=${user.id }"><i
												class="icon-edit"> </i>编辑 </a>
											<a class="btn btn-small btn-danger" href="user.jsp?v=del&id=${user.id }"><i
												class="icon-trash"></i> 删除</a>
											<a class="btn btn-small ${user.authority==1?'btn-success':'btn-info'}" href="user.jsp?v=set&f=authority&id=${user.id }"><i
												class="${user.authority==1?'icon-check':'icon-check-empty'}"></i>
												${user.authority==1?'超管':'普通'}
											</a>
											<a class="btn btn-small ${user.status==0?'btn-success':'btn-danger'}" href="javascript:void(0)" onclick="setstatus('${user.id }')">${user.status==0?'激活':'冻结'}</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="pagination">
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
									<li><a href="?v=query&pageNumber=${page.pageNumber - 1}">&laquo;</a></li>
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
									<li><a href="?v=query&pageNumber=${page.pageNumber + 1}">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>

					<div class="modal small hide fade" id="myModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabel">删除确认</h3>
						</div>
						<div class="modal-body">
							<p class="error-text">
								<i class="icon-warning-sign modal-icon"></i>你确定要删除吗?
							</p>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
							<button class="btn btn-danger" data-dismiss="modal">删除</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<script>
			$(function() {
				$("#checkall").click(function() {
					if (this.checked) {
						$("input[name='ck']").attr('checked', true)
					} else {
						$("input[name='ck']").attr('checked', false)
					}
				});
				
			});
			
			function setstatus(userid) {
				$.ajax({
					type: "GET",
					url: "user.jsp",
					data: {"v":"set", "f":"status", "id":userid},
					success: function(data){
						alert(data);
					}
				});
				/* alert("管理员" + "liuliu" + "激活成功！"); */
				/* return false; */
			};
		</script>

<jsp:include page="footer.jsp"></jsp:include>