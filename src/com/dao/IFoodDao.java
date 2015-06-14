package com.dao;

import java.util.List;

import com.vo.Foods;

public interface IFoodDao {
	/**
	 * 查询所有的食品
	 * @return
	 */
		public List<Foods> findAllFoods();
		
		/**
		 * 根据分页条件查询食品
		 * @param pageNo
		 * @param pageSize
		 * @return
		 */
		public List<Foods> findPageFoods(int pageNo,int pageSize);
		
		/**
		 * 查询总记录数
		 * @return
		 */
		public int findRowCount();
		
		/**
		 * 根据食物类型id分页查找食物
		 * @param typeId
		 * @return
		 */
		public List<Foods> findFoodsByTypeId(int typeId,int pageNo,int pageSize);

		/**
		 * 根据食品类型查询记录数
		 * @return
		 */
		public int findRowCountByTypeId(int typeId);
		
		/**
		 * 保存食品
		 * @param food
		 */
		public void saveFood(Foods food);
		/**
		 * 根据食物id查找食物
		 * @param id 食物的id
		 * @return 查找到的食物
		 */
		public Foods findFoodById(Integer id);
		
		/**
		 * 根据id删除食物
		 * @param id
		 */
		public void delFoodById(Integer id);
		
		/**
		 * 根据食物id修改食物
		 * @param food 要修改的食物
		 * @param id 食物的id 
		 */
		public void updateFoodById(Foods food, int id);
		
		/**
		 * 根据条件查找食物
		 * @param food
		 * @return
		 */
		public List<Foods> findFoodByCondition(Foods food);
}
