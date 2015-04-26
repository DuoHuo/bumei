<%@ page language="java" import="java.util.*,com.jspsmart.upload.SmartUpload;" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/cls_nuisterloser02.css"/>
<link href="css/cls_index.css" rel="stylesheet" type="text/css"/>
<!--[if IE 6]> 
<script type="text/javascript" src="js/png.js"></script>
<script>
  DD_belatedPNG.fix('*');
</script>
<![endif]--> 
<script type="text/javascript" src="js/hehe_cls.js"></script>
<title>寻物信息</title>
</head>
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
                <li><a href="/bumei/List_losts.jsp?page=1&sort=all" class="co_other">寻物信息</a></li>
                <li><a href="/bumei/List_finds.jsp?page=1&sort=all" class="co_other">招领信息</a></li>
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
    	  <%	
      	//	HttpSession sesss=request.getSession();
      		if(ses.getAttribute("id")!=null){
       %>
        	<div class="co_bodyheadhead02"></div>
        	 
        	<div class="co_bodytext">
                <div class="co_bodyhead">
                    <h2>发布信息</h2>
                    <div class="clear"></div>
                </div>
                <div class="co_bodybody">
                    <div class="co_bodybodyhead">
                        <p class="co_xunwu">请填写您的失物信息</p>
                        <input type="button" class="co_btnsure" style="display:none;" />
                        <div class="clear"></div>
                    </div>
        
                    <div class="co_bodytable" style="margin:30px auto auto 36px;">
     
                    <form action="/bumei/filerecieve.jsp" method="post" name="I_lost"  ENCTYPE="multipart/form-data">
                        <table>
                            <tr>
                                <td class="co_tb04">物品名称:</td>
                                <td class="co_tb03">
                                	<input type="text" name="name" />
                                </td>
                            </tr>
                            <tr>
                                <td class="co_tb04">物品类型:</td>
                                <td class="co_tb03">
                                	<select class="" name="sort">
                                    	<option value="资料">资料</option>
                                        <option value="衣物">衣物</option>
                                        <option value="交通">交通</option>
                                        <option value="随身">随身</option>
                                        <option value="数码">数码</option>
                                        <option value="卡类">卡类</option>
                                        <option value="其他">其他</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="co_tb04">丢失地点:</td>
                                <td class="co_tb03">
                                	<input type="text" name="location" />
                                </td>
                             </tr>
                            <tr>
                                <td class="co_tb04">丢失时间:</td>
                                <td class="co_tb03">
                                	<input type="text" name="losttime" />
                                </td>
                            </tr>
                            <tr>
                                <td class="co_tb04">详情描述:</td>
                                <td class="co_tb03">
                                	<textarea name="description"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="co_tb04">实物附图:</td>
                                <td class="">
                                <input type="file" name="photo" >
                                </td>
                                
                            </tr>
                        </table>
                        
                        <input type="submit" value="" class="co_suresub" />
                       </form>
               <!--        <form action="/bumei/filerecieve.jsp" method="post" name="I_lost" >
                        <table>
               				<tr>
                                <td class="co_tb04">实物附图:</td>
                                <td class="">
                                <input type="file" name="photo" >
                                </td>
                                <td class="">
                                 <input type="submit" name="submit" value = "确定">
                                 </td>
                            </tr>
                            </table>
                   </form>
                  
               --> 
       
                </div>  
                       </div>
                    
                     </div>
                     
                      <div class="co_bodybottom"></div> 	
        </div>
        <div class="clear"></div>
          
                       <%}
           else{%> 
                 </div>
                    
                     </div>
          
           <h1>
           			请先登录！
           </h1>
           <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
           
        <% }  %>
                   
                  
               
       
               
           
           
  
    <div class="lay_foot">
    	<div class="co_foot">
        	<p>多火网络科技有限公司 @2008-2011 苏ICP备10078587号</p>
        </div>
    	
    </div>

</body>
</html>
