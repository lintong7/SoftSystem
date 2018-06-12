<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	Calendar calendar=Calendar.getInstance(); 
	int year=calendar.get(Calendar.YEAR); 
%>
<!-- 返回顶部 -->
<a class="back_to_top text-right" href=""><span class="glyphicon glyphicon-arrow-up"></span>顶部</a>
<script>
var backButton=$('.back_to_top');  
function backToTop() {  
    $('html,body').animate({  
        scrollTop: 0  
    }, 800);  
}  
backButton.on('click',backToTop);  

$(window).on('scroll', function () {/*当滚动条的垂直位置大于浏览器所能看到的页面的那部分的高度时，回到顶部按钮就显示 */  
    if ($(window).scrollTop() > 100){
        backButton.fadeIn();  
    }else{
        backButton.fadeOut();  
    }
});  
$(window).trigger('scroll');/*触发滚动事件，避免刷新的时候显示回到顶部按钮*/ 
</script>

<div class="container">
	<footer class="footer">
	        <p>© <%=year %> by LinTong</p>
	</footer>
</div>