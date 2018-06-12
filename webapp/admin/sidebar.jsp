<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar-nav">
	<a href="#admin-menu" class="nav-header" data-toggle="collapse">
		<i class="icon-user"></i>管理员管理<i class="icon-chevron-up"></i>
	</a>
	<ul id="admin-menu" class="nav nav-list collapse in">
		<li><a href="user.jsp">管理员列表</a></li>
		<li><a href="user_add_edit.jsp">管理员添加</a></li>
	</ul>

	<a href="#soft-menu" class="nav-header" data-toggle="collapse">
		<i class="icon-legal"></i>软件管理<i class="icon-chevron-up"></i>
	</a>
	<ul id="soft-menu" class="nav nav-list collapse">
		<li><a href="soft.jsp">软件列表</a></li>
		<li><a href="catalog.jsp">软件分类</a></li>
	</ul>
	
	<a href="#log-menu" class="nav-header" data-toggle="collapse">
		<i class="icon-comment"></i>日志管理<i class="icon-chevron-up"></i>
	</a>
	<ul id="log-menu" class="nav nav-list collapse">
		<li><a href="log.jsp">系统日志</a></li>
	</ul>

</div>