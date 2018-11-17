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
    
    String yno = request.getParameter("yno");
    String yname = request.getParameter("yname");
    String ypwd = request.getParameter("ypwd");
    
    String ysql = "select * from student where sno='"+yno+"' and sname='"+yname+"' and spwd='"+ypwd+"'";
    
    Statement stu_value = conn.createStatement();//实例化对象
//  String sql = "insert into student(sno , sname , spwd) values (? ,? ,?)";//数据库写入方法二

//执行SQL语句

		if(conn != null){
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(ysql);			
				if(rs.next()){
					  out.println("<script language='javascript'>alert('登录成功！');window.location.href='../main.jsp';</script>");
				}else{
					 out.println("<script language='javascript'>alert('登录失败！');window.location.href='../login.jsp';</script>");
				}
			}									


// 	PreparedStatement preparedStatement = conn.prepareStatement(sql);
// 	preparedStatement.setString(1, no);
// 	preparedStatement.setString(2, pwd);
// 	preparedStatement.setString(1, sql);
// 	ResultSet resultSet = preparedStatement.executeQuery();

%>