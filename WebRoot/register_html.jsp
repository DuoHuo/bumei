<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
 <script type="text/javascript">
function validate_email(field,alerttxt)
{
with (field)
{
apos=value.indexOf("@");
dotpos=value.lastIndexOf(".");
if (apos<1||dotpos-apos<2) 
  {alert(alerttxt);return false;}
else {return true;}
}
}
function validate_form(thisform)
{
with (thisform)
{
if (validate_email(mailbox,"邮箱格式错误!")==false)
  {mailbox.focus();return false;}
  else if(thisform.password.value==""){alert("密码不能为空!");thisform.password.focus();return false;}
  else if(thisform.password.value.length<6){alert("密码不能少于6位!");thisform.password.focus();return false;}
  else if(thisform.password.value!=thisform.repassword.value){alert("两次输入的密码不一致!");thisform.password.focus();return false;}
	else return true;
}
}
function checkInputChar(strInput){ 
var forbidChar = new Array(",","-","/","//","'","%","/","=","!"); 
for (var i = 0;i < forbidChar.length ; i++){ 
  if(strInput.indexOf(forbidChar[i]) >= 0){ 
            alert("您输入的信息: "+strInput+" 中含有非法字符: "+forbidChar[i]+" 请更正！"); 
      return false; 
  } 
} 
return true; 
} 
</script>
<title>注册信息</title>
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
    	<div class="co_body">
        	<div class="co_bodyheadhead"></div>
        	<div class="co_bodytext">
                <div class="co_bodyhead">
                    <h2>注册信息</h2>
                    <div class="clear"></div>
                </div>
                <div class="co_bodybody">
                    <div class="co_bodybodyhead">
                        <p class="co_zhaolin">请填写您的注册信息</p>
                        <input type="button" class="co_btnsure" style="display:none;" />
                        <div class="clear"></div>
                    </div>
                    <div class="co_bodytable" style="margin:30px auto auto 36px;">
                    
         <form action="/bumei/servlet/Register" name="revise" onsubmit="return validate_form(this);" method="post">
                        <table>
                            <tr>
                                <td class="co_tb04">&nbsp;联系人:</td>
                                <td class="co_tb03">
                                	<input type="text" name="name" />
                                </td>
                                <td><span>*必填</span></td>
                            </tr>
                            <tr>
                                <td class="co_tb04">&nbsp;学院:</td>
                                <td class="co_tb03">
                                	<input type="text" name="college" />
                                </td>
                                <td><span>*必填</span></td>
                            </tr>
                            <tr>
                                <td class="co_tb04">&nbsp;邮箱:</td>
                                <td class="co_tb03">
                                	<input type="text" name="mailbox" />
                                </td>
                                <td><span>*必填</span></td>
                            </tr>
                            <tr>
                                <td class="co_tb04">&nbsp;密码:</td>
                                <td class="co_tb03">
                                	<input type="password" name="password"/>
                                </td>
                                <td><span>*必填</span></td>
                            </tr>
                            <tr>
                                <td class="co_tb04">&nbsp;重复密码:</td>
                                <td class="co_tb03">
                                	<input type="password" name="repassword" />
                                </td>
                                <td><span>*必填</span></td>
                            </tr>
                            <tr>
                                <td class="co_tb04">性别:</td>
                                <td class="co_tb03">
                                	<select class="" name="sex">
                                    	<option value="男">男</option>
                                        <option value="女">女</option>
                                        <option value="保密">保密</option>
                                    </select>
                                </td> 
                                <td><span>*必填</span></td>
                            </tr> 	
                            <tr>
                                <td class="co_tb04">&nbsp;QQ:</td>
                                <td class="co_tb03">
                                	<input type="text" name="QQ" style=" float:left;width:191px !important; height:28px; border:1px solid #ccc; font-size:14px; color:#666; padding:0 10px 0 10px; line-height:28px;" />
                                  
                                </td>
                                <td><span>*请正确填写，方便联系！</span></td>
                            </tr>
                            <tr>
                                <td class="co_tb04">&nbsp;手机:</td>
                                <td class="co_tb03">
                                	<input type="text" name="telephone" style=" float:left;width:191px !important; height:28px; border:1px solid #ccc; font-size:14px; color:#666; padding:0 10px 0 10px; line-height:28px;"  />
                                 
                                </td>
                                <td><span>*请正确填写，方便联系！</span></td>
                            </tr>
                            <tr>
                                <td class="co_tb04">签名：</td>
                                <td class="co_tb03">
                                	<textarea name="text"></textarea>
                                </td>
                                <td><span>*备注信息，可不填</span></td>
                            </tr>
                       
                        </table>
                     
                    </div>
                    <input type="submit"  class="co_suresub" />
       </form>
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
</body>
</html>
