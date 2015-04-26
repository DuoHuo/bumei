package service;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import dao.DBaccess;
/*
 *  
 *  首页显示丢失物品（）
 */
public class Index_GetFindsList extends TagSupport{
		private int num;
		String sql="SELECT * FROM finds WHERE  condition = 0";
		String name;
		int id;
		int sort;
		String location;
		String description;
		JspWriter jw=this.pageContext.getOut();
		
		public int doEndTag(){
			
			DBaccess da=new DBaccess();
			java.sql.ResultSet rs=da.access(sql);
			try {
				
				for(int i=0;i<num&&rs.next();i++){
	
						name=rs.getString("name");
						sort=rs.getInt("sort");
						location=rs.getString("location");
						id=rs.getInt("id");
						description=rs.getString("description");
						
						String realdescription;
						if(description.length()>14){
							realdescription=description.substring(0, 13);
						}
						else{
							realdescription=description;
						}
						try {
							
							jw.write(sort);
							jw.write(name);						
							jw.write(location);
							jw.write(realdescription);
							jw.write("<br>");
							
							
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
				
			
			return SKIP_BODY;		
		}

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}
	}

