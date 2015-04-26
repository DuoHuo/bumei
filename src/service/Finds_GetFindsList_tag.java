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
public class Finds_GetFindsList_tag extends TagSupport{
		private int begin;
		private int end;
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
				
				for(int i=getBegin();i<getEnd()&&rs.next();i++){
	
						id=rs.getInt("id");
						name=rs.getString("name");
						sort=rs.getInt("sort");
						location=rs.getString("location");
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

		public int getBegin() {
			return begin;
		}

		public void setBegin(int begin) {
			this.begin = begin;
		}

		public int getEnd() {
			return end;
		}

		public void setEnd(int end) {
			this.end = end;
		}

		
	}

