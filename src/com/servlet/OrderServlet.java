package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.IFoodBiz;
import com.bizImpl.FoodBizImpl;
import com.dao.IFoodDao;
import com.dao.IOrderListsDao;
import com.dao.IOrdersDao;
import com.dao.IUserDao;
import com.daoImpl.FoodDaoImpl;
import com.daoImpl.OrderListsDaoImpl;
import com.daoImpl.OrdersDaoImpl;
import com.daoImpl.UserDaoImpl;
import com.vo.Foods;
import com.vo.OrderLists;
import com.vo.Orders;
import com.vo.User;

public class OrderServlet extends HttpServlet {
private Orders orders;
private IOrdersDao ordersDao;
private IOrderListsDao orderListsDao;
private OrderLists orderLists;
private Foods food;
private User user;
private IUserDao userDao;
private IFoodDao foodDao;
private IFoodBiz foodBiz;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) {
			String method=request.getParameter("method");
			try {
				if(method.equals("placeOrder")){
					placeOrder(request,response);
				}else if(method.equals("confirmOrder")){
					confirmOrder(request,response);
				}else if(method.equals("listOrders")){
					//普通用户管理订单
					listOrders(request,response);
				}else if(method.equals("Orderdetails")){
					Orderdetails(request,response);
				}else if(method.equals("manage")){
					manage(request,response, 1);
				}else if(method.equals("change")){
					//改变订单状态
					change(request,response);
				}else if(method.equals("del")){
					//删除此订单
					del(request,response);
				}
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
	}

	//删除此订单
	private void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		ordersDao=new OrdersDaoImpl();
		ordersDao.delOrderById(id);
		manage(request, response,1);
	}


	//改变订单状态
	private void change(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id= Integer.parseInt(request.getParameter("id"));
		 ordersDao=new OrdersDaoImpl();
		 orders =ordersDao.findOrdersByOrderId(id);
		 //获取订单状态
		 int status=Integer.parseInt(request.getParameter("status"));
		 //改变orders状态
		 orders.setStatus(status);
		 //更新到orders表
		 ordersDao.updateOrdersById(orders, id);
		 manage(request, response,status);
	}


	//管理订单
	private void manage(HttpServletRequest request, HttpServletResponse response ,int status) throws ServletException, IOException {
		ordersDao=new OrdersDaoImpl();
		List orders=ordersDao.findAllOrders();
		request.setAttribute("orders",orders);
		if(status==1){
			//要改变的状态为已送餐的，跳转到管理员页面
		request.getRequestDispatcher("/index.jsp?show=adminorder").forward(request, response);
		}else if(status==2){
			//改变状态为确认送餐，跳转到普通用户订单管理页面
			request.getRequestDispatcher("/index.jsp?show=userorder").forward(request, response);
		}
	}

	//查看订单详情
	private void Orderdetails(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String orderId=request.getParameter("orderId");
		orderListsDao=new OrderListsDaoImpl();
		List<OrderLists> orderLists= orderListsDao.findOrderListsByOrderId(orderId);
		request.setAttribute("size",orderLists.size());//记录的数量
		request.setAttribute("orderLists", orderLists);
		request.getRequestDispatcher("/index.jsp?show=orderdetails").forward(request, response);
	}


	//普通用户查看订单 
	private void listOrders(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		ordersDao=new OrdersDaoImpl();
		Integer userId=Integer.parseInt(request.getParameter("userId"));
		//根据用户id查找订单
		List<Orders> orders= ordersDao.findOrdersByUserId(userId);
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/index.jsp?show=userorder").forward(request, response);
	}


	//确认订单 把数据写入order表 同时写入orderLists表
	private void confirmOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		 orders=new Orders();
		 orderLists=new OrderLists();
		 ordersDao=new OrdersDaoImpl();
		 orderListsDao =new OrderListsDaoImpl();
		 userDao=new UserDaoImpl();
		 foodDao=new FoodDaoImpl();
		 foodBiz=new FoodBizImpl();
		 Foods upDatefood=new Foods();//用更新食物销量的Foods实例
		User u=(User)request.getSession().getAttribute("user");//获取当前用户
		int userId=u.getId();
		 user=userDao.findUserById(userId);//根据id查找用户
		 Double sumPrice=Double.parseDouble(request.getParameter("sumPrice"));//先查询余额，看是否能够支付
		double balance=user.getAcount()-sumPrice;
		if(balance>=0){
			//足够余额支付
			user.setAcount(balance);
			userDao.updateUserById(user, userId);//更新余额
		String orderId=	request.getParameter("orderId");
		orders.setOrderId(orderId);
		orderLists.setListId(orderId);	
		orders.setUserId(userId);//保存用户id
		orderLists.setUserId(userId);
		String realName=request.getParameter("realName");
		orders.setRealName(realName);
		String addr=request.getParameter("addr");
		orders.setAddr(addr);
		String phone=request.getParameter("phone");
		orders.setPhone(phone);
		if(request.getParameter("notice")!=null){
			String notice=request.getParameter("notice");
			orders.setNotice(notice);
		}
		
		orders.setTotal(sumPrice);
		Timestamp d=new Timestamp(System.currentTimeMillis());//获取当前时间
		orders.setTime(d);
		orders.setStatus(0);
		ordersDao.saveOrder(orders);
		//保存订单信息到订单列表
		Map<Integer, Foods> mycar = (Map<Integer, Foods>) request.getSession().getAttribute("mycar");
		for (Map.Entry<Integer, Foods> enty : mycar.entrySet()) {
//			System.out.println("食品id:" + enty.getKey() + ";购买数量:"
//					+ enty.getValue().getBuyCount());
				food=enty.getValue();
				orderLists.setFid(enty.getKey());//保存食品id
				//更新食物销量
				upDatefood=new Foods();
				upDatefood.setId(enty.getKey());
				orderLists.setFname(food.getName());//保存食品名称
				orderLists.setFtype(food.getType());//保存食品类型
				orderLists.setFprice(food.getPrice());//保存食品价格
				orderLists.setFcount(food.getBuyCount());//保存此食品购买数量
				orderLists.setFtotal(food.getBuyCount()*food.getPrice());
				orderListsDao.saveOrderLists(orderLists);
				
				upDatefood =foodBiz.findFoodsByCondition(upDatefood);
				upDatefood.setSold(upDatefood.getSold()+food.getBuyCount());
				//更新食物销量
				foodDao.updateFoodById(upDatefood, enty.getKey());
		}
		//移除购物车中的食品
		request.getSession().removeAttribute("mycar");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		}else {
			//不够余额支付
			//返回购物车页面
			request.setAttribute("msg", "余额不足以支付，请充值");
			request.getRequestDispatcher("/index.jsp?show=cart").forward(request, response);
		}
	}
	
	//下订单
	private void placeOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if(request.getAttribute("orderId")==null){
			request.setAttribute("orderId", new Date().getTime());
		}
		String sumPrice=request.getParameter("sumPrice");
		request.setAttribute("sumPrice", sumPrice);
		request.getRequestDispatcher("/index.jsp?show=pay").forward(request, response);
	}
}
