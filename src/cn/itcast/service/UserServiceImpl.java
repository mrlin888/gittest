package cn.itcast.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.UserMapper;
import cn.itcast.pojo.QueryVo;
import cn.itcast.pojo.User;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;
	@Override
	public User findUserByName(QueryVo vo) {
		User user = userMapper.findUserByName(vo);
		return user;
	}
	@Override
	public List<User> findAll() {
		List<User> userlist = userMapper.findAll();
		return userlist;
	}

}
