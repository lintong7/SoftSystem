<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>jQuery 二级联动</title>
    <style>
        .city{
            display: none;;
        }
        .city_first {
            display: block;
        }
    </style>
    <script src="resources/admin/js/jquery-1.7.2.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#province").change(function(){
                var index = $(this).get(0).selectedIndex;
                $('.city').hide().eq(index).show();
            });
        });
    </script>
</head>
<body>
<select id="province">
    <option>----请选择省份----</option>
    <option>北京</option>
    <option>上海</option>
    <option>江苏</option>
</select>
<select class="city city_first">
    <option>----请选择城市----</option>
</select>

<select class="city">
    <option>----请选择城市----</option>
    <option>东城</option>
    <option>西城</option>
    <option>崇文</option>
    <option>宣武</option>
    <option>朝阳</option>
</select>
<select class="city">
    <option>----请选择城市----</option>
    <option>黄浦</option>
    <option>卢湾</option>
    <option>徐汇</option>
    <option>长宁</option>
    <option>静安</option>
</select>
<select class="city">
    <option>----请选择城市----</option>
    <option>南京</option>
    <option>镇江</option>
    <option>苏州</option>
    <option>南通</option>
    <option>扬州</option>
</select>
</body>
</html>