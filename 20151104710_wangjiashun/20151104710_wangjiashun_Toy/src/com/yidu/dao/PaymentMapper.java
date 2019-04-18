package com.yidu.dao;

import com.yidu.domain.Payment;

public interface PaymentMapper {
    int deleteByPrimaryKey(String paymentId);

    int insert(Payment record);

    int insertSelective(Payment record);

    Payment selectByPrimaryKey(String paymentId);

    int updateByPrimaryKeySelective(Payment record);

    int updateByPrimaryKey(Payment record);
}