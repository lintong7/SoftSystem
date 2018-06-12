<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	Calendar calendar = Calendar.getInstance();
	int year = calendar.get(Calendar.YEAR);
%>
<footer>
	<hr>
	<p class="pull-right">
		林桐 20140310216 <a> 基于JSP的软件下载系统的设计与实现</a>
	</p>
	<p>
		&copy;<%=year%><a> 软件管理系统</a>
	</p>
</footer>

</div>

</body>
</html>
<%
	String msg = (String) session.getAttribute("msg");
	if (msg != null) {
		out.print("<script>alert('上传成功');</script>"); //有提示信息，则alert
		session.removeAttribute("msg"); //清除msg消息
	}
%>