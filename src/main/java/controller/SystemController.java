package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pagemodel.DataGrid;
import pagemodel.Userinfo;
import po.Permission;
import po.Role;
import po.User;
import po.User_role;
import service.SystemService;

@Controller
public class SystemController {
	@Autowired
	SystemService systemservice;
	
	@RequestMapping("/useradmin")
	String useradmin(){
		return "system/useradmin";
	}
	
	@RequestMapping("/roleadmin")
	String roleadmin(){
		return "system/roleadmin";
	}
	
	@RequestMapping("/permissionadmin")
	String permissionadmin(){
		return "system/permissionadmin";
	}
	
	@RequestMapping(value="/userlist",method=RequestMethod.GET)
	@ResponseBody
	DataGrid<Userinfo> userlist(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		int total=systemservice.getallusers().size();
		List<User> userlist=systemservice.getpageusers(current,rowCount);
		List<Userinfo> users=new ArrayList<Userinfo>();
		for(User user:userlist){
			Userinfo u=new Userinfo();
			u.setId(user.getUid());
			u.setAge(user.getAge());
			u.setPassword(user.getPassword());
			u.setTel(user.getTel());
			u.setUsername(user.getUsername());
			String rolename="";
			List<User_role> ur=user.getUser_roles();
			if(ur!=null){
				for(User_role userole:ur){
					rolename=rolename+","+userole.getRole().getRolename();
				}
				if(rolename.length()>0)
				rolename=rolename.substring(1,rolename.length());
				
				u.setRolelist(rolename);
			}
			users.add(u);
		}
		DataGrid<Userinfo> grid=new DataGrid<Userinfo>();
		grid.setCurrent(current);
		grid.setRows(users);
		grid.setRowCount(rowCount);
		grid.setTotal(total);
		return grid;
	}
	
	@RequestMapping(value="/user/{uid}",method=RequestMethod.GET)
	@ResponseBody
	User getuserinfo(@PathVariable("uid") int userid){
		return systemservice.getUserByid(userid);
	}
	
	@RequestMapping(value="/rolelist",method=RequestMethod.GET)
	@ResponseBody
	List<Role> getroles(){
		return systemservice.getRoles();
	}
	
	@RequestMapping(value="/roles",method=RequestMethod.GET)
	@ResponseBody
	DataGrid<Role> getallroles(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		List<Role> roles=systemservice.getRoleinfo();
		List<Role> rows=systemservice.getpageRoleinfo(current, rowCount);
		DataGrid<Role> grid=new DataGrid<Role>();
		grid.setCurrent(current);
		grid.setRowCount(rowCount);
		grid.setTotal(roles.size());
		grid.setRows(rows);
		return grid;
	}
	
	@RequestMapping(value="/deleteuser/{uid}",method=RequestMethod.GET)
	String deleteuser(@PathVariable("uid")int uid){
		systemservice.deleteuser(uid);
		return "system/useradmin";
	}
	
	@RequestMapping(value="/adduser",method=RequestMethod.POST)
	String adduser(@ModelAttribute("user")User user,@RequestParam(value="rolename[]",required = false)String[] rolename){
		if(rolename==null)
			systemservice.adduser(user);
		else
			systemservice.adduser(user, rolename);
		return "forward:/useradmin";
	}
	
	@RequestMapping(value="/updateuser/{uid}",method=RequestMethod.POST)
	String updateuser(@PathVariable("uid")int uid,@ModelAttribute("user")User user,@RequestParam(value="rolename[]",required = false)String[] rolename){
		systemservice.updateuser(uid, user, rolename);
		return "system/useradmin";
	}
	
	
	@RequestMapping(value="permissionlist",method=RequestMethod.GET)
	@ResponseBody
	List<Permission> getPermisions(){
		return systemservice.getPermisions();
	}
	
	@RequestMapping(value="addrole",method=RequestMethod.POST)
	String addrole(@RequestParam("rolename") String rolename,@RequestParam(value="permissionname[]")String[] permissionname){
		Role r=new Role();
		r.setRolename(rolename);
		systemservice.addrole(r, permissionname);
		return "forward:/roleadmin";
	}
	
	@RequestMapping(value="/deleterole/{rid}",method=RequestMethod.GET)
	String deleterole(@PathVariable("rid")int rid){
		systemservice.deleterole(rid);
		return "system/roleadmin";
	}
	
	@RequestMapping(value="roleinfo/{rid}",method=RequestMethod.GET)
	@ResponseBody
	Role getRolebyrid(@PathVariable("rid")int rid){
		return systemservice.getRolebyid(rid);
	}
	
	@RequestMapping(value="updaterole/{rid}",method=RequestMethod.POST)
	String updaterole(@PathVariable("rid")int rid,@RequestParam(value="permissionname[]")String[] permissionnames){
		systemservice.deleterolepermission(rid);
		systemservice.updaterole(rid, permissionnames);
		return "system/roleadmin";
	}
	
	
	@RequestMapping(value="permissions",method=RequestMethod.GET)
	@ResponseBody
	DataGrid<Permission> getpermissions(@RequestParam("current") int current,@RequestParam("rowCount") int rowCount){
		List<Permission> p=systemservice.getPermisions();
		List<Permission> list=systemservice.getPagePermisions(current, rowCount);
		DataGrid<Permission> grid=new DataGrid<Permission>();
		grid.setCurrent(current);
		grid.setRowCount(rowCount);
		grid.setTotal(p.size());
		grid.setRows(list);
		return grid;
	}
	
	@RequestMapping(value="addpermission",method=RequestMethod.POST)
	String addpermission(@RequestParam("permissionname") String permissionname){
		systemservice.addPermission(permissionname);
		return "system/permissionadmin";
	}
	
	
	@RequestMapping(value="deletepermission/{pid}",method=RequestMethod.GET)
	String deletepermission(@PathVariable("pid") int pid){
		systemservice.deletepermission(pid);
		return "system/permissionadmin";
	}
}
