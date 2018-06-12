<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<jsp:include page="nav.jsp"></jsp:include>

	<jsp:include page="sidebar.jsp"></jsp:include>

	<div class="content">

		<div class="header">

			<h1 class="page-title">${v == edit ? "添加管理员" : "修改信息" }</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
			<li><a href="user.jsp">管理员列表</a> <span class="divider">/</span></li>
			<li class="active">${v == edit ? "添加管理员" : "修改信息" }</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">

				<div class="well">
					<ul class="nav nav-tabs">
						<li class="active"><a>${v == edit ? "填写资料" : "基本信息" }</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">

						<div class="tab-pane active in" id="home">
							<form method="post"
								action="user.jsp?v=${v == edit ? 'reg' : 'editUser' }"
								id="ckForm">
								<input type="hidden" name="id" value="${edit_id }">

								<div class="form-group">
									<label>用户名</label> <input type="text" value="${edit_username }"
										name="username" class="input-xlarge form-control"
										${v == edit ? '' : 'disabled' }>
								</div>
								<div class="form-group">
									<label>姓名</label> <input type="text" value="${edit_name }"
										name="name" class="input-xlarge form-control">
								</div>
								<div class="form-group">
									<label>邮箱</label> <input type="text" value="${edit_email }"
										name="email" class="input-xlarge form-control">
								</div>
								<div class="form-group">
									<label>密码</label> <input type="password"
										value="${edit_password }" name="password"
										class="input-xlarge form-control">
								</div>
								<div class="form-group">
									<label>确认密码</label> <input type="password"
										value="${edit_password }" name="password_confirm"
										class="input-xlarge form-control">
								</div>
								<div class="btn-toolbar">
									<button type="submit" class="btn btn-success" id="regButton">注
										册</button>
									<button type="reset" class="btn" id="resButton">重 置</button>
								</div>
							</form>
						</div>
					</div>

				</div>

			</div>
		</div>

		<link href="../resources/admin/css/bootstrapValidator.css" rel="stylesheet" type="text/css">
		<script type="text/javascript"
			src="../resources/admin/js/bootstrapValidator.js"></script>
		<script>
			$(function() {
				$('#ckForm').bootstrapValidator({
					/**
					 * 为每个字段指定通用错误提示语
					 */
					message : '输入有误',
					feedbackIcons : {
						valid : 'glyphicon glyphicon-ok',
						invalid : 'glyphicon glyphicon-remove',
						validating : 'glyphicon glyphicon-refresh'
					},
					/**
					 * 生效规则（三选一）
					 * enabled 字段值有变化就触发验证(默认)
					 * disabled,submitted 当点击提交时验证并展示错误信息
					 */
					live : 'enabled',
					fields : {
						username : {
							//错误提示信息
							message : '用户名不能为空！',
							validators : {
								notEmpty : {
									message : '用户名不能为空！'
								},
								stringLength : {
									min : 5,
									max : 30,
									message : '用户名必须在5~30位之间'
								},
								regexp : {
									regexp : /^[a-zA-Z0-9_\.]+$/,
									message : '用户名只能由英文、数字、_组合！'
								}
							}
						},
						name : {
							//错误提示信息
							message : '姓名不能为空！',
							validators : {
								notEmpty : {
									message : '姓名不能为空！'
								},
								stringLength : {
									min : 2,
									max : 10,
									message : '用户名必须在2~10位之间！'
								},
								regexp : {
									regexp : /^[\u4e00-\u9fa5]{0,}$/,
									message : '用户名只能输入中文！'
								}
							}
						},
						email : {
							validators : {
								notEmpty : {
									message : '邮箱地址不能为空！'
								},
								emailAddress : {
									message : '您输入的邮箱地址无效！'
								}
							}
						},
						password : {
							validators : {
								notEmpty : {
									message : '密码不能为空'
								},
								different : {
									field : 'username',
									message : '密码不能与用户名相同！'
								},
								identical : {
									field : 'password_confirm',
									message : '确认密码与密码不一致'
								}
							}
						},
						password_confirm : {
							validators : {
								notEmpty : {
									message : '确认密码不能为空'
								},
								different : {
									field : 'username',
									message : '密码不能与用户名相同！'
								},
								identical : {
									field : 'password',
									message : '确认密码与密码不一致'
								}
							}
						},
					}
				});

				/* 重置后去除所有保留的验证信息 */
				$("#resButton").bind("click", function() {
					$('#ckForm').data('bootstrapValidator').resetForm();
				});

			});
		</script>

		<jsp:include page="footer.jsp"></jsp:include>