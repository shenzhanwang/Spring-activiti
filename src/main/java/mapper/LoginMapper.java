package mapper;

import po.Staff;


public interface LoginMapper {
	Staff getpwdbyname(String name);
}
