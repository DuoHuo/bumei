package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Charcheck;
import dao.DBaccess;
import dao.Encode;

public class login extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public login() {
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
		HttpSession ses=request.getSession();
		if(ses.getAttribute("id").equals(null)){
			
		}
		else{
		ses.setAttribute("id",null);
		}
		response.sendRedirect("/bumei/index.jsp");
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
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		
//获得参数		
		String mailbox=Charcheck.check(request.getParameter("mailbox"));
		String password=Charcheck.check(request.getParameter("password"));
		password = Encode.encodeByMD5(Charcheck.check(password));
		String message=null;//登陆信息
		String redirurl="/bumei/index.jsp";
		String mailsql="SELECT * FROM users WHERE mailbox = '"+mailbox+"'";
		DBaccess dac=new DBaccess();
		java.sql.ResultSet res=null;
		res = dac.access(mailsql);
		boolean flag=false;
		int x=0;
		
		try {
			
			
			if(res.next()){
				int n,t=0;
				for(int i=0;i<res.getString("password").length()&&i<password.length();i++)
				{
					n=password.charAt(i)-res.getString("password").charAt(i);
					if(n==0||n==65470){
					}else{
						t=1;
					}
				}
//				System.out.println(res.getString("password")+"END");
//				System.out.println(password+"END");
				if(t==0){
					message="登陆成功!";	
					HttpSession ses=request.getSession();
					ses.setAttribute("id", res.getInt("id"));	
					ses.setAttribute("name",res.getString("name"));
					ses.setAttribute("college",res.getString("college"));
					flag=true;//是否跳转
				}
				else{
					x=15;
					message="密码错误！";
				}	
			}
			else
				x=16;
				message="该用户不存在";
			
			res.close();
			dac.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		out.println(message);		
		out.println("  </BODY>");
		out.println("</HTML>");
		if(flag){
			response.sendRedirect(redirurl);
			}
		else{
			response.sendRedirect("/bumei/notlogin.jsp?info="+x	);
		}
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
