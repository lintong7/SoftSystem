<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '01.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/common.css" />
	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".thumbs a").click(function(){
				var largePath  = $(this).attr("href");
				var largeAlt = $(this).attr("title");
				$("#largeImg").attr({
					src : largePath,
					alt : largeAlt
				});
				return false;
			});
			
		});	
	</script>
  </head>
  
  <body>
	<h2>文件批量上传	</h2>
  	<form action="smartuploadServlet.do" method="post" enctype="multipart/form-data">
  		上传文件1：<input type="file" name="myfile1"><br>
  		上传文件2：<input type="file" name="myfile2"><br>
  		上传文件3：<input type="file" name="myfile3"><br>
  		<input type="submit" value="提交">${result}
  	</form>
  	<hr>
  	 <!-- 下载：<a href="smartDownloadServlet.do?filename=img2-lg.jpg">img2-lg.jpg</a> -->
  	 <h2>文件批量下载</h2>
  	 <form action="batchDownloadServlet.do">
  	 	<input type="checkbox"  name="filename" value="img2-lg.jpg">Image2
  	 	<input type="checkbox"  name="filename" value="img3-lg.jpg">Image3
  	 	<input type="checkbox"  name="filename" value="img4-lg.jpg">Image4
  	 	<input type="submit" value="下载">
  	 </form> 
  	<hr>
    <h2>图片预览</h2>
    <p><img id="largeImg" src="upload/icon/62e788c0b54c4ca7b3a8a67b48494106.jpg" alt="Large Image"/></p>
    <p class="thumbs">
    	<a href="upload/icon/62e788c0b54c4ca7b3a8a67b48494106.jpg" title="Image2"><img src="upload/icon/62e788c0b54c4ca7b3a8a67b48494106.jpg"></a>
    	<a href="upload/icon/46293c16262b4f408de7c392f62df20f.jpg" title="Image3"><img src="upload/icon/46293c16262b4f408de7c392f62df20f.jpg"></a>
    	<a href="upload/icon/f5ad33d7f04c4d02ba226333f66011ff.jpg" title="Image4"><img src="upload/icon/f5ad33d7f04c4d02ba226333f66011ff.jpg"></a>
    </p>
  </body>
</html>
