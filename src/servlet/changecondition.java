package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBaccess;

public class changecondition extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public changecondition() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession ses = request.getSession();
		String str;
		if (ses.getAttribute("id") == null) {
			response.sendRedirect("/bumei/notlogin.jsp");
		} else {
			int id =(Integer) ses.getAttribute("id");
			DBaccess dba = new DBaccess();

			if (request.getParameter("find_id") != null) {
				try {
					int find_id = Integer.parseInt(request.getParameter("find_id"));
					str = "SELECT * FROM find WHERE id = " + find_id;
					java.sql.ResultSet rs = dba.access(str);
					rs.next();
					int userid = rs.getInt("userid");
					if(userid!=id){
						response.sendRedirect("/bumei/notlogin.jsp?info=13");
					}else{
						str = "UPDATE find SET condition = 1 WHERE id ="+ find_id;
						dba.update(str);
						response.sendRedirect("/bumei/notlogin.jsp?info=14");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (request.getParameter("lost_id") != null) {
				try {
					int lost_id = Integer.parseInt(request.getParameter("lost_id"));
//					System.out.println(lost_id);
					str = "SELECT * FROM lost WHERE id = " + lost_id;
					java.sql.ResultSet rs = dba.access(str);
					rs.next();
//					if(!rs.next())
//						System.out.println("XXXXXXXXXXXXXXX");
					
					int userid = rs.getInt("userid");
					
					if(userid!=id){
						response.sendRedirect("/bumei/notlogin.jsp?info=13");
					}else{
						str = "UPDATE lost SET condition = 1 WHERE id ="+ lost_id;
						dba.update(str);
						response.sendRedirect("/bumei/notlogin.jsp?info=14");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

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
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
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
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
