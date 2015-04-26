package dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBaccess {
	
	private String url="jdbc:sqlserver://localhost:1433;DatabaseName=bumei_ks";
	private String sqldriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private java.sql.Connection con;
	private java.sql.Statement sta;

	
	public DBaccess(){
		try {
			Class.forName(sqldriver);
			con= DriverManager.getConnection(url,"sa","sa");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public java.sql.ResultSet access(String s){
		
		java.sql.ResultSet rs=null;
		
		try {
			sta =con.createStatement();				
			rs=sta.executeQuery(s);								
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;					
	}

		
public int update(String s){
			
			int n = 0;
			try { 
				sta =con.createStatement();			
				n=sta.executeUpdate(s);							
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return n;					
		}

	
	public ArrayList searchuserinfo(String thing,String searchkey,String backkey) throws SQLException{
		java.sql.ResultSet rs=null;
		ArrayList res=new ArrayList();
		String sql = "SELECT * FROM user WHERE "+searchkey+" = '"+thing+"'";
		rs=this.access(sql);
		while(rs.next()){
			res.add(rs.getString(backkey));
		}
		rs.close();
		return res;		
	}
	public ArrayList searchuserinfobyid(int id,String backkey) throws SQLException{
		java.sql.ResultSet rs=null;
		ArrayList res=new ArrayList();
		String sql = "SELECT * FROM user WHERE id ="+id;
		rs=this.access(sql);
		while(rs.next()){
			res.add(rs.getString(backkey));
		}
		rs.close();
		return res;		
	}
	
	
	public int insertuserinfo(String things,String insertkeys) throws SQLException{
		
		int n=0;
		String sql = "INSERT INTO user ("+insertkeys+") VALUES ('"+things+"')";
		n=this.update(sql);
		return n;		
	}
	
	public int deleteuserinfo(String thing,String deletekey){
		int n=0;
		String sql = "DELETE FROM user WHERE "+deletekey+" = '"+thing+"'";
		n=this.update(sql);
		return n;		
	}
	public int deleteuserbyid(int x){
		int n=0;
		String sql = "DELETE FROM user WHERE id = "+x;
		n=this.update(sql);
		return n;		
	}
//	sql="update ��ݱ� set �ֶ���=�ֶ�ֵ where �������ʽ"
//			sql="update ��ݱ� set �ֶ�1=ֵ1,�ֶ�2=ֵ2 ���� �ֶ�n=ֵn where �������ʽ"
//	
	public int updateuserinfobyid(String things,String updatekeys,int x){
		int n=0;
		String sql = "UPDATE user SET "+updatekeys+" = '"+things+"' WHERE id ="+x;
		n=this.update(sql);
		return n;		
	}
			
		//
		//losts
		//
	
	public int insertlosts(String things,String insertkeys) throws SQLException{
		
		int n=0;
		String sql = "INSERT INTO lost ("+insertkeys+") VALUES ('"+things+"')";
		n=this.update(sql);
		return n;		
	}
	public int deletepostbyid(int x){
		int n=0;
		String sql = "DELETE FROM post WHERE id = "+x;
		n=this.update(sql);
		return n;		
	}
	public int updatepost(String things,String updatekeys,int x){
		int n=0;
		String sql = "UPDATE post SET "+updatekeys+" = '"+things+"' WHERE id ="+x;
		n=this.update(sql);
		return n;		
	}
	public ArrayList searchpostinfo(String thing,String searchkey,String backkey) throws SQLException{
		java.sql.ResultSet rs=null;
		ArrayList res=new ArrayList();
		String sql = "SELECT * FROM post WHERE "+searchkey+" = '"+thing+"'";
		rs=this.access(sql);
		while(rs.next()){
			res.add(rs.getString(backkey));
		}
		rs.close();
		return res;		
	}
	public ArrayList searchpostinfobyauthorid(int authorid,String backkey) throws SQLException{
		java.sql.ResultSet rs=null;
		ArrayList res=new ArrayList();
		String sql = "SELECT * FROM post WHERE authorid = "+authorid;
		rs=this.access(sql);
		while(rs.next()){
			res.add(rs.getString(backkey));
		}
		rs.close();
		return res;		
	}
	public ArrayList searchpostinfobyid(int id,String backkey) throws SQLException{
		java.sql.ResultSet rs=null;
		ArrayList res=new ArrayList();
		String sql = "SELECT * FROM post WHERE id ="+id;
		rs=this.access(sql);
		while(rs.next()){
			res.add(rs.getString(backkey));
		}
		rs.close();
		return res;		
	}
	
	public void close(){
		try {
			this.sta.close();
			this.con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	
}
