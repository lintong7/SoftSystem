<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			<h1 class="page-title">软件详情</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
			<li><a href="soft.jsp?v=query">软件列表</a> <span class="divider">/</span></li>
			<li class="active">软件详情</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="well soft">
					<div class="detail-title mt15">
						<a><img src="../upload/icon/${info.icon }" class="img-rounded"></a>
						<strong>${info.name } ${info.version }</strong>
						<a href="soft.jsp?v=download&id=${info.id }" class="download"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span>下载</a>
					</div>
					<div class="row">
						<div class="span6">软件名称： ${info.name }</div>
						<div class="span6">软件分类：${cn.catalog } - ${cn.name } </div>
					</div>
					<div class="row">
						<div class="span6">版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本：${info.version }</div>
						<div class="span6">软件类型：${info.type }</div>
					</div>
					<div class="row">
						<div class="span6">软件语言：${info.language }</div>
						<div class="span6">软件授权：${info.impower }</div>
					</div>
					<div class="row">
						<div class="span6">软件大小：${info.size }M</div>
						<div class="span6">应用平台：${info.system }</div>
					</div>
					<div class="row">
						<div class="span6">软件官网：${info.homepage }</div>
						<div class="span6">开发商邮箱：${info.email }</div>
					</div>
					<div class="row">
						<div class="span6">下载量：${info.down_count }</div>
						<div class="span6">点赞量：${info.thumb_up }</div>
					</div>
					<div class="row">
						<div class="span10">软件详情介绍：${info.body }</div>
					</div>
					
					<div class="btn-toolbar">
						<button  onclick="javascript:history.back(-1);" class="btn btn-success"><i class="icon-chevron-left"></i> 返回 </button>
					</div>
				</div>
			</div>
		</div>
		
<jsp:include page="footer.jsp"></jsp:include>