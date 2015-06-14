package com.dao;

import java.util.List;

import com.vo.Orders;

public interface IOrdersDao {
	/**
	 * 保存订单
	 * @param orders
	 */
		public void saveOrder(Orders orders);
		/**
		 * 根据用户id查找订单
		 * @param userId 用户的id
		 * @return 查找到的订单集合
		 */
		public List<Orders> findOrdersByUserId(int userId);
		
		/**
		 * 查询所有的订单
		 * @return 订单集合
		 */
		public List<Orders> findAllOrders();
		
		/**
		 * 根据id查询订单
		 * @param id
		 * @return
		 */
		public Orders findOrdersByOrderId(Integer id);
		
		/**
		 * 根据订单id更新订单
		 * @param orders 要更新的订单
		 * @param id 订单id
		 */
		public void updateOrdersById(Orders orders, int id);
		
		/**
		 * 根据id删除用户
		 * @param id
		 */
		public void delOrderById(int id);
}
