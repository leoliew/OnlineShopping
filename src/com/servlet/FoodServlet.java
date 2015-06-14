package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.IFoodBiz;
import com.bizImpl.FoodBizImpl;
import com.bizImpl.UserBizImpl;
import com.dao.IFoodDao;
import com.dao.ITypesDao;
import com.daoImpl.FoodDaoImpl;
import com.daoImpl.TypeDaoImpl;
import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartFiles;
import com.jspsmart.upload.SmartRequest;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.mysql.jdbc.StringUtils;
import com.vo.Foods;
import com.vo.Types;
import com.vo.User;

public class FoodServlet extends HttpServlet {
	private ServletConfig config;
	private IFoodDao foodDao;
	private ITypesDao typesDao;
	private Foods food;
	private IFoodBiz foodBiz;

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		String method = request.getParameter("method");
		System.out.println(method);
		try {
			if (method.equals("index")) {
				// 主页面
				index(request, response);
			} else if (method.equals("addFood")) {
				// 添加食物
				addFood(request, response);
			} else if (method.equals("toBuy")) {
				// 购买食品
				toBuy(request, response);
			} else if (method.equals("toedit")) {
				// 请求编辑食物
				toedit(request, response);
			} else if (method.equals("del")) {
				del(request, response);
			} else if (method.equals("editFood")) {
				editFood(request, response);
			} else if (method.equals("show")) {
				show(request, response);
			}else if(method.equals("checkFood")){
				checkFood(request,response);
			}else if(method.equals("giveup")){
				//放弃购买
				giveup(request,response);
			}
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//放弃购买
	private void giveup(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("mycar");
		request.getRequestDispatcher("/index.jsp?show=cart").forward(
				request, response);
	}

	//检查此食物是否存在
	private void checkFood(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		foodBiz=new FoodBizImpl();
		String foodName= request.getParameter("foodName");
		food=new Foods();
		food.setName(foodName);
		boolean isCheck= foodBiz.checkFood(food);
		if(isCheck==true){
			request.setAttribute("vaild", "y");
		}else {
			request.setAttribute("vaild", "此食物已存在，请更改食物名!");
		}
		request.getRequestDispatcher("/valid/validForm.jsp").forward(request, response);
	}

	// 显示详情
	private void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("fid"));
		foodDao = new FoodDaoImpl();
		food = foodDao.findFoodById(id);
		request.setAttribute("food", food);
		request.getRequestDispatcher("/index.jsp?show=showFood").forward(request,
				response);
	}

	// 编辑食物
	private void editFood(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		food = new Foods();
		foodDao = new FoodDaoImpl();
		int id = Integer.parseInt(request.getParameter("id"));
		String foodName = request.getParameter("foodName");
		food.setName(foodName);
		int typeId = Integer.parseInt(request.getParameter("typeId"));
		food.setType(typeId);
		Double price = Double.parseDouble(request.getParameter("price"));
		food.setPrice(price);
		int isGroup = Integer.parseInt(request.getParameter("isGroup"));
		food.setIsGroup(isGroup);
		Double groupPrice = Double.parseDouble(request
				.getParameter("groupPrice"));
		food.setGroupPrice(groupPrice);
		if (request.getParameter("beginTime") != null) {
			String beginTime = request.getParameter("beginTime");
			// food.setBeginTime(beginTime);
		}
		if (request.getParameter("endTime") != null) {
			String endTime = request.getParameter("endTime");
			// food.setEndTime(endTime);
		}
	    int groupCount=Integer.parseInt(request.getParameter("groupCount"));
	    food.setGroupCount(groupCount);
		if (request.getParameter("details") != null) {
			String details = request.getParameter("details");
			food.setDetails(details);
		}
		// 更新食品
		foodDao.updateFoodById(food, id);
		request.setAttribute("msg", "更新食物成功!");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	// 根据食物id删除食物
	private void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("fid"));
		foodDao = new FoodDaoImpl();
		foodDao.delFoodById(id);
		System.out.println(id);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	// 请求编辑食物
	private void toedit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int fid = Integer.parseInt(request.getParameter("fid"));
		typesDao = new TypeDaoImpl();
		List types = typesDao.findAllTypes();
		System.out.println(fid);
		foodDao = new FoodDaoImpl();
		Foods food = foodDao.findFoodById(fid);
		System.out.println(food);
		request.setAttribute("types", types);// 设置食品类型
		request.setAttribute("food", food);// 设置食物
		request.getRequestDispatcher("/index.jsp?show=updatefood").forward(request,
				response);
	}

	// 购买食品
	private void toBuy(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 拿到食品id
		Integer foodId = Integer.parseInt(request.getParameter("foodId"));
		HttpSession session = request.getSession();
		String opera = request.getParameter("opera");
		Foods food = null;
		foodDao = new FoodDaoImpl();
		Map<Integer, Foods> mycar = null;
		// 如果集合没有购物车
		if (session.getAttribute("mycar") != null) {
			System.out.println("购物车不为空");
			mycar = (Map<Integer, Foods>) session.getAttribute("mycar");
			// 根据fid到购物车去取对象
			// 如果没有
			if (mycar.get(foodId) == null) {
				// 从数据库中查询一个食品
				food = foodDao.findFoodById(foodId);
				// 将食品添加到购物车中
				food.setBuyCount(1);
				mycar.put(foodId, food);
			} else {
				// 数量加1
				if (opera != null && opera.equals("add")) {
					// 购物车中的操作，添加食物数量
					food = mycar.get(foodId);
					food.setBuyCount(food.getBuyCount() + 1);
					mycar.put(foodId, food);
					request.getRequestDispatcher("/index.jsp?show=cart").forward(
							request, response);
					return;
				} else if (opera != null && opera.equals("del")) {
					// 购物车中的操作，减少食物数量
					food = mycar.get(foodId);
					if (food.getBuyCount() == 1) {
						mycar.remove(foodId);
					} else {
						food.setBuyCount(food.getBuyCount() - 1);
						mycar.put(foodId, food);
					}
					session.setAttribute("mycar", mycar);
					request.getRequestDispatcher("/index.jsp?show=cart").forward(
							request, response);
					return;
				} else if (opera != null && opera.equals("cancel")) {
					// 购物车中的操作，取消购买当前食物
					mycar.remove(foodId);
					session.setAttribute("mycar", mycar);
					request.getRequestDispatcher("/index.jsp?show=cart").forward(
							request, response);
					return;
				}
				// 如果没有指定任何操作，默认添加食物
				food = mycar.get(foodId);
				food.setBuyCount(food.getBuyCount() + 1);
				mycar.put(foodId, food);
			}
		} else {
			// 如果购物车为空
			mycar = new HashMap<Integer, Foods>();
			food = foodDao.findFoodById(foodId);
			System.out.println(food);
			food.setBuyCount(1);
			mycar.put(foodId, food);
		}
		session.setAttribute("mycar", mycar);
		// 查询跳回index页面
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	// 添加食品
	private void addFood(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,
			SmartUploadException {
		foodDao = new FoodDaoImpl();
		food = new Foods();
		// 创建上传组件对象
		SmartUpload smartUpload = new SmartUpload();
		// 执行init初始化工作
		smartUpload.initialize(config, request, response);
		// 上传操作
		smartUpload.upload();
		// 重新取得Request
		SmartRequest smartRequest = smartUpload.getRequest();
		String foodName = smartRequest.getParameter("foodName");
		food.setName(foodName);// 名称
		int type = Integer.parseInt(smartRequest.getParameter("typeId"));
		food.setType(type);// 类型
		Double price = Double.parseDouble(smartRequest.getParameter("price"));
		food.setPrice(price);
		int isGroup = Integer.parseInt(smartRequest.getParameter("isGroup"));
		food.setIsGroup(isGroup);
		double groupPrice = Double.parseDouble(smartRequest
				.getParameter("groupPrice"));
		food.setGroupPrice(groupPrice);
		if (smartRequest.getParameter("beginTime") != null) {
			String beginTime = smartRequest.getParameter("beginTime");
			// food.setBeginTime(beginTime);
		}
		if (smartRequest.getParameter("endTime") != null) {
			String endTime = smartRequest.getParameter("endTime");
			// food.setEndTime(endTime);
		}
		int groupCount = Integer.parseInt(smartRequest
				.getParameter("groupCount"));
		food.setGroupCount(groupCount);
		if (smartRequest.getParameter("details") != null) {
			String details = smartRequest.getParameter("details");
			System.out.println(details);
			food.setDetails(details);
		}
		food.setSold(0);
		// 取得请求中的上传文件列表
		SmartFiles smartFiles = smartUpload.getFiles();
		// 上传文件列表中的第一个文件
		SmartFile smartFile = smartFiles.getFile(0);
		String foodPic = "images/pic/" + smartFile.getFileName();
		food.setFoodPic(foodPic);
		foodDao.saveFood(food);
		// 判断用户是否选中文件
		if (!smartFile.isMissing()) {
			
			System.out.println("文件名>>>" + smartFile.getFileName());
			String realPath = request.getSession().getServletContext()
					.getRealPath("/");
			smartFile.saveAs(
					realPath + "/images/pic/" + smartFile.getFileName(),
					smartFile.SAVEAS_PHYSICAL);
			request.setAttribute("msg", "保存成功");
			index(request, response);
		}else {
			request.setAttribute("msg", "保存失败，请检查是否添加了图片");
			index(request, response);
		}
	}

	// 跳转到主页面
	private void index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		foodDao = new FoodDaoImpl();
		typesDao = new TypeDaoImpl();

		List<Types> types = typesDao.findAllTypes();
		int pageNo = 1;// 页码
		int pageSize = 6;// 显示的记录数
		int totalPage = 0;// 总行数
		int rowCount;// 查询到的总记录数
		List<Foods> foods;// 根据条件查询到的食品
		if (request.getParameter("pageNo") != null) {
			pageNo = Integer.parseInt(request.getParameter("pageNo"));
		}
		//如果tid为空或者为null
		if (StringUtils.isNullOrEmpty(request.getParameter("tid"))) {
			foods = foodDao.findPageFoods(pageNo, pageSize);
			rowCount = foodDao.findRowCount();
		} else {
			// 根据食品类型分页
			int tid = Integer.parseInt(request.getParameter("tid"));
			request.setAttribute("tid", tid);// 设置tid，便于分类之后分页
			foods = foodDao.findFoodsByTypeId(tid, pageNo, pageSize);
			rowCount = foodDao.findRowCountByTypeId(tid);
			// 查询全部食品分页
		}
		// 把当前页放到request作用域
		request.setAttribute("currentPage", pageNo);
		// 把食物放到request作用域
		request.setAttribute("foods", foods);
		// 把食物类型放到request作用域
		request.setAttribute("types", types);
		request.setAttribute("allCount", rowCount);
		// 计算总页数
		if (rowCount % pageSize > 0) {
			totalPage = rowCount / pageSize + 1;
		} else {
			totalPage = rowCount / pageSize;
		}
		request.setAttribute("totalPage", totalPage);
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

}
