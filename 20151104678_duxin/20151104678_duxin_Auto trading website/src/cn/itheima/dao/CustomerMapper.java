package cn.itheima.dao;

import java.util.List;

import cn.itheima.pojo.Customer;
import cn.itheima.pojo.QueryVo;

public interface CustomerMapper {

	public List<Customer> findCustomerByVo(QueryVo vo);
	public Integer findCustomerByVoCount(QueryVo vo);
	
	public Customer findCustomerById(Long id);
	
	public void updateCustomerById(Customer customer);
	
	public void delCustomerById(Long id);
}
