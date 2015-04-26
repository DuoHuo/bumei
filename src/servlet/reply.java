package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBaccess;

public class reply extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public reply() {
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession ses=request.getSession();
		//tousername username reply belongid
		DBaccess da=new DBaccess();
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = formatter.format(currentTime);
		
		String tousername=request.getParameter("tousername");
		String reply=request.getParameter("reply");
		String belongid=request.getParameter("belongid");
		String type=request.getParameter("type");
		String username;
		int userid;
		int id;
		if(ses.getAttribute("id").equals(null)){
			userid=0;
			username="游客";
		}else{
			userid=(Integer)ses.getAttribute("id");
			username=(String)ses.getAttribute("name");
		}
		
		
		id=(Integer) this.getServletContext().getAttribute("replynum");
		this.getServletContext().setAttribute("replynum",id+1);
		
		
		
		da.update("INSERT INTO reply (id,belongid,context,userid,time,tousername,username) VALUES ("+id+","+belongid+","+"'"+reply+"',"+userid+",'"+time+"','"+tousername+"','"+username+"')");
		if(type.equals("lost")){
		response.setHeader("refresh", "0;URL=detail_lost.jsp?lost_id="+belongid);
		}else{
		response.setHeader("refresh", "0;URL=detail_find.jsp?find_id="+belongid);	
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
