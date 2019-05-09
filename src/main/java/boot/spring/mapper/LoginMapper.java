package boot.spring.mapper;

import boot.spring.po.User;

public interface LoginMapper {
	User getpwdbyname(String name);
}
