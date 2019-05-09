package boot.spring.po;

import java.util.List;

public class User {
	int uid;
	String username;
	String password;
	String tel;
	int age;
	List<User_role> user_roles;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public List<User_role> getUser_roles() {
		return user_roles;
	}
	public void setUser_roles(List<User_role> user_roles) {
		this.user_roles = user_roles;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", tel=" + tel + ", age=" + age + ", user_roles="
				+ user_roles + "]";
	}
	
	
}
