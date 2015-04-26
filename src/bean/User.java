package bean;

/**
 * User类用于表示网站的用户信息
 */
public class User {
	/**
	 * 登录用户名（包含字母和数字），是网站用户的唯一标识
	 */
	private String username;
	private String password;
	private String email;
	/**
	 * 用户姓名，用于网站显示
	 */
	private String name;
	/**
	 * 用户头像地址
	 */
	private String headurl;

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHeadurl() {
		return headurl;
	}
	public void setHeadurl(String headurl) {
		this.headurl = headurl;
	}

} 