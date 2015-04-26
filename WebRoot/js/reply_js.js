function replyfun(thisform)
{ 
with (thisform)
{
if(thisform.content.value==""){alert("回复不能为空!");thisform.content.focus();return false;}
else 
	return true;
}
}
function writefun(thisform)
{
with (thisform)
{
if(thisform.title.value==""){alert("标题不能为空!");thisform.title.focus();return false;}
  else if(thisform.content.value==""){alert("内容不能为空!");thisform.content.focus();return false;}
	else return true;
}
}