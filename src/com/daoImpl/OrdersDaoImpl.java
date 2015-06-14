package com.daoImpl;

import java.util.List;

import com.dao.BasicDao;
import com.dao.IOrdersDao;
import com.vo.Orders;

public class OrdersDaoImpl extends BasicDao<Orders> implements IOrdersDao{

	@Override
	public void saveOrder(Orders orders) {
		String sql=" insert into orders ";
		super.saveByCondition(sql, orders);
	}

	@Override
	public List<Orders> findOrdersByUserId(int userId) {
		String sql=" select * from orders where userId=? ";
		return super.findListT(sql, userId);
	}

	@Override
	public List<Orders> findAllOrders() {
		String sql=" select * from orders ";
		return super.findListT(sql);
	}

	@Override
	public Orders findOrdersByOrderId(Integer id) {
		String sql=" select * from orders where id=? ";
		return super.findByPredStatmentT(sql, id);
	}

	@Override
	public void updateOrdersById(Orders orders, int id) {
		String sql=" update orders  ";
		String condition="id";
		super.updateByCondition(sql, orders, condition, id);
	}

	@Override
	public void delOrderById(int id) {
			String sql=" delete  from orders where id=? ";
			super.executeUpdatePerparement(sql, id);
	}
		
}
