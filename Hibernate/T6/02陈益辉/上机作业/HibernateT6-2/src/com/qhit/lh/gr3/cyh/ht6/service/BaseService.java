package com.qhit.lh.gr3.cyh.ht6.service;

import java.util.List;

public interface BaseService {
	public Object getObject(Class clazz,Integer id);
	public void add(Object object);
	public void delete(Object object);
	public void update(Object object);
	public List<Object> getAll(String hql);
}
