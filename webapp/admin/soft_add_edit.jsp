<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<!-- Simditor -->
<link rel="stylesheet" type="text/css" href="../resources/admin/simditor/styles/simditor.css" />

<script type="text/javascript" src="../resources/admin/simditor/scripts/jquery.min.js"></script>
<script type="text/javascript" src="../resources/admin/simditor/scripts/module.js"></script>
<script type="text/javascript" src="../resources/admin/simditor/scripts/hotkeys.js"></script>
<script type="text/javascript" src="../resources/admin/simditor/scripts/uploader.js"></script>
<script type="text/javascript" src="../resources/admin/simditor/scripts/simditor.js"></script>

<jsp:include page="head.jsp"></jsp:include>

<body>
	<jsp:include page="nav.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>

	<style>
        .second{
            display: none;
        }
    </style>

	<!-- 点击，更改选中列表 -->
	<script>
		$(function(){
			//找到已经打开li的ul，去除in
			var change = $('#legal-menu');
			change.siblings('ul').removeClass('in');// 删除其他兄弟的in样式
			//将点击的li的ul，加入in展开
	    	change.addClass('in');// 添加当前元素的样式
		});
		
		$(function(){
			/* 初始化Simditor */
			Simditor.locale = 'zh-CN';//设置中文
	        var editor = new Simditor({
	            textarea: $('#editor'),  //textarea的id
	            placeholder: '输入软件详细介绍...',
	            toolbar:  ['title', 'bold', 'italic', 'underline', /* 'strikethrough', */ 'fontScale', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table', '|', 'link', 'image', 'hr', /* '|', */ 'indent', 'outdent', 'alignment'], //工具条都包含哪些内容
	            pasteImage: true,//允许粘贴图片
	            defaultImage: '/res/simditor/images/image.png',//编辑器插入的默认图片，此处可以删除
	            upload : {
	                url : 'richtext_img_upload.do', //文件上传的接口地址
	                params: null, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交
	                fileKey: 'upload_file', //服务器端获取文件数据的参数名
	                connectionCount: 3,
	                leaveConfirm: '正在上传文件'
	            }
	        });
			
			/* 点击重置，清空富文本框的内容 */
			$("#reset").click(function(){
				  $(".simditor-body").empty();
			});
			
			/* 解决图片预览不显示 */
			$('#icon_file').change(function() {
				var file = this.files[0];
				var reader = new FileReader();
				reader.onload = function() {
					var url = reader.result;
					setImageURL(url);
				};
				reader.readAsDataURL(file);
			});
			var image = $("#previewImg")[0];
			function setImageURL(url) {
				image.src = url;
			}
			
			/* 上传软件，显示软件大小 */
			$('#soft_file').change(function() {
				var file = this.files[0];
				if (file) {
	                var fileSize = 0;
	                if (file.size > 1024*1024){
	                	fileSize = (Math.round(file.size*100/(1024*1024))/100).toString();
	                	$('#size').after("MB");
	                }else{
	                	fileSize = (Math.round(file.size*100/1024)/100).toString();
	                	$('#size').after("KB");
	                }
				$('#size').val(fileSize);
	            }
			});
			
			/* 二级分类菜单 */
			$("#first").change(function(){
                var index = $(this).get(0).selectedIndex;
                // 利用ajax获取二级分类
                if(index > 0){
					$.ajax({
						url: 'soft.jsp',
						type: 'POST',
						data: {
							"v": "list",
							"catalog_id": index
						},
						/* dataType: 'json', */
						success: function(data) {
							var obj = JSON.parse(data);
							/* console.log(obj); */
							$('.second').empty();
							/* $('.second').append("<option>-------请选择二级分类-------</option>"); */
							for (var cid in obj) { //遍历json数组时，这么写p为索引，0,1
								/* console.log(cid + ":" + obj[cid]); */
								$('.second').append("<option value=" + cid + ">" + obj[cid] + "</option>");
							}
						},
						error: function() {
							alert("找不到该二级分类，请选择其它的一级分类试试！");
						}
					});
	                // 将二级分类遍历到jsp页面中
	                $('.second').hide().show();
                }else{
                	$('.second').hide();
                }
            });
			
		});
		
		/* form异步提交 */
		function soft_add_edit(){
			var v = $("#v").val();
			var softname = $("#softname").val();
			/* $("input[type=text]").each(function(){
				var input = $(this).val();
				if(input == ''){
					if(input == "name"){
						alert("软件名不能为空！");
					}else if(input == "version"){
						alert("软件版本不能为空！");return false;
					}else if(input == "size"){
						alert("请上传软件！");return false;
					}else if(input == "homepage"){
						alert("软件官网不能为空！");return false;
					}else if(input == "email"){
						alert("开发商邮箱不能为空！");return false;
					}
				}
			}); */
			$.ajax({
				type: "post",
				url:"soft.jsp",
				data: {"v":v},
				success: function(data){
					if(data.indexOf("|") != -1){
						var index = data.indexOf("|");
						var status = data.substr(0,index);
						var msg = data.substr(index+1);
						console.log(status);
						if(status == "success"){
							alert(msg);console.log(msg);
							refresh();
						}else if(status == "fail"){
							alert(msg);console.log(msg);
							history.go(-1);
						}
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	</script>

	<div class="content">

		<div class="header">

			<h1 class="page-title">
				<c:choose> 
					<c:when test="${empty info}">软件添加</c:when>      
	     			<c:otherwise>软件修改</c:otherwise> 
				</c:choose>
			</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.jsp">首页</a> <span class="divider">/</span></li>
			<li><a href="soft.jsp?v=query">软件列表</a> <span class="divider">/</span></li>
			<li class="active">
				<c:choose> 
					<c:when test="${empty info}">软件添加</c:when>      
	     			<c:otherwise>软件修改</c:otherwise> 
				</c:choose>
			</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<form action="" method="post" enctype="multipart/form-data">
				<%
					String canshu = request.getQueryString();
					int index = canshu.indexOf("v=");
					String key = null;
					if(canshu.indexOf("&") != -1){ //表示参数不止一个，截取v=至参数2:&之间的字符串
						int end = canshu.indexOf("&");
						key = canshu.substring(index + 2,end);
					}else{
						key = canshu.substring(index + 2); //只有一个参数v，直接截取后面所有字符串
					}
					request.setAttribute("key", key);
				%>
				<input type="hidden" name="v" value="${key == 'edit' ? 'editSoft' : 'addSoft'  }" id="v">
				<div class="well soft">
					<div class="row">
						<div class="span6">软件名称：<input type="text" name="softname" value="${info.name }" placeholder="请输入软件名称"></div>
						<div class="span6">软件分类：
							<select id="first">
								<option>-------请选择一级分类-------</option>
								<c:forEach items="${soft_catalog }" var="catalog">
									<option value='${catalog.id }'>${catalog.catalog }</option>
								</c:forEach>
							</select>
							<%-- 二级分类 --%>
							<select class="second" name="cid">
									    <option>-------请选择二级分类-------</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="span6">版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本：<input type="text" name="version" value="${info.version }" placeholder="请输入版本"></div>
						<div class="span6">软件类型：
							<select name="type">
								<option value="国产软件" selected>国产软件</option>
								<option value="国外软件">国外软件</option>
								<option value="汉化补丁">汉化补丁</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="span6">软件语言：
							<select name="language">
								<option value="简体中文" selected>简体中文</option>
								<option value="英文">英文</option>
								<option value="繁体中文">繁体中文</option>
								<option value="多国语言">多国语言</option>
							</select>
						</div>
						<div class="span6">软件授权：
							<select name="impower">
								<option value="免费版" selected>免费版</option>
								<option value="试用版">试用版</option>
								<option value="演示版">演示版</option>
								<option value="共享版">共享版</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="span6">软件大小：<input type="text" name="size" id="size" value="${info.size }" readonly></div>
						<div class="span6">应用平台：
							<select name="system">
								<option value="Windows" selected="selected">Windows</option>
								<option value="Linux">Linux</option>
								<option value="Android">Android</option>
								<option value="IOS">IOS</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="span6">软件官网：<input type="text" name="homepage" value="${info.homepage }" placeholder="请输入软件官网"></div>
						<div class="span6">开发商邮箱：<input type="text" name="email" value="${info.email }" placeholder="请输入开发商邮箱"></div>
					</div>
					<div class="row">
						<div class="span6">软件图标：
							<input type="file" name="icon" id="icon_file" accept="image/*" style="width:210px;"/>
							<img id="previewImg" src="" width="40" height="40" />
						</div>
						<div class="span6">软&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件：
							<input type="file" name="soft" id="soft_file" />
						</div>
					</div>
					<div class="row">
						<div class="span10">软件详情介绍：<textarea id="editor" name="body" autofocus>${info.body }</textarea></div>
					</div>
					
					<div class="btn-toolbar">
						<input type="submit" class="btn btn-primary" onclick="soft_add_edit()">
						<input type="reset" class="btn btn-success" id="reset">
					</div>
				</div>
				</form>
			</div>
		</div>
	
<jsp:include page="footer.jsp"></jsp:include>
