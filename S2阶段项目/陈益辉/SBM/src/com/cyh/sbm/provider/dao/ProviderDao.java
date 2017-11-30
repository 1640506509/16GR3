package com.cyh.sbm.provider.dao;

import java.util.List;

import com.cyh.sbm.common.bean.PageBean;
import com.cyh.sbm.provider.bean.Provider;

public interface ProviderDao {
	public List<Provider> getProvider();
	public int getCount(String tablename,List<String> wheres,List<String> values);
	public PageBean getPageBean(PageBean pagebean);
	public Provider getProviderById(int ProviderId);
	public int Updateprovider(Provider provider);
	public int insertProvider(Provider provider);
	public PageBean getPageBeanByInfo(PageBean pagebean,List<String> wheres,List<String> values);
}
