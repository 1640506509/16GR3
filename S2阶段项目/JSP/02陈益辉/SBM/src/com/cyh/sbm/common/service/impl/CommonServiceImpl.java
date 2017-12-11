package com.cyh.sbm.common.service.impl;

import java.util.List;

import com.cyh.sbm.common.dao.Impl.CommonDaoImpl;
import com.cyh.sbm.common.service.CommonService;

public class CommonServiceImpl implements CommonService{

	@Override
	public int getCount(String tablename, List<String> wheres, List<String> values) {
		// TODO Auto-generated method stub
		return new CommonDaoImpl().getCount(tablename, wheres, values);
	}

}
