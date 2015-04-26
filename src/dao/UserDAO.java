package dao;

import java.util.ArrayList;
import java.util.List;
import bean.*;

/**
 * 存取用户表的DAO类。初始用户表中有3个测试帐号。
 * 在这个类的实现中，我们用一个静态列表来模拟用户表。
 * 真实的用户表应该存储在数据库中，可以持久化。
 * 但本类的模拟实现并不能持久化，重启服务器后用户表中只剩下原来的3个测试帐号。
 */
public class UserDAO {
	/**
	 * 单例（Singleton）模式
	 */
	private static UserDAO instance = new UserDAO();
	private UserDAO(){
	}	
	public static UserDAO getInstance() {
		return instance;
	}

	/**
	 * 用来模拟用户表的静态列表
	 */
	private static List<User> userTable = new ArrayList<User>();
	/**
	 * 初始化用户表，加入3个测试帐号
	 */
	static {
		User user1 = new User();
		user1.setUsername("test1");
		user1.setPassword("123456");
		user1.setEmail("test1@yourdomain.com");
		user1.setName("章子怡");
		user1.setHeadurl("http://fmn.rrimg.com/fmn049/20110703/0105/p_large_DXGG_50e80000b3225c73.jpg");
		userTable.add(user1);
		User user2 = new User();
		user2.setUsername("test2");
		user2.setPassword("123456");
		user2.setEmail("test2@yourdomain.com");
		user2.setName("徐静蕾");
		user2.setHeadurl("http://fmn.rrimg.com/fmn054/20110703/0105/p_large_QWui_51250000b3105c73.jpg");
		userTable.add(user2);
		User user3 = new User();
		user3.setUsername("test3");
		user3.setPassword("123456");
		user3.setEmail("test3@yourdomain.com");
		user3.setName("周杰伦");
		user3.setHeadurl("http://fmn.rrimg.com/fmn051/20110703/0105/p_large_NW41_098a0000b0215c44.jpg");
		userTable.add(user3);
	}

	public synchronized User getUser(String username) {
		for (User user : userTable) {
			if (username.equals(user.getUsername())) {
				return user;
			}
		}
		return null;
	}

	public synchronized void addUser(User user) {
		userTable.add(user);
	}
}