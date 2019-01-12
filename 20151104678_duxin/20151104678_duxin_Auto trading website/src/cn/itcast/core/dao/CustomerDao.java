package cn.itcast.core.dao;

import java.util.List;

import cn.itcast.core.bean.Customer;

public interface CustomerDao {

	List<Customer> selectCustomerList(Customer customer);
	Integer selectCustomerListCount(Customer customer);
	Customer getCustomerById(Long id);
	void updateCustomer(Customer customer);
	void deleteCustomer(Long id);
	
}