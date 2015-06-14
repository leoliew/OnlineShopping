package com.daoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.dao.BasicDao;
import com.dao.IFoodDao;
import com.vo.Foods;

public class FoodDaoImpl extends BasicDao<Foods> implements IFoodDao{

	@Override
	public List<Foods> findAllFoods() {
		String sql=" select * from foods ";
		return super.findListT(sql);
	}

	@Override
	public List<Foods> findPageFoods(int pageNo, int pageSize) {
		String sql=" select * from foods limit ?,? ";
		return super.findListT(sql, (pageNo-1)*pageSize,pageSize);
	}

	@Override
	public int findRowCount() {
		String sql=" select count(1) from foods ";
		ResultSet rs= super.select(sql);
		try {
			while(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Foods> findFoodsByTypeId(int typeId,int pageNo,int pageSize) {
		String sql=" select * from foods where type=?  limit ? , ?  ";
		return super.findListT(sql, typeId,(pageNo-1)*pageSize,pageSize);
	}

	@Override
	public int findRowCountByTypeId(int typeId) {
		String sql=" select count(1) from foods where type= ? ";
		ResultSet rs= super.select(sql,typeId);
		try {
			while(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public void saveFood(Foods food) {
		String sql=" insert into foods(name,type,price,details,foodPic,isGroup,groupPrice,beginTime,endTime,groupCount) values(?,?,?,?,?,?,?,?,?,?)";
		super.executeUpdatePerparement(sql, food.getName(),food.getType(),food.getPrice(),food.getDetails(),food.getFoodPic(),food.getIsGroup(),food.getGroupPrice(),food.getBeginTime(),food.getEndTime(),food.getGroupCount());
	}

	@Override
	public Foods findFoodById(Integer id) {
		String sql=" select * from foods where id=? ";
		return super.findByPredStatmentT(sql, id);
	}

	@Override
	public void delFoodById(Integer id) {
		String sql=" delete from foods where id=? ";
		super.executeUpdatePerparement(sql, id);
		
	}

	@Override
	public void updateFoodById(Foods food, int id) {
		String sql=" update foods  ";
		String condition="id";
		super.updateByCondition(sql, food, condition, id);
	}

	@Override
	public List<Foods> findFoodByCondition(Foods food) {
		String sql=" select * from foods where ";
		return super.findListTByCondition(sql, food);
	}
}
