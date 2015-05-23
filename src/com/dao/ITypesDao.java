package com.dao;

import java.util.List;

import com.vo.Types;

public interface ITypesDao {
		/**
		 * 查询所有的食物类型
		 * @return
		 */
	public List<Types> findAllTypes();
}
