package com.cyh.sbm.user.service;

import com.cyh.sbm.common.bean.PageBean;
import com.cyh.sbm.user.bean.User;

public interface UserService {
	
	public User getUser(String userName,String userPassword);
	public PageBean getPageBean(PageBean pageBean);
	public int insertUser(User user);
	public User getUserById(String userId);
	public int upUser(User u,int userId);
	public int delUser(int userId);
	public PageBean getUserPageBean(PageBean pagebean,String userName);
	public User getUserByInfo(int userId);
	public int upUserPwd(User user,int userId);
}
