package service;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.renren.api.client.RenrenApiConfig;
import bean.AppConfig;

public class ApiInitListener implements ServletContextListener{

//	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		//Nothing to do
	}

//	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		RenrenApiConfig.renrenApiKey = AppConfig.API_KEY;
		RenrenApiConfig.renrenApiSecret = AppConfig.APP_SECRET;
	}
}