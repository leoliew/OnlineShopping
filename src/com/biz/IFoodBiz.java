package com.biz;

import com.vo.Foods;

public interface IFoodBiz {
	/**
	 * 检查此食物是否存在
	 * @param food
	 * @return
	 */
		public boolean checkFood(Foods food);
		
		/**
		 * 根据条件查找单条食物记录
		 * @param food
		 * @return
		 */
		public Foods findFoodsByCondition(Foods food);
}
