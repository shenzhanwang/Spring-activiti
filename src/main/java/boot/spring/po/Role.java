package boot.spring.po;

import java.util.List;

public class Role {
	int rid;
	String rolename;
	List<User_role> user_roles;  
	List<Role_permission> role_permissions;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public List<User_role> getUser_roles() {
		return user_roles;
	}
	public void setUser_roles(List<User_role> user_roles) {
		this.user_roles = user_roles;
	}
	public List<Role_permission> getRole_permission() {
		return role_permissions;
	}
	public void setRole_permission(List<Role_permission> role_permission) {
		this.role_permissions = role_permission;
	}
	
	
}
