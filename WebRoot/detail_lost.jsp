<%@ page language="java" import="java.util.*,dao.DBaccess" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/cls_nuisterloser02.css"/>
<!--[if IE 6]> 
<script type="text/javascript" src="js/png.js"></script>
<script>
  DD_belatedPNG.fix('*');
</script>
<![endif]--> 
<script type="text/javascript" src="js/hehe_cls.js"></script>
<title>寻物信息</title>
</head>
<%
	
		
		int i;
		DBaccess da=new DBaccess();
		//lost_id
		int lost_id=Integer.parseInt(request.getParameter("lost_id"));
		//获取losts 信息
		java.sql.ResultSet rslosts=da.access("SELECT * FROM lost WHERE  id = "+lost_id);
		
		rslosts.next();
		java.sql.ResultSet rsloster=da.access("SELECT * FROM users WHERE id = "+rslosts.getInt("userid"));
		rsloster.next();
		java.sql.ResultSet rsclues=da.access("SELECT * FROM clue WHERE  belongid = "+lost_id+" ORDER BY time ASC");
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
             </table>  <%} %>
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
    	<div class="co_body">
        	<div class="co_bodyheadhead02"></div>
        	<div class="co_bodytext">
                <div class="co_bodyhead">
                    <h2>寻物信息</h2>
                    <a  href="/bumei/I_find.jsp" class="co_loserbutton"><img src="image/loser_button02.png" width="113" height="45" /></a>
                    <div class="clear"></div>
                </div>
                 <div class="co_bodybody">
                    <div class="co_bodybodyhead">
                        <p class="co_xunwu">寻物信息详情</p>
                         <a  href="/bumei/servlet/changecondition?lost_id=<%=Integer.parseInt(request.getParameter("lost_id"))%>" class="co_btnsure"><img src="image/bg_btnsure.png" width="113" height="33" /></a>
                        
                        <div class="clear"></div>
                    </div>
                    <div class="co_bodytable">
                        <table>
                            <tr>
                                <td class="co_tb01">物品名称:</td>
                                <td class="co_tb02"><%=rslosts.getString("name") %></td>
                            </tr>
                            <tr>
                                <td class="co_tb01">物品类型:</td>
                                <td class="co_tb02"><%=rslosts.getString("sort") %></td>
                            </tr>
                            <tr>
                                <td class="co_tb01">丢失地点:</td>
                                <td class="co_tb02"><%=rslosts.getString("location") %></td>
                            </tr>
                            <tr>
                                <td class="co_tb01">丢失时间:</td>
                                <td class="co_tb02"><%=rslosts.getString("losttime") %></td>
                            </tr>
                            <tr>
                                <td class="co_tb01">&nbsp;联系人:</td>
                                <td class="co_tb02"><%=rsloster.getString("name") %></td>
                            </tr>
                            <tr>
                                <td class="co_tb01">&nbsp;联系方式:</td>
                                <td class="co_tb02"><%="TEL:"+rsloster.getString("telephone")+"	QQ:"+rsloster.getString("QQ")%></td>
                            </tr>
                            <tr>
                                <td class="co_tb01">详情描述:</td>
                                <td class="co_tb02"><%=rslosts.getString("description") %></td>
                            </tr>
                            <tr>
                                <td class="co_tb01">实物附图:</td>
                                <td class="co_tb02"><img src="<%=rslosts.getString("photo")%>"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <hr />
                <div class="co_subname">
                	<p>
                    	发布者：<span><%=rsloster.getString("name")  %></span>&nbsp;&nbsp;
                        发布时间：<span><%=rslosts.getString("time") %></span>
                    </p>
                </div>
                <div class="clear"></div>
                <div class="co_help">
                	<span>帮忙转发：</span>
                    <!-- JiaThis Button BEGIN -->
                    <div class="jiathis_style">
                        <a class="jiathis_button_qzone"></a>
                        <a class="jiathis_button_tsina"></a>
                        <a class="jiathis_button_tqq"></a>
                        <a class="jiathis_button_renren"></a>
                        <a class="jiathis_button_weixin"></a>
                        <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
                        <a class="jiathis_counter_style"></a>
                    </div>
                    <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1350377886205304" charset="utf-8"></script>
					<!-- JiaThis Button END -->
                </div>
                
                <div class="co_advisory_discuss">
                    <div class="co_advisory_discuss_head"></div>
               <form action="/bumei/servlet/clue" method="post" name="xiansuoform" >
              		 
                    <div class="co_advisory_discuss_body">
                        <span>提供线索：</span>
                        <textarea name="text"  placeholder = "说出你的问题或者说点你想说的..."></textarea>
                        <input type="hidden" name="belongid" value="<%=lost_id%>">
                        <input type="submit" value="提交"  />
                        
                        <div class="clear"></div>
                    </div>
              </form>
                    <div class="co_advisory_discuss_foot"></div>
                    <%
//*******线索
                    int num=1;
                    
                    int n=1;
                    while(rsclues.next()){
                     
                    %>
                    <ul>
                    
                        <li class="co_001">
                            <div class="co_advisory_discuss_li_head">
                                <p>来自<a href="#"><%=rsclues.getString("username") %></a>的线索：</p>
                                <div class="co_advisory_discuss_li_time">
                                    <span><%=rsclues.getString("time") %></span>
                                   
                                </div>
                                <div class="clear"></div>
                            </div>
                      
                            <div class="co_advisory_discuss_li_body">
                                <p><%=rsclues.getString("text") %></p>  
                            </div>
                             
                             <div class="co_advisory_discuss_li_foot">
                                来自
                                <a href="#" class="client">Android客户端</a>
                                <a href="#" class="report">举报</a>&nbsp;|&nbsp;<span><%=n++ %>楼</span>
                                <a class="reply" onclick="bton()" style=" cursor:pointer;">回复</a> 
                          
                            
                            
                            </div>
                           
                            
                          
                        </li>
                        
                        <div class="clear"></div>
                    </ul>
                      
                    <%} %>
              
                    <div class="fenye">
            <ul>
                <li><a href="#">上一页</a></li>
                <li class="on_fenye"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">下一页</a></li>
            </ul>
        </div>   
                </div>
            </div>
            <div class="co_bodybottom"></div> 	
        </div>
        <div class="clear"></div>
    </div>
    <div class="lay_foot">
    	<div class="co_foot">
        	<p>多火网络科技有限公司 @2008-2011 苏ICP备10078587号</p>
        </div>
    	
    </div>
</div>
<%
	rslosts.close();
 	da.close();
	rsclues.close();

 %>
</body>
</html>