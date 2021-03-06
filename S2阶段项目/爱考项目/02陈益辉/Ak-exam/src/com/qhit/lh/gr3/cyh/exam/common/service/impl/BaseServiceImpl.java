package com.qhit.lh.gr3.cyh.exam.common.service.impl;

import java.util.List;
import java.util.Set;

import com.qhit.lh.gr3.cyh.exam.common.bean.TUser;
import com.qhit.lh.gr3.cyh.exam.common.dao.BaseDao;
import com.qhit.lh.gr3.cyh.exam.common.dao.impl.BaseDaoImpl;
import com.qhit.lh.gr3.cyh.exam.common.service.BaseService;

public class BaseServiceImpl implements BaseService {
	private BaseDao bd=new BaseDaoImpl();
	@Override
	public Object getObject(Class clazz,Integer id) {
		// TODO Auto-generated method stub
		return bd.getObject(clazz, id);
	}

	@Override
	public void add(Object object) {
		// TODO Auto-generated method stub
		bd.add(object);
	}

	@Override
	public void delete(Object object) {
		// TODO Auto-generated method stub
		bd.delete(object);
	}

	@Override
	public void update(Object object) {
		// TODO Auto-generated method stub
		bd.update(object);
	}

	@Override
	public List<Object> getAll(String hql) {
		// TODO Auto-generated method stub
		return bd.getAll(hql);
	}

	@Override
	public List<TUser> getObjectByInfo(String hql) {
		// TODO Auto-generated method stub
		return bd.getObjectByInfo(hql);
	}

	@Override
	public Object getObject(String hql) {
		// TODO Auto-generated method stub
		return bd.getObject(hql);
	}

}
