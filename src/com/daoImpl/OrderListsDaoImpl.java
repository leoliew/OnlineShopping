package com.daoImpl;

import java.util.List;

import com.dao.BasicDao;
import com.dao.IOrderListsDao;
import com.vo.OrderLists;

public class OrderListsDaoImpl extends BasicDao<OrderLists> implements IOrderListsDao{

	@Override
	public List<OrderLists> findOrderListsByOrderId(String orderId) {
		String sql=" select * from orderLists where listId=? ";
		return super.findListT(sql, orderId);
	}

	@Override
	public void saveOrderLists(OrderLists orderLists) {
		String sql=" insert into orderLists ";
		super.saveByCondition(sql, orderLists);
	}

}
