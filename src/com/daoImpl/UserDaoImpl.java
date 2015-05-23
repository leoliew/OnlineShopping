package com.daoImpl;

import java.util.List;

import com.dao.BasicDao;
import com.dao.IUserDao;
import com.vo.User;

public class UserDaoImpl extends BasicDao<User> implements IUserDao {
	@Override
	public void saveUser(User user) {
		String sql=" insert into users(userName,password,realName,sex,phone,addr,qq,headImg,acount,level,regTime) values(?,?,?,?,?,?,?,?,?,?,?)";
		super.executeUpdatePerparement(sql, user.getUserName(),user.getPassword(),user.getRealName(),user.getSex(),user.getPhone(),user.getAddr(),user.getQq(),user.getHeadImg(),user.getAcount(),user.getLevel(),user.getRegTime());		
	}

	@Override
	public List<User> findUserByCondition(User user) {
		String sql=" select * from users where ";
		return super.findListTByCondition(sql, user);		
	}

	@Override
	public User findUserById(Integer id) {
		String sql=" select * from users where id=? ";
		return super.findByPredStatmentT(sql, id);
	}

	@Override
	public void updateUserById(User user,Integer id) {
		String sql=" update users ";
		String condition="id";
		super.updateByCondition(sql, user, condition, id);
		
	}

	@Override
	public List<User> findAllUser() {
		String sql=" select * from users ";
		return super.findListT(sql);
	}		
}
