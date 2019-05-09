package boot.spring.po;

import java.util.List;

public class Permission {
	int pid;
	String permissionname;
	List<Role_permission> rp;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPermissionname() {
		return permissionname;
	}
	public void setPermissionname(String permissionname) {
		this.permissionname = permissionname;
	}
	public List<Role_permission> getRp() {
		return rp;
	}
	public void setRp(List<Role_permission> rp) {
		this.rp = rp;
	}
	
}
