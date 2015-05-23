package com.daoImpl;

import java.util.List;

import com.dao.BasicDao;
import com.dao.ITypesDao;
import com.vo.Types;

public class TypeDaoImpl extends BasicDao<Types> implements ITypesDao{

	@Override
	public List<Types> findAllTypes() {
		String sql=" select * from types ";
		return super.findListT(sql);
	}

}
