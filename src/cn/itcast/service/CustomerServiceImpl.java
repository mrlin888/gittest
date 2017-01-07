package cn.itcast.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.CustomerMapper;
import cn.itcast.dao.UserMapper;
import cn.itcast.pojo.Customer;
import cn.itcast.pojo.QueryVo;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	@Override
	public List<QueryVo> findAll() {
		 List<QueryVo> list = customerMapper.findAll();
		return list;
	}
	@Override
	public List<QueryVo> findCustomerByVo(QueryVo vo) {
		List<QueryVo> list = customerMapper.findCustomerByVo(vo);
		return list;
	}
	@Override
	public Integer findCustomerCountByVo(QueryVo vo) {
		Integer count = customerMapper.findCustomerCountByVo(vo);
		return count;
	}
	@Override
	public void deleteCustomerById(int id) {
		customerMapper.deleteCustomerById(id);
		
	}
	@Override
	public void addCustomer(QueryVo vo) {
		customerMapper.addCustomer(vo);
		
	}

}
