package tests;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.Test;

import com.qhit.lh.gr3.cyh.ht6.bean.TRole;
import com.qhit.lh.gr3.cyh.ht6.bean.TUserinfo;
import com.qhit.lh.gr3.cyh.ht6.service.BaseService;
import com.qhit.lh.gr3.cyh.ht6.service.impl.BaseServiceImpl;

class Test1 {
	private BaseService bs = new BaseServiceImpl();

	@Test
	void add() {
		TRole role = new TRole();
		role.setRname("普通管理员1");
		role.setRmsg("普通权限1");

		TUserinfo info = new TUserinfo();
		info.setUname("小明1");
		info.setUpwd("1234561");

		role.getInfos().add(info);
			
		bs.add(role);
//		TRole role = new TRole();
//		role.setRname("超级管理员");
//		role.setRmsg("最高权限");
//
//		TUserinfo info = new TUserinfo();
//		info.setUname("陈益辉");
//		info.setUpwd("123456");
//
//		role.getInfos().add(info);
//		
//			
//		bs.add(role);
	}
	
	@Test
	void del() {
//		TRole role = (TRole) bs.getObject(TRole.class, 8);
//		bs.delete(role);
//		
		TUserinfo info=(TUserinfo) bs.getObject(TUserinfo.class, 5);
		bs.delete(info);
	}
	
	@Test
	void upd() {
		TRole role = (TRole) bs.getObject(TRole.class, 1);
		role.setRname("超级管理员");
		role.setRmsg("最高权限");

		Set<TUserinfo> infos=role.getInfos();
		for(TUserinfo info:infos) {
			info.setUpwd("456789");
		}
			
		bs.update(role);
	}
	
	@Test
	void getAll() {
		TRole role = (TRole) bs.getObject(TRole.class, 10);
		System.out.println();
		Set<TUserinfo> infos=role.getInfos();
		for(TUserinfo info:infos) {
			System.out.println(role.toString());
			System.out.println(info.toString());
		}
	}
}
