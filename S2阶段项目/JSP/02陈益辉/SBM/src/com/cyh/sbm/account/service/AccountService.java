package com.cyh.sbm.account.service;

import java.util.List;

import com.cyh.sbm.account.bean.AddAccount;
import com.cyh.sbm.common.bean.PageBean;

public interface AccountService {
	public PageBean getAllAccount(PageBean pageBean);
	public int insertAccount(AddAccount adda);
	public PageBean getPagebeanByTerm(List<String> wheres,List<String> values);
	public int delAccount(int accountId);
	public int updateAccount(int providerid,int isPayed,int businessNum,int accountId);
}
