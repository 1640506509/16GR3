package com.qhit.lh.gr3.cyh.exam.common;


import java.util.HashSet;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.hql.internal.ast.HqlASTFactory;
import org.junit.jupiter.api.Test;

import com.qhit.lh.gr3.cyh.exam.common.bean.TStudent;
import com.qhit.lh.gr3.cyh.exam.common.bean.TTeacher;
import com.qhit.lh.gr3.cyh.exam.common.bean.TUser;
import com.qhit.lh.gr3.cyh.exam.common.service.BaseService;
import com.qhit.lh.gr3.cyh.exam.common.service.impl.BaseServiceImpl;
import com.qhit.lh.gr3.cyh.exam.common.utils.HibernateSessionFactory;
import com.qhit.lh.gr3.cyh.exam.paper.bean.TPaper;
import com.qhit.lh.gr3.cyh.exam.question.bean.TCourse;
import com.qhit.lh.gr3.cyh.exam.question.bean.TWrittenTest;

class UserTest {
	private BaseService bs = new BaseServiceImpl();

	@Test
	void add() {
		// 账户
		TUser user = new TUser();
		user.setName("1004");
		user.setPwd("123456");
		user.setRole(1);
		// 学生
		TStudent stu = new TStudent();
		stu.setSid("1004");
		stu.setSname("未知");
		stu.setSex("男");
		stu.setEnterSchool("2016");
		stu.setCcode("16GR3");
		stu.setPhoto("头像");
		stu.setBirthday("1998-03-04");
		stu.setIdcard("413645789654223124");
		stu.setPoutlook("无");
		stu.setProvince("河南省");
		stu.setCity("驻马店市");
		stu.setTel("15624763555");
		stu.setAddress("略");
		stu.setPtel("无");
		stu.setPrelation("无");
		stu.setHostelBuil("南3");
		stu.setHostelNo("205");
		stu.setBaseInfo("略");
		stu.setEduBg("无");
		stu.setRemarks("略");

		// 老师
		TTeacher tea = new TTeacher();
		tea.setTname("一班讲师");
		tea.setSex("男");
		tea.setBirthday("未填");
		tea.setEducation("本科");
		tea.setTel("12345678955");
		tea.setPost("讲师");
		tea.setRemarks("未填");
		// 进行关联
		 user.setStudent(stu);
		 stu.setUser(user);
//		user.setTeacher(tea);
//		tea.setUser(user);
		// 保存操作
		bs.add(user);

	}

	@Test
	void add2() {
		// 试卷
		TPaper paper = new TPaper();
		paper.setPname("为了正确的美好");
		paper.setPtime(60);
		paper.setPtotalScore(100);
		paper.setQtotal(0);
		paper.setQscore(100);
		paper.setPtype("笔试");
		paper.setPstate("未考试");
		TCourse course = (TCourse) bs.getObject(TCourse.class, 1);
		paper.setCourse(course);
		Set<TWrittenTest> tests = new HashSet<TWrittenTest>();
		int num = 1024;
		for (int i = 1023; i <= num; i++) {
			System.out.println("for:"+i);
			TWrittenTest writtenTest = (TWrittenTest) bs.getObject(TWrittenTest.class, i);
			tests.add(writtenTest);
		}
//		TWrittenTest writtenTest = (TWrittenTest) bs.getObject(TWrittenTest.class, num);
//		tests.add(writtenTest);
		System.out.println("tests.size():"+tests.size());
		for (TWrittenTest w:tests) {
			System.out.println(w.toString());
		}
		System.out.println(paper.toString());
		paper.setWrittenTests(tests);
		bs.add(paper);

	}

	@Test
	void update() {
		TUser user = (TUser) bs.getObject(TUser.class, 2);
		user.setName("101");
		TTeacher tea = user.getTeacher();
		tea.setTid("101");
		bs.update(tea);
	}

	@Test
	void getNum() {
		Session session = HibernateSessionFactory.getSession();
		Transaction transaction = session.beginTransaction();
		String hql = "select min(w.qid) from TWrittenTest w where w.csId = 1 and w.qtype = '单选' and w.degree = '简单'";
		String hql2 = "select max(w.qid) from TWrittenTest w where w.csId = 1 and w.qtype = '单选' and w.degree = '简单'";
		Query query = session.createQuery(hql);
		Query query2 = session.createQuery(hql2);
		int minqid = (int) query.uniqueResult();
		int maxqid = (int) query2.uniqueResult();
		// List<TWrittenTest> list=query.list();
		// System.out.println(list.get(0).toString());
		System.out.println(minqid);
		System.out.println(maxqid);
		transaction.commit();
		session.close();
	}

}
