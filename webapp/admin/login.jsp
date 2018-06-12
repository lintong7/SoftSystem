<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<head>
<title>软件下载系统后台登录</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="../resources/favicon.png"/>
<link href="../resources/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/bootstrap.min.v3.2.0.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/bootstrapValidator.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/common.css" rel="stylesheet" type="text/css">
</head>

<body class="gray pt7p">
	<h1 class="reg-log-title">软件下载系统后台登录</h1>
	<div class="container">
		<div class="row login">
			<div class="col-md-6 col-md-offset-3">
				<form action="" class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" method="post">				
			        <div class="form-group">
			          <div class="col-xs-12">		            
			            <div class="control-wrapper">
			            	<label for="username" class="control-label fa-label"><i class="fa fa-user fa-medium"></i> 用户名：</label>
			            	<input type="text" class="form-control" id="username" name="username" placeholder="用户名/邮箱">
			            </div>		            	            
			          </div>              
			        </div>
			        
			        <div class="form-group">
			          <div class="col-md-12">
			          	<div class="control-wrapper">
			            	<label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i> 密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
			            	<input type="password" class="form-control" id="password" name="password" placeholder="密码">
			            </div>
			          </div>
			        </div>
			        
			        <div class="form-group">
			          <div class="col-md-12">
			          	<div class="control-wrapper">
			          		<input type="submit" value="登  录" id="sbt" onclick="login()" class="btn btn-info">
			          	</div>
			          </div>
			        </div>
			        
			        <hr>
			      </form>
			      
			      <div class="text-center">
			      	<a href="register.jsp" class="btn btn-success">注册账号 <i class="fa fa-arrow-circle-o-right"></i></a>	
			      </div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="../resources/admin/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="../resources/admin/js/bootstrap.min.v3.2.0.js"></script>
	<script type="text/javascript" src="../resources/admin/js/bootstrapValidator.js"></script>
	<script>
		function login(){
			var username = $("#username").val();
			var password = $("#password").val();
			$.ajax({
				type: "POST",
				url:"user.jsp",
				data: {"v":"login", "username":username, "password":password},
				success: function(data){
					if(data.indexOf("|") != -1){
						var index = data.indexOf("|");
						var status = data.substr(0,index);
						var msg = data.substr(index+1);
						console.log(status);
						if(status == "success"){
							alert('用户：'+ username+ '，登录成功！');
							location.href = "<%=basePath %>/admin/";
						}else if(status == "fail"){
							alert(msg);
							return false;
						}
					}
				},
				error:function(e){
					alert('连接服务器出错！');
					return false;
				}
			});
		}
	</script>
</body>
</html>