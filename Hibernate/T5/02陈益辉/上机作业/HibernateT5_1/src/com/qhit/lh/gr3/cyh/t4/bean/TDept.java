package com.qhit.lh.gr3.cyh.t4.bean;

import java.util.HashSet;
import java.util.Set;

// Generated 2017-12-14 20:20:09 by Hibernate Tools 5.2.6.Final

/**
 * TDept generated by hbm2java
 */
public class TDept implements java.io.Serializable {

	private Integer id;
	private String dname;
	//1-n����Ա����
	private Set<TUser> users=new HashSet<TUser>();
	
	public TDept() {
	}

	public TDept(String dname) {
		this.dname = dname;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDname() {
		return this.dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public Set<TUser> getUsers() {
		return users;
	}

	public void setUsers(Set<TUser> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return "TDept [id=" + id + ", dname=" + dname + "]";
	}
	
}
