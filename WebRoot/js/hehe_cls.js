function bton(){
	if(document.getElementById('co_cls').style.display == 'none')
		{
			document.getElementById('co_cls').style.display = '';
		}else{
				document.getElementById('co_cls').style.display = 'none';
			}
}



function insert(){ 
var insertText = '<div class="co_bodytable" style="margin:30px auto auto 436px;"><table><tr><td class="co_tb04">&nbsp;邮箱:</td><td class="co_tb03"><input type="text" /></td></tr><tr><td class="co_tb04">&nbsp;密码:</td><td class="co_tb03"><input type="password" /></td></tr></table><input type="button" value="" class="co_suresub" /></div>'; 
document.getElementById("insert").innerHTML = insertText; 
} 

function insert02(){
	if(document.getElementById('insert02').style.display == 'none')
		{
			document.getElementById('insert02').style.display = '';
		}else{
				document.getElementById('insert02').style.display = 'none';
			}
}