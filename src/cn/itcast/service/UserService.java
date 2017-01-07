package cn.itcast.service;

import java.util.List;

import cn.itcast.pojo.QueryVo;
import cn.itcast.pojo.User;

public interface UserService {

	User findUserByName(QueryVo vo);

	List<User> findAll();

}
