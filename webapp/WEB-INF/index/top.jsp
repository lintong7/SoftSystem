<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%! int j=0;%>
<%
if(session.isNew()){
	j++;
}
application.setAttribute("count", j);
Integer count = (Integer)application.getAttribute("count");
%>
<nav class="navbar">
	<div class="container">
		<div class="row">
			<%-- <div class="col-md-12 text-right">您是第<%=j %>个访问用户</div> --%>
			<div class="col-md-6 top"><a href="index.jsp"></a></div>
			<div class="col-md-6 search">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="请输入软件名字，如：微信" aria-describedby="basic-addon2">
					<span class="input-group-addon" id="basic-addon2">搜索</span>
				</div>
				<div class="input-group keywords">热搜词： 
					<a href="soft.jsp?v=info&id=1">微信</a>
					<a href="soft.jsp?v=info&id=2">腾讯QQ</a>
					<a href="soft.jsp?v=info&id=4">网易云音乐</a>
					<a href="soft.jsp?v=info&id=5">WPS Office</a>
					<a href="soft.jsp?v=info&id=3">360手机卫士</a>
				</div>
			</div>
		</div>
	</div>
	<div class="container navbar-inverse" style="padding-left:0;">
		<div id="navbar" class="collapse navbar-collapse">
			<script>
				$(document).ready(function(){
				  $(".column li").click(function(){
					  /* alert("lintong:"); */
					/* var bool = $(".column").find(li).hasClass("active");
					alert(bool); */
					$(".column").filter("active").css("background","#288bde");
					/* .removeClass("active"); */
				    /* $(this).addClass("active"); */
				  });
				});
			</script>
			<ul class="nav navbar-nav column">
				<li class="active"><a href="index.jsp">首页</a></li>
				<li><a href="<%=path %>/soft.jsp?v=necessary">装机必备</a></li>
				<li><a href="class.jsp">软件分类</a></li>
				<li><a href="newSoft.jsp">最新更新</a></li>
				<li><a href="top.jsp">下载排行</a></li>
			</ul>
		</div>
	</div>
</nav>