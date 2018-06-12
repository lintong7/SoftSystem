<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="navbar">
	<div class="navbar-inner">
		<a class="brand" href="index.jsp"><span class="title">软件系统管理后台</span></a>
		<ul class="nav pull-right">
			<li><a href="user.jsp" class="hidden-phone visible-tablet visible-desktop" role="button"><i class="icon-user"></i>管理员列表</a></li>
			<li><a href="soft.jsp" class="hidden-phone visible-tablet visible-desktop" role="button"><i class="icon-legal"></i>软件列表</a></li>
			<li><a href="log.jsp" class="hidden-phone visible-tablet visible-desktop" role="button"><i class="icon-comment"></i>系统日志</a></li>
			<li id="fat-menu" class="dropdown">
				<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
					<i class="icon-user"></i> <%=session.getAttribute("user") %>  <i class="icon-caret-down"></i>
				</a>
				
				<!-- 下拉框 -->
				<ul class="dropdown-menu">
					<li><a tabindex="-1" href="#userModal" role="button" data-toggle="modal">个人中心</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" href="user.jsp?v=layout">退出系统</a></li>
				</ul>
				
				<!-- 模态框 -->
				<div class="modal small hide fade" id="userModal" tabindex="-1"
						role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabel">个人中心</h3>
						</div>
						<div class="modal-body">
							<p class="error-text">
								<b>用户名：</b><%=session.getAttribute("user") %>
							</p>
							<p class="error-text">
								<b>密码：</b><%=session.getAttribute("password") %>
							</p>
							<p class="error-text">
								<b>姓名：</b><%=session.getAttribute("name") %>
							</p>
							<p class="error-text">
								<b>邮箱：</b><%=session.getAttribute("email") %>
							</p>
							<p class="error-text">
								<b>注册时间：</b><%=session.getAttribute("create_time") %>
							</p>
						</div>
						<div class="modal-footer">
							<button class="btn btn-info" data-dismiss="modal" aria-hidden="true">返回</button>
						</div>
				</div>
				
			</li>
			<li><a href="../index.jsp" class="hidden-phone visible-tablet visible-desktop" role="button" target="_blank"><i class="icon-home"></i>访问网站</a></li>
		</ul>
	</div>
</div>