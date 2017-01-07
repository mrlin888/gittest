package cn.itcast.service;

import java.util.List;

import cn.itcast.pojo.Customer;
import cn.itcast.pojo.QueryVo;

public interface CustomerService {

	List<QueryVo> findAll();

	List<QueryVo> findCustomerByVo(QueryVo vo);

	Integer findCustomerCountByVo(QueryVo vo);

	void deleteCustomerById(int id);

	void addCustomer(QueryVo vo);

}
