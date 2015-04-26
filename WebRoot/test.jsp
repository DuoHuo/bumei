<%@ page language="java" import="java.util.*,com.jspsmart.upload.SmartUpload;" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>     
  <head>     
    <title>My JSP 'uploadimage.jsp' starting page</title>     
  </head>   
  <body>     
 <FORM METHOD="POST" ENCTYPE="multipart/form-data" ACTION="/bumei/filerecieve.jsp">
 <input type="text" name = xxx>
<INPUT TYPE="FILE" NAME="MYFILE">
<INPUT TYPE="SUBMIT">
</FORM>
  </body>  
</html>   