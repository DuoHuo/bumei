<%@ page language="java" import="java.util.*,dao.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/cls_nuisterloser.css"/>
<link href="css/cls_index.css" rel="stylesheet" type="text/css"/>
<!--[if IE 6]> 
<script type="text/javascript" src="../js/png.js"></script>
<script>
  DD_belatedPNG.fix('*');
</script>
<![endif]--> 
<title>列表页</title>
<script type="text/javascript" src="js/hehe_cls.js"></script>
</head>
<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		int i;
		//获得参数page
		int pagenum=Integer.parseInt(request.getParameter("page"));
		//获得参数sort
		String sort=request.getParameter("sort");
		DBaccess da=new DBaccess();
		//缩略信息
		String real;
		//获取losts 信息
		java.sql.ResultSet rslosts;
		if(sort.equals("全部")){
		rslosts = da.access("SELECT * FROM lost WHERE  condition = 0 ORDER BY time desc" );
		}else{
		rslosts=da.access("SELECT * FROM lost WHERE sort = '"+sort+"' AND condition = 0 ORDER BY time desc" );
		}
		//下一页判断
		boolean flag=false;
		
			
 %>
<body>
<div class="lay_all">
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
             </table> <%} %>
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
    <div class="lay_body">
    	<div class="co_body02">
        	<div class="co_bodyhead02">
            	<h2>寻物信息</h2>
                <ul>
                	<li class="ondisplay"><a href="/bumei/List_losts.jsp?page=1&sort=全部">全部</a></li>
                    <li><a href="/bumei/List_losts.jsp?page=1&sort=资料">资料</a></li>
                    <li><a href="/bumei/List_losts.jsp?page=1&sort=衣物">衣物</a></li>
                    <li><a href="/bumei/List_losts.jsp?page=1&sort=交通">交通</a></li>
                    <li><a href="/bumei/List_losts.jsp?page=1&sort=随身">随身</a></li>
                    <li><a href="/bumei/List_losts.jsp?page=1&sort=数码">数码</a></li>
                    <li><a href="/bumei/List_losts.jsp?page=1&sort=卡类">卡类</a></li>
                    <li><a href="/bumei/List_losts.jsp?page=1&sort=其他">其他</a></li>
                </ul>
                <a  href="/bumei/I_lost.jsp" class="co_loserbutton"><img src="image/loser_button.png" width="113" height="45" /></a>
                <div class="clear"></div>
            </div>
            <div class="co_bodybody">
            	<ul class="co_title">
                	<li><span>物品类型</span></li>
                    <li><span>物品名称</span></li>
                    <li><span>丢失地点</span></li>
                    <li><span>物品描述</span></li>
                    <li class="co_fabutime"><span>发布时间</span></li>
                </ul>
                <ul class="co_libody">
                <!--下列有19个例-->
                 <% 
                 int down=(pagenum-1)*15;
                 int up=down+15;
                 int number=0;
                 for(i=0;rslosts.next();i++){ 
                
                 if(number>=down&&number<up){
                			if(rslosts.getString("description").length()>40){
                       		real=rslosts.getString("description").substring(0,39)+"...";
                       		}
                       		else{
                       		real=rslosts.getString("description");
                       		}
                  %>
                	<li>
                    	<a href="detail_lost.jsp?lost_id=<%=rslosts.getInt("id") %>">
                        	<span class="co_li01"><%=rslosts.getString("sort") %></span>
                            <span class="co_li02"><%=rslosts.getString("name") %></span>
                            <span class="co_li03"><%=rslosts.getString("location") %></span>
                            <span class="co_li04"><%=real %></span>
                            <span class="co_li05"><%=rslosts.getString("time") %></span>
                        </a>
                    </li>
                   
                    <%}
                    else if(number==up){
                    flag=true;
                    }
                    number++; 
                    
                    }%>
                    <div class="clear"></div>
                </ul>
            </div>
            
        	
        </div>
        <div class="fenye">
            <ul>
            <%if(pagenum>1){ %>
                <li><a href="/bumei/List_losts.jsp?page=<%=pagenum-1 %>&sort=<%=sort %>">上一页</a></li>
                <li><a href="/bumei/List_losts.jsp?page=<%=pagenum-1 %>&sort=<%=sort %>"><%=pagenum-1 %></a></li>
                <%} %>
                
                <li class="on_fenye"><a href="/bumei/List_losts.jsp?page=<%=pagenum %>&sort=<%=sort %>"><%=pagenum %></a></li>
                
                <%if(flag){ %>
                <li><a href="/bumei/List_losts.jsp?page=<%=pagenum+1 %>&sort=<%=sort %>"><%=pagenum+1 %></a></li>
                <li><a href="/bumei/List_losts.jsp?page=<%=pagenum+1 %>&sort=<%=sort %>">下一页</a></li>
                <%} %>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lay_foot">
    	<div class="co_foot">
        	<p>多火网络科技有限公司 @2008-2011 苏ICP备10078587号</p>
        </div>
    	
    </div>
</div>
</body>
</html>
