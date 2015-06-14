package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.IUserBiz;
import com.bizImpl.UserBizImpl;
import com.dao.IUserDao;
import com.daoImpl.UserDaoImpl;
import com.vo.User;

public class UserServlet extends HttpServlet {
	private User user;
	private IUserDao userDao;
	private IUserBiz userBiz;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String method = request.getParameter("method");
		try {
			if (method.equals("reg")) {
				// 注册方法
				reg(request, response);
			} else if (method.equals("login")) {
				// 登录方法
				login(request, response);
			}else if(method.equals("toupdate")){
				//请求修改个人信息
				toupdate(request,response);
			}else if(method.equals("update")){
				//修改用户信息
				update(request,response);
			}else if(method.equals("logout")){
				logout(request,response);
			}else if(method.equals("manage")){
				manage(request,response);
			}else if(method.equals("recharge")){
				recharge(request,response);
			}else if(method.equals("checkReg")){
				checkReg(request,response);
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
 
	//注册时检查用户名是否存在
	private void checkReg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		userBiz=new UserBizImpl();
		String userName= request.getParameter("userName");
		user=new User();
		user.setUserName(userName);
		user= userBiz.checkUser(user);
		if(user!=null){
			request.setAttribute("vaild", "此用户已存在，请更改用户名!");
		}else {
			request.setAttribute("vaild", "y");
		}
		request.getRequestDispatcher("/valid/validForm.jsp").forward(request, response);
	}

	//为用户充值
	private void recharge(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		Double money=Double.parseDouble(request.getParameter("money"));
		userDao=new UserDaoImpl();
		user= userDao.findUserById(id);
		user.setAcount(user.getAcount()+money);
		userDao.updateUserById(user, id);
		manage(request, response);
	}

	//管理用户
	private void manage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userDao=new UserDaoImpl();
		//查询所有的用户放到request作用域
		List<User> userList= userDao.findAllUser();
		request.setAttribute("userList",userList);
		request.getRequestDispatcher("/index.jsp?show=manageuser").forward(request, response);
	}

	//注销用户
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("mycar");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	//修改用户信息
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		user=new User();
		String realName=request.getParameter("realName");
		String sex=request.getParameter("sex");
		String phone=request.getParameter("phone");
		String addr=request.getParameter("addr");
		String qq=request.getParameter("qq");
		user.setRealName(realName);
		user.setSex(sex);
		user.setPhone(phone);
		user.setAddr(addr);
		user.setQq(qq);
		userDao=new UserDaoImpl();
		userBiz=new UserBizImpl();
		userDao.updateUserById(user, id);
		//重新获取user
		user=userBiz.checkUser(user);
		request.setAttribute("msg", "更新用户信息成功!");
		request.getSession().setAttribute("user", user);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	//请求修改个人信息
	private void toupdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			int id=Integer.parseInt(request.getParameter("id"));
			userDao=new UserDaoImpl();
			user= userDao.findUserById(id);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/index.jsp?show=updateuser").forward(request, response);
			
	}

	/**
	 * 用户登录
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 * @throws ServletException
	 */
	private void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		userBiz = new UserBizImpl();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		// 先判断是否有用户名密码
		// 再判断用户是否存在，存在则返回此用户
		user = userBiz.checkUser(user);
		if (user != null) {
			System.out.println("登录成功");
			request.setAttribute("msg", "登录成功，按确定为您跳转到主页!");
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
		}else{
			request.setAttribute("msg", "登录失败，请检查用户名或者密码是否正确!");
			request.getRequestDispatcher("/index.jsp?show=login").forward(request,
					response);
		}
	}

	/**
	 * 注册用户
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		userDao = new UserDaoImpl();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String realName = request.getParameter("realName");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String qq = request.getParameter("qq");
		Timestamp d = new Timestamp(System.currentTimeMillis());
		user = new User(userName, password, realName, sex, phone, addr, qq,
				null, 0.0, 1, d);
		userDao.saveUser(user);
		request.getRequestDispatcher("/index.jsp").forward(request,
				response);
	}

}
