package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Charcheck;
import dao.DBaccess;
import dao.Encode;

public class Register extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Register() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");	
		String mailbox = request.getParameter("mailbox");
		String restr="";
		DBaccess dba = new DBaccess();
		String str="SELECT * FROM users WHERE mailbox = '"+mailbox+"'";
		try {
			if(dba.access(str).next()){
		//邮箱已存在
				restr="该邮箱已存在注册失败";
				response.sendRedirect("/bumei/notlogin.jsp?info=11");
			}
			else{
		//注册 
				str="SELECT * FROM sysconfig";
				java.sql.ResultSet rs = dba.access(str);
				rs.next();
				int id = rs.getInt("usernum")+1;
				String name = request.getParameter("name");
				String password = Charcheck.check(request.getParameter("password"));
				password =Encode.encodeByMD5(password);
				String college = Charcheck.check(request.getParameter("college"));
				String sex = Charcheck.check(request.getParameter("sex"));
				String QQ = Charcheck.check(request.getParameter("QQ"));
				String telephone = Charcheck.check(request.getParameter("telephone"));
				String text = Charcheck.checklitle(request.getParameter("text"));
				str = "INSERT INTO users (id,name,mailbox,password,college,QQ,telephone,sex,text)VALUES("+id+",'"+name+"','"+mailbox+"','"+password+"','"
				+college+"','"+QQ+"','"+telephone+"','"+sex+"','"+text+"')";
	//			System.out.println(str);
				dba.update(str);
				str = "UPDATE sysconfig SET usernum = "+id;
				dba.update(str);
				restr="注册成功！";
				response.sendRedirect("/bumei/notlogin.jsp?info=12");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print(restr);
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	
	      

}
