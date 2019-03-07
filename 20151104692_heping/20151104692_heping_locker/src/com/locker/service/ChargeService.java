package com.locker.service;

import java.util.List;

import com.locker.domain.Charge;

/**
 * <p>
 *  服务类
 * </p>
 *

 */
public interface ChargeService {
		public List<Charge> findAll();

		public int deletes(String chId);

		public int addAndUpdate(Charge charger);

		public Charge findById(String chId);
}
