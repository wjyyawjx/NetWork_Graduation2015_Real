package com.yidu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.dao.PaymentMapper;
import com.yidu.domain.Payment;
import com.yidu.service.PaymentService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class PaymentServiceImpl  implements PaymentService {
	@Resource
	PaymentMapper paymentDao;
	@Override
	public int add(Payment payment) {
		
		return paymentDao.insertSelective(payment);
	}

}
