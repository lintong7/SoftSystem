<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>${CatalogName }</title>
	<jsp:include page="WEB-INF/index/head.jsp"></jsp:include>
</head>

<body>
	<!-- common top -->
	<jsp:include page="WEB-INF/index/top.jsp"></jsp:include>
	
	<!-- body -->
	<div class="container mt15 commons mh400">
		<div class="commons-title"><h2>${CatalogName }</h2></div><hr>	
		<div class="col-xs-12 list-menu">
			<c:forEach items="${list }" var="list">
				<div class="col-md-2"><a href="soft.jsp?v=info&id=${list.id }"><img src="upload/icon/${list.icon }" class="img-rounded"><p>${list.name }</p></a></div>
			</c:forEach>
		</div>
	</div>
	
	<!-- footer -->
    <jsp:include page="WEB-INF/index/footer.jsp"></jsp:include>
    
</body>
</html>