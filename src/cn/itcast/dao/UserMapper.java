package cn.itcast.dao;

import java.util.List;

import cn.itcast.pojo.QueryVo;
import cn.itcast.pojo.User;

public interface UserMapper {

	User findUserByName(QueryVo vo);

	List<User> findAll();

}
