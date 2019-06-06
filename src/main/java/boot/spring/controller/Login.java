package boot.spring.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.spring.pagemodel.MSG;
import boot.spring.service.LoginService;
import io.swagger.annotations.Api;


@Api(value = "登录登出接口")
@Controller
public class Login {
	@Autowired
	LoginService loginservice;
	
	@RequestMapping(value="/loginvalidate",method = RequestMethod.POST)
	public String loginvalidate(@RequestParam("username") String username,@RequestParam("password") String pwd,HttpSession httpSession){
		if(username==null)
			return "login";
		String realpwd=loginservice.getpwdbyname(username);
		if(realpwd!=null&&pwd.equals(realpwd))
		{
			httpSession.setAttribute("username", username);
			return "index";
		}else
			return "fail";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	@RequestMapping(value="/logout",method = RequestMethod.GET)
	public String logout(HttpSession httpSession){
		httpSession.removeAttribute("username");
		return "login";
	}
	
	@RequestMapping(value="/currentuser",method = RequestMethod.GET)
	@ResponseBody
	public MSG currentuser(HttpSession httpSession){
		String userid=(String) httpSession.getAttribute("username");
		return new MSG(userid);
	}	
	
  }
