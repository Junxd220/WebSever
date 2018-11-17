<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="rdw_log.sql.date.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>吕梁学院BookSever</title>
	</head>

	<body>
	<p align="center">这里是吕梁学院BookSever项目注册页</p><br>

<form action="SQL_Date/Student_value.jsp" method="post">

<table align="center">  
	<tr><td>学  号：</td><td><input type="int" name="sno" placeholder="请输入学号"></td></tr> 
	<tr><td>姓  名：</td><td><input type="text" name="sname" placeholder="请输入姓名"></td></tr>   
	<tr><td>密  码：</td><td><input type="password" name="spwd" placeholder="请输入密码"></td></tr>  
	<tr><td>确认密码：</td><td><input type="password" name="spwd2" placeholder="再次输入密码"></td></tr>
<!-- 	<tr><td>验证码：</td><td valign="bottom"><input type="text" name="vercode" size="10"> <img alt="" src="authImg" mce_src="authImg" id="authImg" align="absmiddle"><a href="#" mce_href="#" onclick="refresh()"><span style="font-size:12px" mce_style="font-size:12px">刷新验证码</span></a></td>  </tr> -->

	
	<tr>
        <td><input type="submit" value="提交">
        <input type="reset" value="重填"></td>  
    </tr>
</table>  
</form>  
<%
	student_value mm = new student_value();
	String spwd = new String();
	String spwd2 = new String();
	if(spwd != spwd2){
	out.println("<script language='javascript'>alert('两次密码不正确！');</script>");
	}
%>

	</body>
</html>
