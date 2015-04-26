<%@ page language="java" import="java.util.*,dao.DBaccess" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/cls_index.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="css/cls_nuisterloser02.css"/>
<!--[if IE 6]> 
<script type="text/javascript" src="js/png.js"></script>
<script>
  DD_belatedPNG.fix('*');
</script>
<![endif]--> 
<script type="text/javascript" src="js/hehe_cls.js"></script>
</head>

<%
	/*	if(this.getServletContext().getAttribute("userid")==null){
		this.getServletContext().setAttribute("userid",1100000);
		}
		if(this.getServletContext().getAttribute("clueid")==null){
		this.getServletContext().setAttribute("clueid",8000000);
		}
		if(this.getServletContext().getAttribute("findid")==null){
		this.getServletContext().setAttribute("findid",7000000);
		}
		if(this.getServletContext().getAttribute("lostid")==null){
		this.getServletContext().setAttribute("lostid",5000000);
		}*/
 %>
<%
		
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		int i;
		boolean flag=true;
		DBaccess da=new DBaccess();
		
		//缩略信息
		String real;
		//获取find 信息
		//sql="select top 10 * from 数据表 where 字段名 order by 字段名 "
		java.sql.ResultSet rsfinds=da.access("SELECT * FROM find WHERE  condition = 0 ORDER BY time desc");
		//获取lost 信息
		java.sql.ResultSet rslosts=da.access("SELECT * FROM lost WHERE  condition = 0 ORDER BY time desc");
		
		//获取雷锋榜 信息
		int userid_leifeng;
		java.sql.ResultSet rsleifeng=da.access("SELECT * FROM find WHERE condition = 1 ORDER BY time desc");
	
		//获取成功榜
		int userid_gets;
		java.sql.ResultSet rsgets=da.access("SELECT * FROM lost WHERE condition = 1 ORDER BY time desc");
	
		
 %>
 			
<body>
	<div class="all">
<!--head begin-->
    <div class="lay_head">
        <div class="co_logo">
            <a href="#"><img src="image/logo.png" width="194" height="84" /></a>
        </div>
        <div class="co_head_li">
            <ul>
               <li><a href="/bumei/index.jsp" class="co_index">首页</a></li>
                <li><a href="/bumei/List_losts.jsp?page=1&sort=全部" class="co_other">寻物信息</a></li>
                <li><a href="/bumei/List_finds.jsp?page=1&sort=全部" class="co_other">招领信息</a></li>
                <li><a href="#" class="co_other">我的信息</a></li>
            </ul>
        </div>
        <div class="co_headinput">
            <input class="co_text" type="text" /><input class="co_button" type="submit" value="" />
        </div>
        
        <div class="co_headon">
        <% 
        	//session
		HttpSession ses=request.getSession();
        ses.getAttribute("id");
        if(ses.getAttribute("id")==null){ %>
            <p><a onclick="insert02()" style="cursor:pointer;">登录</a><a href="/bumei/register_html.jsp">注册</a></p>
            <a href="#" class="co_headqq"><img src="image/icon_qq.png" width="22" height="24" /></a>
            <a href="#" class="co_headrenren"> <img src="image/icon_renren.png" width="23"  height="23" /></a>
            <a href="#" class="co_headsina"> <img src="image/icon_sina.png" width="24" height="22" /></a>
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
        <div class="co_bodytable" id="insert02" style="margin:5px auto auto 556px; display:none;">
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
<!--中部-->
        <div class="center">
        	<div class="left_1">
            	<a class="le1" href="#"></a>
                <div class="le2">
                	<ul>
                	 <% for(i=0;i<10&&rsleifeng.next();i++){ 
                			 userid_leifeng=rsleifeng.getInt("userid");
                			 java.sql.ResultSet user_leifeng=da.access("SELECT * FROM users WHERE id = "+userid_leifeng);
                			 user_leifeng.next();
                	  %>
                    	<li><a href="/bumei/detail_find.jsp?find_id=<%=rsleifeng.getInt("id") %>"><%=user_leifeng.getString("name") %> </a></li>
                 	<%} %>
                	</ul>
            	</div>
            </div>
            <div class="cent_1">
            	<div class="ce1">
                	<a class="c1" href="#"></a>
                    <div class="c2">
                    	<ul>
                        	<li class="c3"><span class="c4">类型</span><span class="c5">名称</span><span class="c6">地点</span><span class="c7">描述</span></li>
                            <% for(i=0;i<9&&rsfinds.next();i++){ 
                       		if(rsfinds.getString("description").length()>7){
                       		real=rsfinds.getString("description").substring(0,7)+"...";
                       		}
                       		else{
                       		real=rsfinds.getString("description");
                       		}
                      		 %>
                      		 <li class="c8"><a href="/bumei/detail_find.jsp?find_id=<%=rsfinds.getInt("id") %> " ><span class="c4"><%=rsfinds.getString("sort") %></span><span class="c5"><%=rsfinds.getString("name") %></span><span class="c6"><%=rsfinds.getString("location") %></span><span class="c7"><%=real %></span></a></li>
                      		 <%} %>
                           </ul>	
                    </div>
                    <div class="clear"></div>
                    <div class="c9">
                    	<a href="/bumei/List_finds.jsp?page=1&sort=全部"></a>
                    </div>
                    <div class="c11" style="z-index:9999">
                    	<a href="/bumei/I_find.jsp"  style="z-index:9999"></a>
                    </div>
                </div>
                <div class="ce2">
                	<a class="c1" href="#"></a>
                    <div class="c2">
                    	<ul>
                        	<li class="c3"><span class="c4">类型</span><span class="c5">名称</span><span class="c6">地点</span><span class="c7">描述</span></li>
                             <% for(i=0;i<9&&rslosts.next();i++){ 
                       		if(rslosts.getString("description").length()>7){
                       		real=rslosts.getString("description").substring(0,7)+"...";
                       		}
                       		else{
                       		real=rslosts.getString("description");
                       		}
                      		 %>
                      		 <li class="c8"><a href="/bumei/detail_lost.jsp?lost_id=<%=rslosts.getInt("id") %>"><span class="c4"><%=rslosts.getString("sort") %></span><span class="c5"><%=rslosts.getString("name") %></span><span class="c6"><%=rslosts.getString("location") %></span><span class="c7"><%=real %></span></a></li>
                      		 <%} %>
                              </ul>	
                    </div>
                    <div class="clear">
                    </div>
                    <div class="c9">
                    	<a href="/bumei/List_losts.jsp?page=1&sort=全部"></a>
                    </div>
                    <div class="c11">
                    	<a href="/bumei/I_lost.jsp"></a>
                    </div>
                </div>
            </div>
            <div class="right_1">
                <a class="ri1" href="#"></a>
                <div class="ri2">
                	<ul>
                	 <% for(i=0;i<5&&rsgets.next();i++){ 
                			 userid_gets=rsgets.getInt("userid");
                			 java.sql.ResultSet user_gets=da.access("SELECT * FROM users WHERE id = "+userid_gets);
                			 user_gets.next();
                	  %>
                    	<li><a href="/bumei/detail_lost.jsp?lost_id=<%=rsgets.getInt("id") %>"><%=user_gets.getString("name") %> 成功找到他丢失的 <%=rsgets.getString("name") %></a></li>
                 	<%} %>
               		</ul>
            	</div>
            </div>
            <div class="clear"></div>
            <div class="di1"></div>
            
        </div>
<!--中部end--> 
<!--底部-->
        <div class="bottom">
            <div class="bottom1">
                <div class="bo1">
                	<p>
                    	<a href="#"><span class="b1"></span>有人捡到东西<span class="b2">/快去看看吧!</span></a>
                    </p>
                </div>
                <div class="clear"></div>
                <div class="bo2">
                    <ul>
                        <li><a class="b3" href="#"><img src="image/jiantou.png" /></a></li>
                 <%
                		java.sql.ResultSet pictures_find=da.access("SELECT * FROM find WHERE  condition = 0 ORDER BY time desc");
 						i=0;
                		while(i<4&&pictures_find.next()){
                		i++;
                		if(pictures_find.getString("photo").equals("image/find_default.jpg")){
                		continue;
                		}
                		else{
                 %>
                        <li><a href="/bumei/detail_find.jsp?find_id=<%=pictures_find.getInt("id") %>"><img src="<%=pictures_find.getString("photo") %>" height = 150px width = 200px/></a></li>
                 <%
                		 }
                        }
                 %>
                        <li><a class="b4" href="#"><img src="image/jiantou-2.png"/></a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div> 
            <div class="bottom2">
                <div class="bo3">
                    <ul>
                        <li><a href="#">人人网</a></li> 
                        <li><a href="#">新浪微博</a></li> 
                        <li><a href="#">腾讯微博</a></li> 
                        <li><a href="#">新浪微博</a></li>  
                        <li><a href="#">人人网</a></li>  
                        <li><a href="#">新浪微博</a></li>  
                        <li><a href="#">腾讯微博</a></li> 
                        <li><a href="#">新浪微博</a></li>  
                        <li><a href="#">人人网</a></li>  
                        <li><a href="#">新浪微博</a></li>  
                        <li><a href="#">腾讯微博</a></li>  
                        <li><a href="#">新浪微博</a></li>  
                        <li><a href="#">人人网</a></li>  
                        <li><a href="#">新浪微博</a></li>  
                        <li><a href="#">腾讯微博</a></li>  
                        <li><a href="#">新浪微博</a></li>
                    </ul>
                </div>
            </div>
            <div class="bottom3">
                <div class="bo4">
                    <ul>
                        <li><a href="#">多火网络科技有限公司 @2008-2011 苏ICP备10078587号</a></li>
                    </ul>
                </div>
            </div>
    	</div>

<!--底部end--> 
    </div>

</body>
<%
 			da.close();
 			rsfinds.close();
 			rslosts.close();
 			rsleifeng.close();
 			rsgets.close();
 			pictures_find.close();
%>
</html>
