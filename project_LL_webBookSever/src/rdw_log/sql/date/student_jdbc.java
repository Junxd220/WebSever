package rdw_log.sql.date;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import rdw_link.sql.jdbc;

public class student_jdbc extends jdbc{
	
	//��ȡ�û��б�
	public List<student_value> getUser(){
		List<student_value>userList = new ArrayList<student_value>();
		student_value user = new student_value();
		String sql = "select * from student";
		try{
			ResultSet rs = this.executeQuery(sql,null);
			while(rs.next()){
				user.setNo(rs.getString("sno"));
				user.setName(rs.getString("sname"));
				user.setPwd(rs.getString("spwd"));
				userList.add(user);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return userList;
		}
	
		//����ѧ�Ż�ȡ�û�
		public student_value getUserByName(String no){
			student_value user = null;
			String sql = "SELECT * FROM student WHERE��sno = ?";
			try{            
				ResultSet rs = this.executeQuery(sql, new String[]{no});
				if(rs.next()){
					user = new student_value();
					user.setNo(rs.getString("sno"));
					user.setName(rs.getString("sname"));
					user.setPwd(rs.getString("spwd"));
				}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
			return user;
		}
		//�޸��û���Ϣ
		public boolean editUser(student_value user){
			boolean r = false;
			String sql = "update student set sno = ?,sname = ?,spwd = ?";
			try{
				int num = this.executeUpdate(sql, new String[]{user.getNo(),user.getName(),user.getPwd()});
				if(num > 0){
					r = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
			return r;
		}
				
		//����û�
		public boolean addUser(student_value user){
			boolean r = false;
			String sql = "insert into student(sno,sname,spwd) values(?,?,?) ";
			try{
				int num = this.executeUpdate(sql,new String[]{user.getNo(),user.getName(),user.getPwd()});
				if(num > 0){
					r = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
			return r;
		}
		
		//ɾ��ָ���û�
		public boolean delUser(String no){
			boolean r = false;
			String sql = "delete from student where sno = ?";
			try{
				int num = this.executeUpdate(sql,new String[]{no});
				if(num > 0){
					r = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
			return r;
		}
		
}
