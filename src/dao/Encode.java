package dao;

import java.security.MessageDigest;

public class Encode {
	 public static String encodeByMD5(String originString){  
	        if (originString != null){  
	            try{  
//	                创建具有指定算法名称的信息摘要  
	                MessageDigest md = MessageDigest.getInstance("MD5");  
	                //使用指定的字节数组对摘要进行最后更新，然后完成摘要计算  
	                originString=new String(originString.getBytes(),"UTF-8");
	                originString=originString.trim();
	                byte[] resultString = originString.getBytes();  
	                byte[] results = md.digest(resultString);  
	                String returnstr = new String(results,"UTF-8");
//       将得到的字节数组变成字符串返回  
	                return returnstr.toUpperCase();  
//	            	byte b[]= originString.getBytes();
//	            	byte[] newb= new byte[originString.length()];
//	            	for(int i=0;i<originString.length();i++){
//	            		newb[i]=(byte) (b[i]%26+'A');
//	            	}
//	            	return (new String(newb,"UTF-8"));
	            } catch(Exception ex){  
	                ex.printStackTrace();  
	            }  
	        }  
	        return null;  
	    }
}
