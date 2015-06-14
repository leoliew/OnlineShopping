package com.dao;

import java.util.List;

import com.vo.OrderLists;

public interface IOrderListsDao {
	/**
	 * 根据订单的id查询订单列表
	 * @param orderId
	 * @return
	 */
		public List<OrderLists> findOrderListsByOrderId(String orderId);
		
		/**
		 * 保存订单列表
		 * @param orderLists
		 */
		public  void saveOrderLists(OrderLists orderLists);
}
