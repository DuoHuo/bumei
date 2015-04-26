package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;


public class lost extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public lost() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");	
		PrintWriter out = response.getWriter();
		
		String thing_name=request.getParameter("name");
		String sort=request.getParameter("sort");
		String location=request.getParameter("location");
		String lost_time=request.getParameter("losttime");
		String content=request.getParameter("description");
		String picture=request.getParameter("photo");
		
		String aa= request.getParameter("photo");
		ArrayList<String> list = new ArrayList<String>();
		   if(aa!=null || !aa.equals(""))
		   list.add(aa);
		   // 建立上传文件存放的路径
		   File uploadPath = new File(request.getRealPath("/downloadPath") );
		   System.out.println(uploadPath );
		   if (!uploadPath.exists()) {
		    uploadPath.mkdirs();
		   }
		   for (int i = 0; i < list.size(); i++) {
		    String fileName[] = new String[list.size()];
		    String exFileName[] = new String[list.size()];
		    // 文件路径
		    String filePath = list.get(i);
		    // 取上传的文件名称
		    fileName[i] = filePath.substring(filePath.lastIndexOf("\\") + 1,
		      filePath.length());
		    // 取文件的扩展名称
//		    exFileName[i] = filePath.substring(filePath.lastIndexOf("." + 1,
//		      filePath.length()));
		    // 在存放的目录下新建文件
		    File uploadFileName = new File(uploadPath, fileName[i]);
		    if (!uploadFileName.exists()) {
		     uploadFileName.createNewFile();
		    }
		    FileInputStream fin=new FileInputStream(filePath);
		    // 向服务器写入文件
		    java.io.FileOutputStream fos = new java.io.FileOutputStream(uploadPath + "/" + fileName[i]);
		    int c = fin.read();
		    while (c != -1) {
		     fos.write((char)c);
		     c=fin.read();
		    }
		   }
//		SmartUpload su = new SmartUpload();//新建一个SmartUpload对象
//	//	su.getRequest().getParameterValues("");
//		String aa=su.getRequest().getParameter("photo");
//		File f = new File("F:\\test.jpg");
		
//		 SmartUpload sma=new SmartUpload();  
//		    long file_max_size=4000000;   
//		    String filename1="",ext="",testvar=""; 
//		    String url="uploadfiles/"; 
//		//    sma.initialize();   
//		    try    
//		    {     
//		    sma.setAllowedFilesList("jpg,gif");   
//		    sma.upload();   
//		    }catch(Exception e){   }     
//		    try{     
//		        com.jspsmart.upload.File myf=sma.getFiles().getFile(0);  
//		        if(myf.isMissing()){   }     
//		        try{     
//		            com.jspsmart.upload.File myf=sma.getFiles().getFile(0);  
//		            if(myf.isMissing()){ }else{   
//		                ext=myf.getFileExt();   
//		                int file_size=myf.getSize();   
//		                String saveurl="";   
//		                if(file_size < file_max_size){   
//		                Calendar cal=Calendar.getInstance();   
//		                String filename=String.valueOf(cal.getTimeInMillis());   
//		                saveurl=request.getRealPath("/")+url;  
//		                saveurl+=filename+"."+ext;   
//		                myf.saveAs(saveurl,sma.SAVE_PHYSICAL);   
////		            	myclass mc=new myclass(request.getRealPath("data/data.mdb"));   
//		                mc.executeInsert("insert into [path] values('uploadfiles/"+filename+"."+ext+"')");
//		                out.println("图片上传成功!");   
//		                response.sendRedirect("showimg.jsp");  
//		                }   
//		                }   
//		                }catch(Exception e){     
//		                e.printStackTrace();     
//		                }     
//		int n;
//			byte[] b=new byte[1000];
//			File f=new File("ts.jpg");
//			File f2= new File("F://test project//test.jpg");
//			InputStream is=request.getInputStream();
//			FileOutputStream os =new FileOutputStream(f);
//			while((n=is.read(b))!=-1){
//			os.write(b, 0, n);
//			}			
//			is.close();
//			os.close();
//			
//			RandomAccessFile raf=new RandomAccessFile(f,"r");
//			RandomAccessFile fin=new RandomAccessFile(f2,"rw");
//			raf.readLine();
//			String s=raf.readLine();
//			raf.seek(0);
//			int num=0;
//			long start,end;
//			while(num<4){
//			raf.readLine();
//			num++;
//			}
//			start=raf.getFilePointer();
//			end=raf.length()-1;
//			num=0;
//			byte bx;
//			raf.seek(end);
//			while(num<7){
//			bx=raf.readByte();
//			if(bx=='\n')
//				num++;
//			end--;
//			raf.seek(end);
//			}
//			raf.seek(start);
//			while(raf.getFilePointer()<=end){
//			fin.writeByte(raf.readByte());
//			}
//			fin.close();
//			raf.close();
		
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
