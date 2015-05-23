package com.biz;

import com.vo.User;

public interface IUserBiz {
	/**
	 * 检查登录的用户是否存在
	 * @param user 要检查的用户
	 * @return 如果存在返回true ,不存在则返回False
	 */
		public User checkUser(User user);
		
}
