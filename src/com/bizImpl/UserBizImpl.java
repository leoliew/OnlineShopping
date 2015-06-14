package com.bizImpl;

import java.util.List;

import com.biz.IUserBiz;
import com.dao.IUserDao;
import com.daoImpl.UserDaoImpl;
import com.vo.User;

public class UserBizImpl implements IUserBiz{
private IUserDao userDao;
	@Override
	public User checkUser(User user) {
		userDao=new UserDaoImpl();
		List<User> userList= userDao.findUserByCondition(user);
		if(userList.size()>0){
			//如果查找到数据库有此用户，则返回此用户
			return userList.get(0);
		}	
		return null;
	}
	
}
