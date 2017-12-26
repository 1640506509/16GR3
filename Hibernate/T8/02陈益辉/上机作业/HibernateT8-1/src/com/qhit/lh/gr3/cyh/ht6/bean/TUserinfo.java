package com.qhit.lh.gr3.cyh.ht6.bean;
// Generated 2017-12-20 20:21:49 by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

/**
 * TUserinfo generated by hbm2java
 */
public class TUserinfo implements java.io.Serializable {

	private int uid;
	private String uname;
	private String upwd;
	
	private Set<TRole> roles=new HashSet<TRole>();
	public TUserinfo() {
	}

	

	public TUserinfo(int uid, String uname, String upwd, Set<TRole> roles) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.roles = roles;
	}



	public int getUid() {
		return this.uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return this.upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public Set<TRole> getRoles() {
		return roles;
	}

	public void setRoles(Set<TRole> roles) {
		this.roles = roles;
	}


	@Override
	public String toString() {
		return "TUserinfo [uid=" + uid + ", uname=" + uname + ", upwd=" + upwd + "]";
	}

	
}
