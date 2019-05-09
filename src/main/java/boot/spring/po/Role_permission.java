package boot.spring.po;

public class Role_permission {
	int rpid;
	Role role;
	Permission permission;
	public int getRpid() {
		return rpid;
	}
	public void setRpid(int rpid) {
		this.rpid = rpid;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Permission getPermission() {
		return permission;
	}
	public void setPermission(Permission permission) {
		this.permission = permission;
	}
	
}
