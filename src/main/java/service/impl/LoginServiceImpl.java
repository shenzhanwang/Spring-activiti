package service.impl;


import mapper.LoginMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import po.User;
import service.LoginService;
@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginMapper loginmapper;
	public String getpwdbyname(String name) {
		User s=loginmapper.getpwdbyname(name);
		if(s!=null)
		return s.getPassword();
		else
		return null;
	}

}
