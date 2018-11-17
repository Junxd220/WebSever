<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page import="java.sql.*"%>
<%@ page import="rdw_log.sql.date.*"%>

<%
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/web_booksever";
	String user = "root";
	String password = "1234";
	Connection conn = null;

	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,user,password);
	}catch(ClassNotFoundException e){
		e.printStackTrace();
	%> 数据库连接出错啦!<br> <%
	}catch(SQLException e){
		e.printStackTrace();
	%> 数据库连接出错啦!<br> <%
	}
// 	System.out.print(conn);
	
	request.setCharacterEncoding("UTF-8");//强制数据输入类型
	
    String no = request.getParameter("sno");
    String name = request.getParameter("sname");
    String pwd = request.getParameter("spwd");
    
    String sql = "insert into student(sno , sname , spwd) values ('"+no+"','"+name+"','"+pwd+"')";
    
    Statement stu_value = conn.createStatement();//实例化对象
//  String sql = "insert into student(sno , sname , spwd) values (? ,? ,?)";//数据库写入方法二


//执行SQL语句

    try {
	int val = stu_value.executeUpdate(sql);
	if(val == 1){ %>
	数据插入成功<br>
	<a href="../login.jsp" align="center" >返回登陆界面</a><br>
	<a href="../main.jsp" align="center" >返回首页</a><br>
	<% 
		student_value re = new student_value();
		re.setNo(no);
		re.setName(name);
		re.setPwd(pwd);
		out.println("<script language='javascript'>alert('注册用户成功！');</script>");
	} else{ %>
	数据插入失败<br>
	<% }
	} catch(Exception e) {
		e.printStackTrace();
	}



// 	PreparedStatement preparedStatement = conn.prepareStatement(sql);
// 	preparedStatement.setString(1, no);
// 	preparedStatement.setString(2, pwd);
// 	preparedStatement.setString(1, sql);
// 	ResultSet resultSet = preparedStatement.executeQuery();

%>