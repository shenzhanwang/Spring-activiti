package boot.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import boot.spring.mapper.PermissionMapper;
import boot.spring.mapper.RoleMapper;
import boot.spring.mapper.UserMapper;
import boot.spring.mapper.UserRoleMapper;
import boot.spring.po.Permission;
import boot.spring.po.Role;
import boot.spring.po.Role_permission;
import boot.spring.po.User;
import boot.spring.po.UserRole;
import boot.spring.po.User_role;
import boot.spring.service.SystemService;


@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, timeout = 5)
public class SystemServiceImpl implements SystemService {
	@Autowired
	UserMapper usermapper;

	@Autowired
	RoleMapper rolemapper;

	@Autowired
	PermissionMapper permissionmapper;

	@Autowired
	UserRoleMapper userRoleMapper;

	public List<User> getallusers() {
		return usermapper.getusers();
	}

	public List<User> getpageusers(int pagenum, int pagesize) {
		PageHelper.startPage(pagenum, pagesize);
		List<User> l = usermapper.getusers();
		return l;
	}

	public User getUserByid(int id) {
		User u = usermapper.getUserByid(id);
		return u;
	}

	public List<Role> getRoles() {
		return rolemapper.getRoles();
	}

	public void deleteuser(int uid) {
		usermapper.deleteuser(uid);
		usermapper.deleteuserrole(uid);
	}

	public void adduser(User user, String[] rolenames) {
		usermapper.adduser(user);
		for (String rolename : rolenames) {
			Role role = rolemapper.getRoleidbyName(rolename);
			User_role ur = new User_role();
			ur.setRole(role);
			ur.setUser(user);
			rolemapper.adduserrole(ur);
		}
	}

	public void adduser(User user) {
		usermapper.adduser(user);
	}

	public void updateuser(int uid, User user, String[] rolenames) {
		if (rolenames == null) {
			user.setUid(uid);
			usermapper.updateByPrimaryKeySelective(user);
			usermapper.deleteuserrole(uid);
		} else {
			user.setUid(uid);
			usermapper.updateByPrimaryKeySelective(user);
			usermapper.deleteuserrole(uid);
			for (String rolename : rolenames) {
				Role role = rolemapper.getRoleidbyName(rolename);
				User_role ur = new User_role();
				ur.setRole(role);
				ur.setUser(user);
				rolemapper.adduserrole(ur);
			}
		}

	}

	public List<Role> getpageRoleinfo(int pagenum, int pagesize) {
		PageHelper.startPage(pagenum, pagesize);
		List<Role> l = rolemapper.getRoleinfo();
		return l;
	}

	public List<Role> getRoleinfo() {
		return rolemapper.getRoleinfo();
	}

	public List<Permission> getPermisions() {
		return permissionmapper.getPermissions();
	}

	public void addrole(Role role, String[] permissionnames) {
		rolemapper.addRole(role);
		for (String permissionname : permissionnames) {
			Permission p = permissionmapper.getPermissionByname(permissionname);
			Role_permission rp = new Role_permission();
			rp.setRole(role);
			rp.setPermission(p);
			rolemapper.addRolePermission(rp);
		}
	}

	public void deleterole(int rid) {
		rolemapper.deleterole(rid);
		rolemapper.deleterole_permission(rid);
		rolemapper.deleteuser_role(rid);
	}

	public Role getRolebyid(int rid) {
		return rolemapper.getRolebyid(rid);
	}

	public void deleterolepermission(int rid) {
		rolemapper.deleterole_permission(rid);
	}

	public void updaterole(int rid, String[] permissionnames) {
		Role role = rolemapper.getRolebyid(rid);
		for (String permissionname : permissionnames) {
			Permission p = permissionmapper.getPermissionByname(permissionname);
			Role_permission rp = new Role_permission();
			rp.setRole(role);
			rp.setPermission(p);
			rolemapper.addRolePermission(rp);
		}
	}

	public List<Permission> getPagePermisions(int pagenum, int pagesize) {
		PageHelper.startPage(pagenum, pagesize);
		return permissionmapper.getPermissions();
	}

	public void addPermission(String permissionname) {
		permissionmapper.addpermission(permissionname);
	}

	public void deletepermission(int pid) {
		permissionmapper.deletepermission(pid);
		permissionmapper.deleteRole_permission(pid);
	}

	public int getUidByusername(String username) {
		return usermapper.getUidByusername(username);
	}

	@Override
	public List<UserRole> listRolesByUserid(int userid) {
		return userRoleMapper.listUserRoleByUid(userid);
	}

}
