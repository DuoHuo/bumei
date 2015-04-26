<%@ page language="java"
	import="java.util.*,com.jspsmart.upload.SmartUpload;"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/cls_nuisterloser02.css" />
<link href="css/cls_index.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]> 
<script type="text/javascript" src="js/png.js"></script>
<script>
  DD_belatedPNG.fix('*');
</script>
<![endif]-->
<script type="text/javascript" src="js/hehe_cls.js"></script>
<title>系统消息</title>
</head>
<body>
	<div class="lay_all">
		<!--head begin-->
		<div class="lay_head">
			<div class="co_logo">
				<a href="#"><img src="image/logo.png" width="194" height="84" />
				</a>
			</div>
			<div class="co_head_li">
				<ul>
					<li><a href="/bumei/index.jsp" class="co_index">首页</a>
					</li>
					<li><a href="/bumei/List_losts.jsp?page=1&sort=all"
						class="co_other">寻物信息</a>
					</li>
					<li><a href="/bumei/List_finds.jsp?page=1&sort=all"
						class="co_other">招领信息</a>
					</li>
					<li><a href="#" class="co_other">我的信息</a>
					</li>
				</ul>
			</div>
			<div class="co_headinput">
				<input class="co_text" type="text" /><input class="co_button"
					type="submit" value="" />
			</div>
			<div class="co_headon">
				<% 
        	//session
		HttpSession ses=request.getSession();
        ses.getAttribute("id");
        if(ses.getAttribute("id")==null){ %>
				<p>
					<a onclick="insert02()" style="cursor:pointer;">登录</a><a
						href="/bumei/register_html.jsp">注册</a>
				</p>
				<a href="#" class="co_headqq"><img src="image/icon_qq.png"
					width="22" height="24" />
				</a> <a href="#" class="co_headrenren"> <img
					src="image/icon_renren.png" width="23" height="23" />
				</a> <a href="#" class="co_headsina"> <img src="image/icon_sina.png"
					width="24" height="22" />
				</a>
				<%}
           else{ 
           %>
				<table>
            <tr><td><%=ses.getAttribute("college") %></td> <td> <%=ses.getAttribute("name") %></td></tr>
             <tr><td><a href="/bumei/servlet/login?p=exit" >退出</a></td></tr>
             </table>
				<%} %>
			</div>
			<div class="clear"></div>
			<div class="co_bodytable" id="insert02"
				style="margin:5px auto auto 556px; display:none;">
				<form action="/bumei/servlet/login" method="post" name="login" >
        	<table>
            	<tr>
                	<td class="co_tb04">&nbsp;邮箱:</td>
                    <td class="co_tb03"><input name="mailbox" type="text" style="width:200px !important;"/></td>
                </tr>
                <tr>
                	<td class="co_tb04">&nbsp;密码:</td>
                    <td class="co_tb03"><input name="password" type="password" style="width:200px !important;"/></td>
                </tr>
            </table>
            
            <a href="#" style=" display:block; margin:-10px 0 5px 250px; color:#f55100; font-size:12px; text-decoration:none;">密码错误，找回密码？</a>
            <input type="submit" value=""  name="loginsubmit" class="co_suresub" style=" margin:0 0 0 330px;" />
            </form>
			</div>
		</div>
		<!--head end-->

		<div class="lay_body">
			<div class="co_body"></div>
		</div>

		<h1>
			<%
           			String info;
           			if(request.getParameter("info")!=null){
           				info=request.getParameter("info");
           				switch(Integer.parseInt(info))
           				{
           				case 10 : info="发布成功!";break;
           				case 11 : info="邮箱已存在，注册失败!";break;
           				case 12 : info="注册成功!";break;
           				case 13 : info="对不起，您无权修改他人数据！";break;
           				case 14 : info="状态修改成功！";break;
           				case 15 : info="密码错误！";break;
						case 16 : info="该用户不存在";break;
           				default : info="对不起，出错了！";
           				}
           			}
           			else
           				info="请先登录！"; 
           			
           				%>
			<%=info %>

		</h1>
		<br>
		<h2>
			<a href="/bumei/index.jsp">返回首页</a>
		</h2>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>










		<div class="lay_foot">
			<div class="co_foot">
				<p>多火网络科技有限公司 @2008-2011 苏ICP备10078587号</p>
			</div>

		</div>
</body>
</html>
