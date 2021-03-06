package com.qhit.gr3.cyh.ht7.dao;

import java.util.List;

public interface BaseDao {
	public Object getObject(Class clazz,Integer id);
	public void add(Object object);
	public void delete(Object object);
	public void update(Object object);
	public List<Object> getAll(String hql);
	public List<Object[]> getMsgArray(String hql);
}
