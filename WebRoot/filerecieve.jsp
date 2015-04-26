<%@page import="dao.DBaccess,dao.Charcheck"%>
<%@page import="com.jspsmart.upload.Request"%>
<%@page import="com.jspsmart.upload.File"%>
<%@ page language="java"
	import="java.util.*, com.jspsmart.upload.SmartUpload,java.text.SimpleDateFormat,java.util.Date;"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'filerecieve.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<%
	response.setContentType("text/html;charset=utf-8");
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	HttpSession ses = request.getSession();
	if (ses.getAttribute("id") != null) {
		SmartUpload su = new SmartUpload();
		su.initialize(pageContext);
		su.upload();
		Request req = su.getRequest();
		String str;
		String losttime=null;
		String findtime=null;
		int lostid, findid;
		String thing_name =Charcheck.check(new String( req.getParameter("name").getBytes("GBK"),"UTF-8"));
		String sort =Charcheck.check(new String( req.getParameter("sort").getBytes("GBK"),"UTF-8"));
		String location =Charcheck.check(new String( req.getParameter("location").getBytes("GBK"),"UTF-8"));
		if(req.getParameter("losttime")!=null)
			losttime =Charcheck.check(new String( req.getParameter("losttime").getBytes("GBK"),"UTF-8"));
		if(req.getParameter("findtime")!=null)
			findtime =Charcheck.check(new String( req.getParameter("findtime").getBytes("GBK"),"UTF-8"));
		String description =Charcheck.checklitle(new String( req.getParameter("description").getBytes("GBK"),"UTF-8"));
		String photo = "";
			su.setMaxFileSize(10000);
			su.setAllowedFilesList("png,jpeg,jpg,gif");
/*		System.out.println(new String(req.getParameter("name").getBytes("GBK"),"UTF-8"));
//		System.out.println(Charcheck.check(new String(req.getParameter("name").getBytes("GBK"),"UTF-8")));
//		System.out.println(new String(req.getParameter("name").getBytes("GB2312"),"UTF-8"));
//		System.out.println(new String(req.getParameter("name").getBytes("GB18030"),"UTF-8"));
//		System.out.println(new String(req.getParameter("name").getBytes("unicode"),"UTF-8"));
		System.out.println(new String(req.getParameter("name").getBytes("BIG5"),"UTF-8"));
		System.out.println(new String(req.getParameter("name").getBytes("ISO-8859-1"),"UTF-8")); 
		System.out.println(new String(req.getParameter("name").getBytes("GB18030"),"UTF-8"));  	
*/		//	su.save("/upload");
		File file = su.getFiles().getFile(0);
		if (file.isMissing()) {
			photo = "photos/find_default.jpg";
		} else {
			photo = "photos/" + System.currentTimeMillis()
					+ Charcheck.check(file.getFileName());
			file.saveAs(photo);
		}
		str = "SELECT * FROM sysconfig";
		DBaccess dba = new DBaccess();
		java.sql.ResultSet rs = dba.access(str);
		rs.next();
		if (losttime != null) {
			lostid = rs.getInt("lostnum");
			lostid++;
			int userid = (Integer) ses.getAttribute("id");
			SimpleDateFormat df = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");//设置日期格式
			String time = df.format(new Date());
			str = "INSERT INTO lost (id,userid,name,sort,location,condition,time,losttime,description,photo)VALUES("
					+ lostid
					+ ","
					+ userid
					+ ",'"
					+ thing_name
					+ "','"
					+ sort
					+ "','"
					+ location
					+ "',"
					+ 0
					+ ",'"
					+ time
					+ "','"
					+ losttime
					+ "','"
					+ description
					+ "','"
					+ photo + "')";
			dba.update(str);
//			System.out.println(str);
			str = "UPDATE sysconfig SET lostnum = " + lostid;
			dba.update(str);
//			System.out.println(str);
			response.sendRedirect("/bumei/notlogin.jsp?info=10");
		} else if (findtime != null) {
			findid = rs.getInt("findnum");
			findid++;
			int userid = (Integer) ses.getAttribute("id");
			SimpleDateFormat df = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");//设置日期格式
			String time = df.format(new Date());
			str = "INSERT INTO find (id,userid,name,sort,location,condition,time,findtime,description,photo)VALUES("
					+ findid
					+ ","
					+ userid
					+ ",'"
					+ thing_name
					+ "','"
					+ sort
					+ "','"
					+ location
					+ "',"
					+ 0
					+ ",'"
					+ time
					+ "','"
					+ findtime
					+ "','"
					+ description
					+ "','"
					+ photo + "')";
			dba.update(str);
			str = "UPDATE sysconfig SET findnum = " + findid;
			dba.update(str);
//			System.out.println(str);
			response.sendRedirect("/bumei/notlogin.jsp?info=10");
		}
	} else {
		response.sendRedirect("/bumei/notlogin.jsp");
	}
%>
<body>
	This is my JSP page.
	<br>
</body>
</html>
