package com.bizImpl;

import java.util.List;

import com.biz.IFoodBiz;
import com.dao.IFoodDao;
import com.daoImpl.FoodDaoImpl;
import com.daoImpl.UserDaoImpl;
import com.vo.Foods;
import com.vo.User;

public class FoodBizImpl implements IFoodBiz{
private IFoodDao foodDao;
private Foods food;
	@Override
	public boolean checkFood(Foods food) {
		foodDao=new FoodDaoImpl();
		List foodList= foodDao.findFoodByCondition(food);
		if(foodList.size()>0){
			//验证失败
			return false;
		}else{
			return true;
			//验证通过
		}
	}
	@Override
	public Foods findFoodsByCondition(Foods food) {
		foodDao=new FoodDaoImpl();
		List<Foods> foodList= foodDao.findFoodByCondition(food);
		if(foodList.size()>0){
			//如果查找到数据库有此用户，则返回此用户
			return foodList.get(0);
		}	
		return null;
	}
}
