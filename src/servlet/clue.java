package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Charcheck;
import dao.DBaccess;

public class clue extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public clue() {
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
		
		HttpSession ses=request.getSession();
		String text = Charcheck.checklitle(request.getParameter("text"));
		int  belongid = Integer.parseInt(Charcheck.check(request.getParameter("belongid")));
		
		if(ses.getAttribute("id")!=null){
			int userid= (Integer)(ses.getAttribute("id"));
			String username = (String) ses.getAttribute("name");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String time =df.format(new Date());
			DBaccess dba = new DBaccess();
			java.sql.ResultSet rs = dba.access("SELECT * FROM sysconfig");
			try {
				rs.next();
				int cluenum = rs.getInt("cluenum");
				cluenum++;
				String str = "INSERT INTO clue (id,belongid,userid,username,text,time)VALUES("+cluenum
						+","+belongid+","+userid+",'"+username+"','"+text+"','"+time+"')"; 
				dba.update(str);
				str = "UPDATE sysconfig SET cluenum = "+cluenum;
				dba.update(str);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(belongid>=3000000)
				response.sendRedirect("/bumei/detail_lost.jsp?lost_id="+belongid);
			else
				response.sendRedirect("/bumei/detail_find.jsp?find_id="+belongid);
		}else{
			response.sendRedirect("/bumei/notlogin.jsp");
		}
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
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
