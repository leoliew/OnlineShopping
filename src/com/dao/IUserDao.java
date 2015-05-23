package com.dao;

import java.util.List;

import com.vo.User;

public interface IUserDao {
	/**
	 * 保存用户到数据库中
	 * @param user
	 */
		public  void saveUser(User user);
		/**
		 * 根据用户属性查找用户
		 * @param user 带属性的用户
		 * @return  查找到的用户列表
		 */
		public List<User> findUserByCondition(User user);
		
		/**
		 * 根据用户id查找用户
		 * @param id 要查找的用户的id
		 * @return 查找到的用户
		 */
		public User  findUserById(Integer id);
		
		
		/**
		 * 修改用户信息
		 */
		public void updateUserById(User user,Integer id);
		
		/**
		 * 查询所有用户
		 * @return 所有用户的列表
		 */
		public List<User> findAllUser();
}
