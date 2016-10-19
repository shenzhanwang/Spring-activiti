package mapper;

import po.User;



public interface LoginMapper {
	User getpwdbyname(String name);
}
