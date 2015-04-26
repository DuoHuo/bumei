package dao;

public class Charcheck {
	public static String check(String str){
		String[] removes={"=","-","!",",",";","'",";","[","]","/","\\"};
		int n= removes.length;
		for(int i=0;i<n;i++)
			str=str.replace(removes[i], "");
		return str;
	}
	public static String checklitle(String str){
		String[] removes={"=","-","!",",",";","'",";","[","]","/","\\"};
		int n= removes.length;
		for(int i=0;i<n;i++)
			str=str.replace(removes[i], "");
		return str;
	}
}
