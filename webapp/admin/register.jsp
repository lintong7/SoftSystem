<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>注册账号</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="../resources/favicon.png"/>
<link href="../resources/admin/css/bootstrap.min.v3.2.0.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/bootstrapValidator.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/common.css" rel="stylesheet" type="text/css">
</head>
<script>
	
	$("#regButton").click(function(){	
		var username = $("#username").val();
		alert('用户：'+ username+ '，注册成功！');
		return false;
	});
	
	/* $.ajax({
	    url: 'soft.jsp',
	    type: 'POST',
	    data: {},
	    dataType: "text",
	    success: function(data) {
	        if (data = "success") {
	        	alert('用户：');
	        }
	    },
	    error: function(XMLHttpRequest, textStatus, errorThrown) {
	        alert("无法连接服务器:" + textStatus);
	    }
	}); */
	
</script>
<body class="gray">
	<h1 class="reg-log-title">注册账号</h1>
	<div class="container">
		<div class="row register">
			<div class="col-md-8 col-md-offset-2">
				<form action="user.jsp" id="regForm" class="form-horizontal" method="post">
				<input type="hidden" name="v" value="register">
				<div class="form-group">
                    <label for="username" class="col-lg-3 control-label">用户名：</label>
                    <div class="col-lg-7">
                        <input type="text" class="form-control" name="username" id="username" placeholder="请输入英文+数字组合的用户名" />
                    </div>
                </div>
				
				<div class="form-group">
                    <label for="name" class="col-lg-3 control-label">姓名：</label>
                    <div class="col-lg-7">
                        <input type="text" class="form-control" name="name" id="name" placeholder="请输入姓名" />
                    </div>
                </div>
				
                <div class="form-group">
                    <label for="email" class="col-lg-3 control-label">邮箱：</label>
                    <div class="col-lg-7">
                        <input type="text" class="form-control" name="email" id="email" placeholder="请输入邮箱地址" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="password" class="col-lg-3 control-label">密码：</label>
                    <div class="col-lg-7">
                        <input type="password" class="form-control" name="password" id="password" placeholder="请输入不低于6位的密码" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password_confirm" class="col-lg-3 control-label">确认密码：</label>
                    <div class="col-lg-7">
                        <input type="password" class="form-control" name="password_confirm" id="password_confirm" placeholder="请再次输入密码" />
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="termOfService" class="col-lg-3 control-label"></label>
                    <div class="col-lg-7">
                        <input type="checkbox" name="termOfService" id="termOfService">我已经同意
						<a href="javascript:;" data-toggle="modal" data-target="#termOfServiceModal">服务条款</a>
                    </div>
                </div>
                
                <div class="form-group">
					<div class="col-md-3 col-md-offset-3">
						<button type="submit" class="btn btn-primary" id="regButton">注    册</button>
						<button type="reset" class="btn btn-primary" id="resButton">重    置</button>
					</div>
					<div class="col-md-3 col-md-offset-2">
						<a href="login.jsp" class="btn btn-success">登    录</a>
					</div>
				</div>
                
				</form>
			</div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="termOfServiceModal" tabindex="-1"
			role="dialog" aria-labelledby="termOfServiceModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
						</button>
						<h4 class="modal-title" id="termOfServiceModalLabel">服务条款</h4>
					</div>
					<div class="modal-body">
						<p>本软件下载系统的所有权和运作权归 <strong>林桐</strong> 所有。当你选中状态，表示你已经同意该服务条款，并且所提供的信息必须是本人真实有效的。您在注册帐号或使用本服务的过程中，可能需要填写一些必要的信息。若国家法律法规有特殊规定的，您需要填写真实的身份信息。若您填写的信息不完整，则无法使用本服务或在使用过程中受到限制。我们不会将您的个人信息转移或披露给任何非关联的第三方。非常希望你愉快地使用本系统，当然，在使用的过程中遇到任何问题，欢迎发邮件给我反馈。我收到邮件会及时解答您的疑问。谢谢！</p>
						<p>站长邮箱：<a href="mailto:732722725@qq.com">732722725@qq.com</a></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="../resources/admin/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../resources/admin/js/bootstrap.min.v3.2.0.js"></script>
	<script type="text/javascript" src="../resources/admin/js/bootstrapValidator.js"></script>
	
	<script>
	$(function() {		
	    $('#regForm').bootstrapValidator({
			/**
		    * 为每个字段指定通用错误提示语
		    */
	        message: '输入有误',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        /**
	         * 生效规则（三选一）
	         * enabled 字段值有变化就触发验证(默认)
	         * disabled,submitted 当点击提交时验证并展示错误信息
	         */
	        live: 'enabled',
	        fields: {
	            username: {
	            	//错误提示信息
	                message: '用户名不能为空！',
	                validators: {
	                    notEmpty: {
	                        message: '用户名不能为空！'
	                    },
	                    stringLength: {
	                        min: 4,
	                        max: 30,
	                        message: '用户名必须在4~30位之间'
	                    },
	                    regexp: {
	                        regexp: /^[a-zA-Z0-9_\.]+$/,
	                        message: '用户名只能由英文、数字、_组合！'
	                    }
	                }
	            },
	            name: {
	            	//错误提示信息
	                message: '姓名不能为空！',
	                validators: {
	                    notEmpty: {
	                        message: '姓名不能为空！'
	                    },
	                    stringLength: {
	                        min: 2,
	                        max: 10,
	                        message: '用户名必须在2~10位之间！'
	                    },
	                    regexp: {
	                        regexp: /^[\u4e00-\u9fa5]{0,}$/,
	                        message: '用户名只能输入中文！'
	                    }
	                }
	            },
	            email: {
	                validators: {
	                    notEmpty: {
	                        message: '邮箱地址不能为空！'
	                    },
	                    emailAddress: {
	                        message: '您输入的邮箱地址无效！'
	                    }
	                }
	            },
	            password: {
	                validators: {
	                    notEmpty: {
	                        message: '密码不能为空'
	                    },
	                    different: {
	                        field: 'username',
	                        message: '密码不能与用户名相同！'
	                    },
	                    identical: {
	                        field: 'password_confirm',
	                        message: '确认密码与密码不一致'
	                    }
	                }
	            },
	            password_confirm: {
	                validators: {
	                    notEmpty: {
	                        message: '确认密码不能为空'
	                    },
	                    different: {
	                        field: 'username',
	                        message: '密码不能与用户名相同！'
	                    },
	                    identical: {
	                        field: 'password',
	                        message: '确认密码与密码不一致'
	                    }
	                }
	            },
	            termOfService: {
	                validators: {
	                    notEmpty: {
	                        message: '请同意服务条款'
	                    }
	                }
	            }
	        }
	    });

		/* 重置后去除所有保留的验证信息 */
		$("#resButton").bind("click", function() {
			$('#regForm').data('bootstrapValidator').resetForm();
		});
		
		$('#regButton').bind("click", function() {
			var username = $("#username").val();
			alert('用户：'+ username+ '，注册成功！');
			return false;
		});
		
	});
	</script>
</body>
</html>