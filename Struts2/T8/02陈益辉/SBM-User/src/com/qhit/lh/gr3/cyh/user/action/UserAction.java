/**
 * 
 */
package com.qhit.lh.gr3.cyh.user.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.qhit.lh.gr3.cyh.user.bean.User;
import com.qhit.lh.gr3.cyh.user.service.UserService;
import com.qhit.lh.gr3.cyh.user.service.impl.UserServiceImpl;

/**
 * @author 辉少 TODO 2017年12月8日下午5:23:31
 */
public class UserAction extends ActionSupport {
	private User user;
	private List<User> userlist;
	private UserService us = new UserServiceImpl();
	private File userpic;
	private String userpicFileName;
	private String userpicContentType;
	private String pic;

	public String login() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		boolean canLogin = true;// 是否非空，false为空，true非空
		String userName = user.getUserName();
		String userPassword = user.getUserPassword();

		User user = us.getUser(userName, userPassword);// userId查出来了
		if (user == null) {// 如果未查出该用户，证明账户列表里没有该用户，Pass!!!
			super.addFieldError("EXP", "账号或密码错误,请重新输入~");
			return "index";
		} else {
			canLogin = true;
		}
		System.out.println(canLogin);// 输出是否可以登录
		System.out.println("user是否为空" + canLogin);
		User user1 = (User) session.getAttribute("user");// user1已经是有ID的

		String upPwd = (String) session.getAttribute("upPwd");
		// 接下来执行判断操作！！！
		if (upPwd != null && user1 != null) {// 以前登陆过
			System.out.println("user1.getUserPassword()" + user1.getUserPassword());
			System.out.println("upPwd" + upPwd);
			canLogin = true;// 通过
			if (user.getUserId() == user1.getUserId() && user.getUserPassword() == user1.getUserPassword()) {// 如果修改过密码了ID密码还和session里user一致的话Pass!!!
				super.addFieldError("EXP", "您已经修改过密码!");
				canLogin = false;// Pass!!!
			}
		} else {// 以前没有登陆过
			canLogin = true;// 通过
		}
		if (canLogin == true) {
			// 如果canLogin为true则可以通过，可以验证登陆了
			session.setAttribute("user", user);
			if (ServletActionContext.getServletContext().getAttribute("users") == null) {
				List<User> users = new ArrayList<User>();
				ServletActionContext.getServletContext().setAttribute("users", users);
			}
			List<User> users = (List<User>) ServletActionContext.getServletContext().getAttribute("users");
			if (users.size() == 0) {
				users.add(user);
				ServletActionContext.getServletContext().setAttribute("users", users);
				return "userSuccess";
			} else {
				int v = -1;
				// 如果当前userID为重复登录则直接跳转，不放入usersList
				for (User use : users) {
					if (use.getUserId() == user.getUserId()) {
						v = 1;
						// ServletActionContext.sendRedirect("AccountServlet?cmd=getPageBean");
						// return;
						return "userSuccess";
					}
				}
				if (v == -1) {
					users.add(user);
					ServletActionContext.getServletContext().setAttribute("users", users);
					return "userSuccess";
				}
			}
		} else {
			// 如果canLogin为false就回去重登！！！
			return "index";
		}
		return null;
	}

	public String userlist() {
		userlist = us.getAllUser();
		return "userAdmin";
	}

	public String fileUpload() {
		if (userpic != null) {
			System.out.println("fileupUser");
			try {
				// 输入流,读进电脑
				InputStream is = new FileInputStream(userpic);
				// 创建路径
				String path = ServletActionContext.getServletContext().getRealPath("/") + "upload";
				File file = new File(path);
				if (!file.exists()) {
					file.mkdirs();
				}
				pic = "upload/" + userpicFileName;
				System.out.println(pic);
				user.setPic(pic);
				// 输出流,输出到相对路径文件userpicFileName里
				FileOutputStream os = new FileOutputStream(path + "/" + userpicFileName);
				// 每次读写8096字节
				byte[] buffer = new byte[8096];
				int len = 0;
				while ((len = is.read(buffer)) != -1) {
					os.write(buffer, 0, len);
				}
				// 关闭输入输出流
				is.close();
				os.flush();
				os.close();
				us.insertUser(user);
				return "Success";
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				super.addFieldError("add", "上传文件失败,请重试!");
				return "userAdd";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				super.addFieldError("add", "未找到文件!");
				return "userAdd";
			}
		} else {
			super.addFieldError("add", "未找到文件!");
			return "userAdd";
		}

	}

	public String delUser() {
		int row = us.delUser(user.getUserId());
		if (row > 0) {
			return "Success";
		} else {
			super.addFieldError("admin", "删除失败!");
			return "userAdmin";
		}
	}

	public String getUserById() {
		System.out.println("getUserById");
		user = us.getUserById(String.valueOf(user.getUserId()));
		return "update";
	}

	public String uptUser() {
		if (userpic != null) {
			// 输入流,读进电脑
			try {
				InputStream is = new FileInputStream(userpic);
				// 创建路径
				String path = ServletActionContext.getServletContext().getRealPath("/") + "upload";
				File file = new File(path);
				if (!file.exists()) {
					file.mkdirs();
				}
				pic = "upload/" + userpicFileName;
				System.out.println(pic);
				user.setPic(pic);
				// 输出流,输出到相对路径文件userpicFileName里
				FileOutputStream os = new FileOutputStream(path + "/" + userpicFileName);
				// 每次读写8096字节
				byte[] buffer = new byte[8096];
				int len = 0;
				while ((len = is.read(buffer)) != -1) {
					os.write(buffer, 0, len);
				}
				// 关闭输入输出流
				is.close();
				os.flush();
				os.close();

				System.out.println("uptUser");
				System.out.println(user.toString());
				int row = us.upUser(user, user.getUserId());
				if (row > 0) {
					return "Success";
				} else {
					super.addFieldError("admin", "删除失败!");
					return "userAdmin";
				}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				super.addFieldError("upt", "未找到文件!");
				return "userUp";
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				super.addFieldError("upt", "未找到文件!");
				return "userUp";
			}
		} else {
			super.addFieldError("upt", "未找到文件!");
			return "userUp";
		}
	}

	public String getUserByInfo() {
		userlist = us.getUserByName(user.getUserName());
		return "userAdmin";
	}

	public String exit() {
		ServletContext aplctn = ServletActionContext.getServletContext();
		List<User> users = (List<User>) aplctn.getAttribute("users");
		users.remove(user);
		aplctn.setAttribute("users", users);
		ServletActionContext.getRequest().getSession().invalidate();
		try {
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print("<script>window.top.location.href='http://localhost:8080/SBM-User/index.jsp'</script>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the userlist
	 */
	public List<User> getUserlist() {
		return userlist;
	}

	/**
	 * @param userlist
	 *            the userlist to set
	 */
	public void setUserlist(List<User> userlist) {
		this.userlist = userlist;
	}

	/**
	 * @return the us
	 */
	public UserService getUs() {
		return us;
	}

	/**
	 * @param us
	 *            the us to set
	 */
	public void setUs(UserService us) {
		this.us = us;
	}

	/**
	 * @return the userpic
	 */
	public File getUserpic() {
		return userpic;
	}

	/**
	 * @param userpic
	 *            the userpic to set
	 */
	public void setUserpic(File userpic) {
		this.userpic = userpic;
	}

	/**
	 * @return the userpicFileName
	 */
	public String getUserpicFileName() {
		return userpicFileName;
	}

	/**
	 * @param userpicFileName
	 *            the userpicFileName to set
	 */
	public void setUserpicFileName(String userpicFileName) {
		this.userpicFileName = userpicFileName;
	}

	/**
	 * @return the userpicContentType
	 */
	public String getUserpicContentType() {
		return userpicContentType;
	}

	/**
	 * @param userpicContentType
	 *            the userpicContentType to set
	 */
	public void setUserpicContentType(String userpicContentType) {
		this.userpicContentType = userpicContentType;
	}

	/**
	 * @return the pic
	 */
	public String getPic() {
		return pic;
	}

	/**
	 * @param pic
	 *            the pic to set
	 */
	public void setPic(String pic) {
		this.pic = pic;
	}

}
